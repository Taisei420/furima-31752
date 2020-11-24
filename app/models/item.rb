class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
    validates :user
  end
end
