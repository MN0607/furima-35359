FactoryBot.define do
  factory :item do
    trade_name         { Faker::Lorem.sentence(word_count: 1) }
    explanation        { Faker::Lorem.sentence(word_count: 3) }
    category_id        { 2 }
    status_id          { 2 }
    shipping_charge_id { 2 }
    prefecture_id      { 2 }
    days_to_ship_id    { 2 }
    price              { 300 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
