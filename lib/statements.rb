class Statements
  attr_accessor :print_user_transaktions

  def initialize
    @print_user_transaktions = ["date || credit || debit || balance"]
  end

  def print_balance(transaktions)
    transaktions.each do |tran|
      @print_user_transaktions << tran
    end
    @print_user_transaktions.join(', ')
  end

end