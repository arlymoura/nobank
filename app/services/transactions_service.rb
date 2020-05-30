class TransactionsService
  attr_reader :account
  def initialize(account)
    @account = account
  end


  def peform_deposit(deposit)
    ActiveRecord::Base.transaction do
      if deposit.save
        set_sum_balance(deposit.value)
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

  

  private

  def verify_balance(value)
     (value.present? && value > 0 && account.balance >= value)
  end

  def set_sum_balance(value)
    account.update(balance: (account.balance + value))
  end

  def set_sub_balance(value)
    account.update(balance: (account.balance - value))
  end
end