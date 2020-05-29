class Account < ApplicationRecord
  before_create :assign_unique_account_number
  belongs_to :user
  
  validates :account_number, presence: true, if: -> { account_number.present? }
  validates :account_number, uniqueness: true, if: -> { account_number.present? }
  validates_numericality_of :balance, :greater_than_or_equal_to => 0.0
  
  private

  ACCOUNT_NUMBER_RANGE = (10_000..99_999)

  def assign_unique_account_number
    self.account_number = loop do
      number = rand(ACCOUNT_NUMBER_RANGE)
      break number unless Account.exists?(account_number: number)
    end
  end
end
