class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

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

  def prepare_basket
    basket || create_basket
  end
  
  def prepare_purchase_record
    purchase_record || create_purchase_record
  end

  def checkout!(token, item_ids:)
    total = basket.total_price

    transaction do
      basket_items = basket.basket_items.where(item_id: item_ids)
      basket_items.each(&:destroy!)

      purchase_record = prepare_purchase_record
      ids = item_ids.map { |id| { item_id: id } }
      purchase_record.purchase_record_items.create!(ids)
    end

    Charge.create!(total, token)
  end
end
