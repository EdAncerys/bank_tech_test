'use strict';
class Bank {
  constructor() {
    this.balance = 0;
  }

  currentBalance() {
    return this.balance;
  }

  depositToAccount(amount) {
    return (this.balance += amount);
  }

  withdrawFromAccount(amount) {
    return (this.balance -= amount);
  }
}
