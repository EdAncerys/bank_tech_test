require 'bank'

describe Bank do

  it 'should have account balance 0 at start' do
    expect(subject.balance).to eq 0    
  end
  
end