require 'statement'

describe Statement do

  let(:statements) { described_class.new }
  let(:transaction_deposit) { ['14/01/2012 || || 500.00 || 2500.00'] }
  let(:transaction_witdrawal) { ['14/01/2012 || 200 || || 2300.00'] }
  let(:transactions) { ['14/01/2012 || || 500.00 || 2500.00', '14/01/2012 || 200 || || 2300.00'] }
  let(:no_transactions) { [] }

  context 'When transactions made' do
    it 'should be able to print user statement' do
      expect(statements.print_balance(transaction_deposit)).to eq transaction_deposit
    end

    it 'should be able to print user statement from newest to oldest' do
      expect(statements.print_balance(transactions)).to eq transactions.reverse
    end
  end

  context 'When no transactions made' do
    it 'should be able to raise error' do
      error = 'Statement not available: no user transaction been made'

      expect { statements.print_balance(no_transactions) }.to raise_error error   
    end
  end

end