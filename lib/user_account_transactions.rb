class UserAccountTransactions
  attr_reader :time

  def initialize
    @time = Time.now.strftime('%d-%m-%Y')
  end

end