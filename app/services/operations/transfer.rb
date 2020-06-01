module Operations
  class Transfer < OperationApplicationService
    attr_reader :account, :transfer, :rate
    
    def initialize(account, transfer, rate)
      @transfer = transfer
      @account = account
      
      @rate = rate
    end
    
    def call
      perform_transfer?
    end

    private
    def perform_transfer?
      ActiveRecord::Base.transaction do
        return false unless validate_when_saving?
        set_sub_balance(transfer.value)
        set_sum_balance(transfer.value, transfer.account)
        set_transfer_rate
      end
    end
    
    def validate_when_saving?
      verify_balance(transfer.value + rate ) && transfer.save
    end

    def set_transfer_rate
      TransferRate.create(value: rate,transfer: transfer)
    end
  end
 end