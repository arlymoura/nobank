# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Operations::Withdrawal' do
  describe '.call' do
    context 'with valid parameters' do
      it 'creates a new Withdrawal' do
        account1 = create(:account, balance: 400)
        withdrawal = build(:withdrawal,value: 200)
        result = Operations::Withdrawal.call(account1, withdrawal)
        expect(result).to be_truthy
      end
    end

    context 'with invalid parameters' do
      it 'creates a new Withdrawl invalid balance' do
        account1 = create(:account, balance: 100)
        withdrawal = build(:withdrawal,value: 200)
        result = Operations::Withdrawal.call(account1, withdrawal)
        expect(result).to be_falsey
      end
    end
  end
end
