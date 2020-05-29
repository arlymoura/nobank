FactoryBot.define do
  factory :withdrawal do
    value { Faker::Number.decimal( r_digits: 2) }
    account
  end
end
