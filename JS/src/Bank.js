'use strict';

class Bank {
  constructor() {
    this.balance = 0;
    this.statement = {};
    this.id = 0;
  }

  todaysDay() {
    const date = new Date();
    return date.toLocaleDateString('en-US');
  }

  currentBalance() {
    return this.balance;
  }

  depositToAccount(amount) {
    if (amount < 0) {
      throw new TypeError('Not able to deposit negative amount');
      // return 'blah';
    }
    this.balance += amount;
    this.statement[`Transaktion ID ${this.id}`] = `Amount: ${amount} Balance: ${
      this.balance
    } Date: ${this.todaysDay()}`;
    this.id += 1;
    return this.balance;
  }

  withdrawFromAccount(amount) {
    if (amount > this.balance) {
      throw new TypeError('Withdrawal amount is greater than current balance');
    }
    return (this.balance -= amount);
  }

  printStatement() {
    return this.statement;
  }
}
