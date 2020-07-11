# frozen_string_literal: true

require 'user_account_transaction'

describe UserAccountTransaction do
  let(:bank_statement) { described_class.new }

  it 'should be able to record user transaction time' do
    expect(subject.time).to eq Time.now.strftime('%d/%m/%Y')
  end

  it 'should be able to record user deposit transactions' do
    time = Time.now.strftime('%d/%m/%Y')
    transaction = 500
    balance = transaction
    bank_statement.deposit(transaction, balance)
    expect(bank_statement.transaction.last).to eq "#{time} || £#{'%.2f' % transaction} || || £#{'%.2f' % balance}"
  end

  it 'should be able to record user withdrawals from account' do
    time = Time.now.strftime('%d/%m/%Y')
    transaction = 500
    balance = transaction
    bank_statement.withdrawal(transaction, balance)
    expect(bank_statement.transaction.last).to eq "#{time} || || £#{'%.2f' % transaction} || £#{'%.2f' % balance}"
  end
end
