FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    municipality  { '横浜市緑区' }
    house_number  { '青山1-1-1' }
    building_name { 'マンション' }
    phone_number  { 12_345_678_910 }
  end
end
