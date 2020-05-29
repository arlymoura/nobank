require 'rails_helper'

RSpec.describe Withdrawal, type: :model do
  subject { build(:withdrawal) }
   
  context 'Relationships' do
    it { is_expected.to belong_to :account }
  end

  describe 'validations' do
    it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(0.0) }
  end

end
