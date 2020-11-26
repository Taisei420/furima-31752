class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day_
  
  has_one_attached :image
  belongs_to :user
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates_inclusion_of :price,in:300..9999999
  end
end
