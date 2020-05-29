require 'rails_helper'

RSpec.describe Account, type: :model do
  subject { build(:account) }
   
  context 'Relationships' do
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:account_number).case_insensitive  }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0.0) }
  end
end
