class Withdrawal < ApplicationRecord
  belongs_to :account
  
  validates_numericality_of :value, :greater_than_or_equal_to => 0.0
end
