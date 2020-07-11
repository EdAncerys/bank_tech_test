describe('Bank', function () {
  var bank;
  beforeEach(function () {
    bank = new Bank();
  });

  it('current balance at start should be eq 0', () => {
    expect(bank.currentBalance()).toEqual(0);
  });
});
