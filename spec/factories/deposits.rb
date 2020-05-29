FactoryBot.define do
  factory :deposit do
    value { Faker::Number.decimal( r_digits: 2) }
    account
  end
end
