require 'statements'

describe Statements do

  let(:statements) { described_class.new }
  let(:transaktion_deposit) { ['14/01/2012 || || 500.00 || 2500.00'] }
  let(:transaktion_witdrawal) { ['14/01/2012 || 200 || || 2300.00'] }
  let(:transaktions) { [transaktion_deposit, transaktion_witdrawal] }
  let(:no_transaktions) { [] }

  context 'When transaktions made' do
    it 'should be able to print user statement' do
      expect(statements.print_balance(transaktion_deposit)).to eq "date || credit || debit || balance, #{transaktion_deposit.join(', ')}"
    end

    it 'should be able to print user statement from newest to oldest' do
      expect(statements.print_balance(transaktions)).to eq "date || credit || debit || balance, #{transaktions.reverse.join(', ')}"
    end
  end

  context 'When no transaktions made' do
    it 'should be able to raise error' do
      error = 'Statement not available: no user transaktion been made'

      expect { statements.print_balance(no_transaktions) }.to raise_error error   
    end
  end

end