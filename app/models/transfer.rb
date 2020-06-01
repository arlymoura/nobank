class Transfer < ApplicationRecord
  belongs_to :account
  has_one :transfer_rate

  validates_numericality_of :value, :greater_than_or_equal_to => 0.0
end
