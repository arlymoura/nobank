FactoryBot.define do
  factory :transfer_rate do
    value { Faker::Number.decimal( r_digits: 2) }
    transfer
  end
end
