class Bank
  attr_accessor :balance

  def initialize 
    @balance = 0
  end

  def deposit_to_account(amount)
    @balance += amount
  end

  def withdraw_from_account(amount)
    @balance -= amount
  end
end