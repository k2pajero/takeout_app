class Basket < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :items, through: :basket_items
end
