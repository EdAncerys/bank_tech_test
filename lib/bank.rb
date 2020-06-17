require_relative 'user_account_transactions'
require_relative 'statements'

class Bank
  attr_accessor :balance, :user_account

  def initialize(user_account = UserAccountTransactions.new, statements = Statements.new)
    @user_account = user_account 
    @statements = statements
    @balance = 0
  end

  def deposit_to_account(amount)
    raise 'Transaktion not valid: not able to deposit negative balance' if amount < 0

    @user_account.user_deposits(amount, @balance)
    @balance += amount
  end

  def withdraw_from_account(amount)
    raise 'Transaktion not valid: amount to withdraw can not be negative' if amount < 0
    raise 'Transaktion not valid: balance not sufficient' if @balance < amount

    @user_account.user_withdrawals(amount, @balance)
    @balance -= amount
  end

  def print_account_statement
    @statements.print_balance(@user_account.user_transaktions)
  end

end
