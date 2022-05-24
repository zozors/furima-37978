FactoryBot.define do
  factory :item do
    title                        { Faker::Name.initials(number: 2) }
    content                      { Faker::Lorem.sentence(word_count: 10) }
    category                     { Category.all.sample }
    situation                    { Situation.all.sample }
    burden_of_shipping_charge    { BurdenOfShippingCharge.all.sample }
    prefecture                   { Prefecture.all.sample }
    shipping_day                 { ShippingDay.all.sample}
    price                        { '500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
