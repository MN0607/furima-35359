FactoryBot.define do
  factory :user do
    gimei = Gimei.name 
    
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {'田中'}
    last_name             {'太郎'}
    first_name_hurigana   {'タナカ'}
    last_name_hurigana    {'タロウ'}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end