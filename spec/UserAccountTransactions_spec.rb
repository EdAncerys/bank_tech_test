require 'user_account_transactions'

describe UserAccountTransactions do

  let(:bank_statement) { described_class.new}

  it 'should be able to record user transaktion time' do
    expect(subject.time).to eq Time.now.strftime('%d/%m/%Y')
  end
  
  it 'should be able to record user deposit transaktions' do
    time = Time.now.strftime('%d/%m/%Y')
    transaktion = 500
    balance = transaktion
    bank_statement.user_deposits(transaktion, balance)
    expect(bank_statement.user_transaktions.last).to eq "#{time} || £#{"%.2f" % transaktion} || || £#{"%.2f" % balance}\n"
  end

  it 'should be able to record user withdrawals from account' do
    time = Time.now.strftime('%d/%m/%Y')
    transaktion = 500
    balance = transaktion
    bank_statement.user_withdrawals(transaktion, balance)
    expect(bank_statement.user_transaktions.last).to eq "#{time} || || £#{"%.2f" % transaktion} || £#{"%.2f" % balance}\n"
  end

end