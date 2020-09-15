class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  POSTAL_CODE_REGEX = /\A[0-9]{3}[-][0-9]{4}\z/.freeze
  TELL_NUMBER_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, messsgge: '「-」も入力してください' }
    validates :city
    validates :address
    validates :tell, format: { with: TELL_NUMBER_REGEX, message: '半角数字で入力してください。「-」は不要です' },
                     length: { maximum: 11 }
  end
end
