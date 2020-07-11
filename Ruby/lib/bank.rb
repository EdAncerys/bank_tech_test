# frozen_string_literal: true

require_relative 'user_account_transaction'
require_relative 'statement'

class Bank
  attr_accessor :balance, :user_account

  def initialize(user_account = UserAccountTransaction.new, statement = Statement.new)
    @user_account = user_account
    @statement = statement
    @balance = 0
  end

  def deposit_to_account(amount)
    raise 'transaction not valid: not able to deposit negative balance' if amount.negative?

    @user_account.deposit(amount, @balance)
    @balance += amount
  end

  def withdraw_from_account(amount)
    raise 'transaction not valid: amount to withdraw can not be negative' if amount.negative?
    raise 'transaction not valid: balance not sufficient' if @balance < amount

    @user_account.withdrawal(amount, @balance)
    @balance -= amount
  end

  def print_account_statement
    @statement.print_balance(@user_account.transaction)
  end
end
