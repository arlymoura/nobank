# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Operations::TransferRateService' do
  describe '.call' do
    context 'with valid parameters' do
      it 'creates a new deposit and generate rate' do
        date = Time.parse("May 25 2020 10:19")
        result = Operations::TransferRateService.call(200, date)
        expect(result).to eq(5)
      end
      it 'creates a new deposit and generate rate' do
        date = Time.parse("May 25 2020 20:19")
        result = Operations::TransferRateService.call(200, date)
        expect(result).to eq(7)
      end
      it 'creates a new deposit and generate rate' do
        date = Time.parse("May 25 2020 10:19")
        result = Operations::TransferRateService.call(2000, date)
        expect(result).to eq(15)
      end
      it 'creates a new deposit and generate rate' do
        date = Time.parse("May 25 2020 20:19")
        result = Operations::TransferRateService.call(2000, date)
        expect(result).to eq(17)
      end
    end
  end
end
