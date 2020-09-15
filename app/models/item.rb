
class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :saize_category_id, presence: true
  validates :genre_category_id, presence: true
  validates :price, presence: true
  validates :unit, presence: true

end
