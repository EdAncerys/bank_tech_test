'use strict';
class Bank {
  constructor() {
    this.balance = 0;
  }

  currentBalance() {
    return this.balance;
  }

  depositToAccount(amount) {
    if (amount < 0) {
      throw new TypeError('Not able to deposit negative amount');
      // return 'blah';
    }
    return (this.balance += amount);
  }

  withdrawFromAccount(amount) {
    return (this.balance -= amount);
  }
}
