module Operations
  class Deposit < OperationApplicationService
    attr_reader :account, :deposit
    
    def initialize(account, deposit)
      @deposit = deposit
      #@destiny_account = destiny_account
      @account = account
    end
    
    def call
      perform_deposit?
    end

    private
    def perform_deposit?
      ActiveRecord::Base.transaction do
        return false unless deposit.save
        set_sum_balance(deposit.value, deposit.account)
      end
    end
  end
end