describe('Bank', function () {
  var bank;
  var date = new Date();
  beforeEach(function () {
    dateNow = date.toLocaleDateString('en-US');
    bank = new Bank();
  });

  describe('Bank transaction', () => {
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

  describe('Catching errors', () => {
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

    it('should be able to throw error if try to print balance when no transactions', () => {
      expect(() => {
        bank.printStatement();
      }).toThrowError(TypeError);
    });
  });

  describe('Printing balance', () => {
    it('should be able to print account balance after deposit', () => {
      bank.depositToAccount(100);
      expect(bank.printStatement()).toEqual({
        'Transaction ID 0': `Deposit: 100 Balance: 100 Date: ${dateNow}`,
      });
    });

    it('should be able to print account balance after withdrawal', () => {
      bank.depositToAccount(100);
      bank.withdrawFromAccount(30);
      expect(bank.printStatement()).toEqual({
        'Transaction ID 0': `Deposit: 100 Balance: 100 Date: ${dateNow}`,
        'Transaction ID 1': `Withdrawal: 30 Balance: 70 Date: ${dateNow}`,
      });
    });
  });
});
