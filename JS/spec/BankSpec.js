describe('Bank', function () {
  var bank;
  var date = new Date();
  beforeEach(function () {
    dateNow = date.toLocaleDateString('en-US');
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

  describe('Cathing errors', () => {
    it('should be able to throw error if deposited amount is negative', () => {
      expect(() => {
        bank.depositToAccount(-100);
      }).toThrowError(TypeError);
      // expect(bank.depositToAccount(-100)).toEqual('blah');
    });

    it('should be able to throw error if withdrawal amount > balance', () => {
      expect(() => {
        bank.withdrawFromAccount(100);
      }).toThrowError(TypeError);
    });
  });

  it('should be able to print account balance', () => {
    bank.depositToAccount(100);
    expect(bank.printStatement()).toEqual({
      'Transaktion ID 0': `Amount: 100 Balance: 100 Date: ${dateNow}`,
    });
  });
});
