class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day
  
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0 }
    validates :condition_id, numericality: { other_than: 0}
    validates :shipping_charge_id, numericality: { other_than: 0 }
    validates :shipping_area_id, numericality: { other_than: 0 }
    validates :shipping_day_id, numericality: { other_than: 0 }
    validates_inclusion_of :price,in:300..9999999
  end
end
