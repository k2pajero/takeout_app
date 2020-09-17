class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :saize_category
  belongs_to_active_hash :genre_category
  belongs_to_active_hash :speed
  has_one_attached :image
  has_many :basket_items, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :saize_category_id, numericality: { other_than: 0 }
    validates :genre_category_id, numericality: { other_than: 0 }
    validates :speed_id, numericality: { other_than: 0 }
    validates :price
  end
end
