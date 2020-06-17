require 'statements'

describe Statements do

  let(:statements) { described_class.new }

  it 'should be able to print user statement' do
    transaktions = ['14/01/2012 || || 500.00 || 2500.00']
    expect(statements.print_balance(transaktions)).to eq "date || credit || debit || balance, 14/01/2012 || || 500.00 || 2500.00"
  end

end