FactoryBot.define do
  factory :item do
    association :user
    product_name { '電話レンジ' }
    description { '某' }
    category_id {2}
    status_id {2}
    burden_id {2}
    area_id {2}
    days_ship_id {2}
    price {500000}
    

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end
