FactoryBot.define do
  factory :transfer do
    value { Faker::Number.decimal( r_digits: 2) }
    account
  end
end
