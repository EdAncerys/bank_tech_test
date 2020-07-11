describe('Bank', function () {
  var bank;
  beforeEach(function () {
    bank = new Bank();
  });

  it('current balance at start should be eq 0', () => {
    expect(bank.currentBalance()).toEqual(0);
  });

  it('should be able to top up current balance by 100', () => {
    expect(bank.depositToAccount(100)).toEqual(100);
  });

  it('should be able to withdraw from account', () => {
    bank.depositToAccount(150);
    expect(bank.withdrawFromAccount(50)).toEqual(100);
  });

  it('should be able to top up and withdraw from account', () => {
    bank.depositToAccount(200);
    bank.withdrawFromAccount(100);
    expect(bank.currentBalance()).toEqual(100);
  });
});
