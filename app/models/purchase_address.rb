class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :potal_code, :shipping_area_id, :municipality, :block, :building_number, :phone_number, :user_id, :item_id, :purchase_id, :token
  
  with_options presence: true do
    validates :potal_code,         format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_area_id,   numericality: { other_than: 0 }
    validates :municipality
    validates :block
    validates :phone_number,       format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create!(potal_code: potal_code, shipping_area_id: shipping_area_id, municipality: municipality, block: block, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end  

end