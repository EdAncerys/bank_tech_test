# frozen_string_literal: true

class UserAccountTransaction
  attr_reader :time, :transaction

  def initialize
    @transaction = []
    @time = Time.now.strftime('%d/%m/%Y')
  end

  def deposit(transaction, balance)
    @transaction << "#{@time} || £#{'%.2f' % transaction} || || £#{'%.2f' % balance}"
  end

  def withdrawal(transaction, balance)
    @transaction << "#{@time} || || £#{'%.2f' % transaction} || £#{'%.2f' % balance}"
  end
end
