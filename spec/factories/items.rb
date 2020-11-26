FactoryBot.define do
  factory :item do
    name                     {'ジャケット'}
    description              {'着心地がいい'}
    category_id              { 2 }
    condition_id             { 2 }
    shipping_charges_id      { 1 }
    shipping_area_id         { 2 }
    shipping_day_id          { 2 }
    price                    { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

