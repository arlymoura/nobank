class TransactionsService
  attr_reader :account
  def initialize(account)
    @account = account
  end


  def peform_deposit(deposit)
    ActiveRecord::Base.transaction do
      if deposit.save
        set_sum_balance(deposit.value, account)
        return true
      end
      return false
    end
  end

  def peform_withdrawal(withdrawal)
    ActiveRecord::Base.transaction do
      if verify_balance(withdrawal.value)
        if withdrawal.save
          set_sub_balance(withdrawal.value)
          return true
        end
      end
      return false
    end
  end

  def peform_transfer(transfer, destiny_account)
    ActiveRecord::Base.transaction do
      if verify_balance(transfer.value)
        if transfer.save
          set_sub_balance(transfer.value)
          set_sum_balance(transfer.value, destiny_account)
          return true
        end
      end
      return false
    end
  
  end

  def peform_balance
  end

  def peform_extract
  end

  private

  def verify_balance(value)
     (value.present? && value > 0 && account.balance >= value)
  end

  def set_sum_balance(value, account)
    account.update(balance: (account.balance + value))
  end

  def set_sub_balance(value)
    account.update(balance: (account.balance - value))
  end

end