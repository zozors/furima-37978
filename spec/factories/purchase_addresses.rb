FactoryBot.define do
  factory :purchase_address do
      post_code                 { '000-0000' }
      prefecture_id             { 4 }
      municipalities            { '仙台市' }
      address                   { '青葉区' }
      building_name             { 'マンション102' }
      telephone_number          { '0000000000' }
      token                     {"tok_abcdefghijk00000000000000000"}
  end
end
