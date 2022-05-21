FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Name.name}
    first_name            {Faker::Name.name}
    last_name_katakana    {Name.name}
    first_name_katakana   {Name.name} 
    birthday              {Faker::Internet.free_date}
  end
end