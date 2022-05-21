FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Internet.free_name}
    fiest_name            {Faker::Internet.free_name}
    last_name_katakana    {Faker::Internet.free_name}
    first_name_katakana   {Faker::Internet.free_name} 
    birthday              {Faker::Internet.free_date}
  end
end