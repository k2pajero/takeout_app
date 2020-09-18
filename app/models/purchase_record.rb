class PurchaseRecord < ApplicationRecord
  belongs_to :user
  has_many :purchase_record_items, dependent: :destroy
  has_many :items, through: :purchase_record_itemts
end
