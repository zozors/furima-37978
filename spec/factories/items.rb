FactoryBot.define do
  factory :item do
    title                        { Faker::Name.initials(number: 2) }
    content                      { Faker::Lorem.sentence(word_count: 10) }
    category_id                     { 2 }
    situation_id                    { 2 }
    burden_of_shipping_charge_id    { 2 }
    prefecture_id                   { 2 }
    shipping_day_id                 { 2 }
    price                        { '500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
