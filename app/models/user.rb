class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数文字を使用してください' }
    validates :real_family_name,    format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :real_first_name,     format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :reading_family_name, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナ文字を使用してください' }
    validates :reading_first_name,  format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナ文字を使用してください' }
    validates :birthday
  end

  has_one :address
  has_one :basket, dependent: :destroy
  has_one :purchase_record, dependent: :destroy
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # binding.pry
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
    nickname: auth.info.name,
      email: auth.info.email
  )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
  user
  end

  def prepare_basket
    basket || create_basket
  end

  def prepare_purchase_record
    purchase_record || create_purchase_record
  end

  def checkout!(token, item_ids:)
    total = basket.total_price
    # total = basket.total_price(item_ids: item_ids)←エラー

    transaction do
      basket_items = basket.basket_items.where(item_id: item_ids)
      basket_items.each(&:destroy!)
      # A：買い物かご中身を削除する処理

      purchase_record = prepare_purchase_record
      ids = item_ids.map { |id| { item_id: id } }
      purchase_record.purchase_record_items.create!(ids)
      # B：購入履歴をレコードに保存する処理
    end
    # ABの処理をブロックで囲み、１つの処理として扱うトランザクション処理にする

    Charge.create!(total, token)
  end
end
