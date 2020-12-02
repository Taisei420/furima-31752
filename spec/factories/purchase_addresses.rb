FactoryBot.define do
  factory :purchase_address do
    potal_code         { 123-4567 }
    shipping_area_id   { 1 }
    municipality       {'札幌'}
    block              { 1-2-3 }
    phone_number       { 09012345678 }

  


  end
end
