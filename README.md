# Bank tech test

Session goals:

- Producing the best code you can when there is a minimal time pressure.
- Practice your OO design and TDD skills.
- Work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### User Stories

```
As a User
So I can have a balance
I am able to deposit to my account
```

```
As a User
So I can use my card
Im able to withdraw from my account
```

```
As a User
So I can know how much I spent on purchases
Im able to print out a bank statement
```

```
As a Bank
So we prevent withdrawals bigger than a current balance
We able to raise an error
```

### Domain Models

| Bank                     | UserAccount    | Statements     |
| :----------------------- | :------------- | :------------- |
| #deposit_to_account      | #user_deposit  | #print_balance |
| #withdraw_from_account   | #user_withdraw |
| #print_account_statement |                |

## Self-assessment

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit

![Tracking pixel](https://githubanalytics.herokuapp.com/course/individual_challenges/bank_tech_test.md)
