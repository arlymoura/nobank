module Operations
  class Transfer < OperationApplicationService
    attr_reader :account, :transfer
    
    def initialize(account, transfer)
      @transfer = transfer
      @account = account
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
      end
    end
    
    def validate_when_saving?
      verify_balance(transfer.value) && transfer.save
    end
  end
 end