require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:deposit_transaction) { "10/01/2012 || 1000.00 || || 1000.00" }
  let(:statements) { double("Statements", print_balance: deposit_transaction) }

  it 'should have account balance 0 at start' do
    expect(bank.balance).to eq 0    
  end

  it 'should be able to deposit to an account' do
    bank.deposit_to_account(100)
    expect(bank.balance).to eq 100
  end

   it 'should be able to witdraw from an account' do
    bank.deposit_to_account(100)
    bank.withdraw_from_account(100)
    expect(bank.balance).to eq 0
  end

  context 'Catch errors if user transaktion not walid' do
    
    it 'should not allow to deposit negative amount' do
      error = 'Transaktion not valid: not able to deposit negative balance'
      expect { bank.deposit_to_account(-100) }.to raise_error error
    end

    it 'should not allow to withdraw more than a balance' do
      error = 'Transaktion not valid: balance not sufficient'
      expect { bank.withdraw_from_account(100) }.to raise_error error
    end

    it 'should not allow to withdraw negative amount' do
      error = 'Transaktion not valid: amount to withdraw can not be negative'
      expect { bank.withdraw_from_account(-100) }.to raise_error error
    end
  end

  context 'Print account statement with deposit only' do
    it 'should be able to print account statement' do
      allow(statements).to receive(:print_balance) { deposit_transaction }
      bank = Bank.new(statements)

      expect(bank.print_account_statement).to eq deposit_transaction      
    end
  end

end