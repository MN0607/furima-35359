FactoryBot.define do
  factory :order_address do
    postal_code   {'123-4567'}
    prefecture_id {2}
    municipality  {"横浜市緑区"}
    house_number  {"青山1-1-1"}
    building_name {"マンション"}
    phone_number  {12345678910}
  end
end
