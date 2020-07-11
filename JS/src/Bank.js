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
    this.statement[
      `Transaktion ID ${this.id}`
    ] = `Deposit: ${amount} Balance: ${this.balance} Date: ${this.todaysDay()}`;
    this.id += 1;
    return this.balance;
  }

  withdrawFromAccount(amount) {
    if (amount > this.balance) {
      throw new TypeError('Withdrawal amount is greater than current balance');
    }
    this.balance -= amount;
    this.statement[
      `Transaktion ID ${this.id}`
    ] = `Withdrawal: ${amount} Balance: ${
      this.balance
    } Date: ${this.todaysDay()}`;
    this.id += 1;
    return this.balance;
  }

  printStatement() {
    if (this._isEmpty(this.statement)) {
      throw new TypeError('No transactions been made');
    }
    return this.statement;
  }

  _isEmpty(obj) {
    for (var prop in obj) {
      if (obj.hasOwnProperty(prop)) {
        return false;
      }
    }
    return JSON.stringify(obj) === JSON.stringify({});
  }
}
