class Statements
  attr_accessor :print_user_transaktions

  def initialize
    @print_user_transaktions = ["date || credit || debit || balance"]
  end

  def print_balance(transaktions)
    raise 'Statement not available: no user transaktion been made' if user_made_transaktion?(transaktions)

    transaktions.each do |tran|
      @print_user_transaktions << tran
    end
    @print_user_transaktions.join(', ')
  end

  private 

  def user_made_transaktion?(transaktions)
    transaktions.empty?
  end

end