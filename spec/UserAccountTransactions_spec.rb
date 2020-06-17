require 'user_account_transactions'

describe UserAccountTransactions do

  it 'should be able to record user transaktion time' do
    expect(subject.time).to eq Time.now.strftime('%d-%m-%Y')
  end
  
  # it 'should be able to record user deposit transaktions' do
  #   expect(subject.user_deposits(transaktion)).to eq '14/01/2012 || || 500.00 || 2500.00'
  # end

end