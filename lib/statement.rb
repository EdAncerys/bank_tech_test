# frozen_string_literal: true

class Statement
  attr_accessor :print_user_transactions

  def initialize
    @transaction_header = 'date || credit || debit || balance'
    @user_transactions = []
  end

  def print_balance(transactions)
    if user_made_transaction?(transactions)
      raise 'Statement not available: no user transaction been made'
    else
      puts @transaction_header
      transactions.reverse.each do |tran|
        puts tran
        @user_transactions << tran
      end
    end
  end

  private

  def user_made_transaction?(transactions)
    transactions.empty?
  end
end
