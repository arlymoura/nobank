# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Operations::Transfer' do
  describe '.call' do
    context 'with valid parameters' do
      it 'creates a new transfer' do
        account1 = create(:account, balance: 400)
        account2 = create(:account, balance: 100)
        transfer = build(:transfer, value: 200, account: account2)
        result = Operations::Transfer.call(account1, transfer)
        expect(result).to be_truthy
      end
    end

    context 'with invalid parameters' do
      it 'creates a new deposit invalid balance' do
        account1 = create(:account, balance: 100)
        account2 = create(:account, balance: 100)
        transfer = build(:transfer, value: 200, account: account2)
        result = Operations::Transfer.call(account1, transfer)
        expect(result).to be_falsey
      end
      it 'creates a new deposit invalid destiny account' do
        account1 = create(:account, balance: 300)
        
        transfer = build(:transfer, value: 200, account: nil)
        result = Operations::Transfer.call(account1, transfer)
        expect(result).to be_falsey
      end
    
    end
  end
end
