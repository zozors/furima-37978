FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + "a1"}
    password_confirmation { password }
    last_name             { "山田"}
    first_name            { "太郎"}
    last_name_katakana    { 'ヤマダ' }
    first_name_katakana   { 'タロウ' }
    birthday              { '2000/02/02' }
  end
end
