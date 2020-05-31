module Operations
  class Withdrawal < OperationApplicationService

    attr_reader :account, :withdrawal
    
    def initialize(account, withdrawal)
      @withdrawal = withdrawal
      @account = account
    end
    
    def call
     perform_withdrawal
    end

    private
    def perform_withdrawal
      ActiveRecord::Base.transaction do
        return false unless validate_when_saving?
        set_sub_balance(withdrawal.value)
      end
    end
    
    def validate_when_saving?
      verify_balance(withdrawal.value) && withdrawal.save
    end

  end
end