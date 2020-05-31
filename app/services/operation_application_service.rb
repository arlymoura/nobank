class OperationApplicationService
  
  def self.call(*args, &block)
    new(*args, &block).call
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