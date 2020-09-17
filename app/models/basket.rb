class Basket < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :items, through: :basket_items

  def total_price
    total_jpy_price
    # binding.pry
  end

  private
  def total_jpy_price
    items.sum(:price)
  end
end
