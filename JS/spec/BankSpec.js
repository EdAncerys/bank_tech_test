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
});
