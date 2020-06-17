require 'statements'

describe Statements do

  let(:statements) { described_class.new }
  let(:transaktions) { ['14/01/2012 || || 500.00 || 2500.00'] }

  it 'should be able to print user statement' do
    expect(statements.print_balance(transaktions)).to eq "date || credit || debit || balance, #{transaktions.join(', ')}"
  end

end