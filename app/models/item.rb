
class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :saize_category_id
    validates :genre_category_id
    validates :price
    validates :unit
  end

  
end
