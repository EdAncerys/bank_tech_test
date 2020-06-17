require_relative 'statements'

class Bank
  attr_accessor :balance

  def initialize(statements = Statements.new) 
    @statements = statements
    @balance = 0
  end

  def deposit_to_account(amount)
    raise 'Transaktion not valid: not able to deposit negative balance' if amount < 0
    @balance += amount
  end

  def withdraw_from_account(amount)
    @balance -= amount
  end

  def print_account_statement
    @statements.print_balance
  end

end
