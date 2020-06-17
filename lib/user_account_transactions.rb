class UserAccountTransactions
  attr_reader :time, :user_transaktions

  def initialize
    @user_transaktions = []
    @time = Time.now.strftime('%d/%m/%Y')
  end

  def user_deposits(transaction, balance)
    @user_transaktions << "#{@time} || £#{"%.2f" % transaction} || || £#{"%.2f" % balance}\n"
  end

  def user_withdrawals(transaction, balance)
    @user_transaktions << "#{@time} || || £#{"%.2f" % transaction} || £#{"%.2f" % balance}\n"
  end
end