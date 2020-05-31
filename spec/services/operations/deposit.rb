# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Operations::Depoist' do
  describe '.call' do
    context 'with valid parameters' do
      it 'creates a new deposit same account' do
        account1 = create(:account, balance: 400)
        deposit = create(:deposit,value: 200, account: account1)
        result = Operations::Deposit.call(account1, deposit)
        expect(result).to be_truthy
      end
      it 'creates a new deposit in another account' do
        account1 = create(:account, balance: 400)
        account2 = create(:account)
        deposit = create(:deposit,value: 200, account: account2)
        result = Operations::Deposit.call(account1, deposit)
        expect(result).to be_truthy
      end
    end

    context 'with invalid parameters' do
      it 'creates a new deposit invalid account' do
        account1 = create(:account, balance: 400)
        deposit = build(:deposit,value: 200)
        deposit.account = nil
        result = Operations::Deposit.call(account1, deposit)
        expect(result).to be_falsey
      end
    end
  end
end
