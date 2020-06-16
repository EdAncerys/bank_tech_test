require 'bank'

describe Bank do

  it 'should have account balance 0 at start' do
    expect(subject.balance).to eq 0    
  end

  it 'should be able to deposit to an account' do
    subject.deposit_to_account(100)
    expect(subject.balance).to eq 100
  end
  
end