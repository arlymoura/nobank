FactoryBot.define do
  factory :account do
    balance { Faker::Number.decimal( r_digits: 2) }
    agency { Faker::Bank.account_number(digits: 4) }
    account_number { Faker::Bank.account_number(digits: 13) }
    status { true }
    user
  end
end
