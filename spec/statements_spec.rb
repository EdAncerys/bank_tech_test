require 'statements'

describe Statements do

  let(:statements) { described_class.new }
  let(:transaktions) { ['14/01/2012 || || 500.00 || 2500.00'] }
  let(:no_transaktions) { [] }

  context 'When transaktions made' do
    it 'should be able to print user statement' do
      expect(statements.print_balance(transaktions)).to eq "date || credit || debit || balance, #{transaktions.join(', ')}"
    end
  end

  context 'When no transaktions made' do
    it 'should be able to raise error' do
      error = 'Statement not available: no user transaktion been made'

      expect { statements.print_balance(no_transaktions) }.to raise_error error   
    end
  end

end