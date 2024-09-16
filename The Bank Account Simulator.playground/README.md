# Virtual Bank System

## Overview
This project is a simple **Virtual Bank System** implemented in Swift. The system allows users to open either a debit or credit account, deposit and withdraw money, and check their balances.

---

## Features

- Account creation: Debit or Credit.
- Deposit and withdraw money.
- Check account balance.
- Credit limit for credit accounts.
- Close the system when done.

---

## Code Explanation

### 1. Class: `VirtualBankSystem`

The `VirtualBankSystem` class manages customer interactions such as account creation, money transfers, and balance checks.

#### Snippet: Greeting Customers

```swift
func greetCustomers() {
    print("Welcome to your virtual bank system.")
}
```

##### Explanation: 
This method prints a welcome message for the customer when the system starts.

#### Snippet: Onboarding the Customer

```swift
func onboardCustomerAccountOpening() {
    print("What kind of account would you like to open?")
    print("1. Debit account")
    print("2. Credit account")
}
```

##### Explanation: 
This method provides options for the user to choose between a debit or credit account.

#### Snippet: Account Creation

```swift
func makeAccount(numberPadKey: Int) {
    switch numberPadKey {
        case 1:
            accountType = "debit"
        case 2:
            accountType = "credit"
        default:
            print("Invalid Option!")
    }
    print("You have opened a \(accountType) account.")
}
```

##### Explanation: 
Based on the user's choice (`numberPadKey`), it sets the account type (`either debit or credit`). An invalid option prints an error message.

### 2. Struct: `BankAccount`

The `BankAccount` struct manages the balance of debit and credit accounts.

#### Snippet: Struct Declaration

```swift
struct BankAccount {
    var debitBalance = 0
    var creditBalance = 0
    let creditLimit = 100
}
```

##### Explanation: 
This struct initializes both debit and credit balances, along with a credit limit of 100 for the credit account.

#### Snippet: Deposit Methods

```swift
mutating func debitDeposit(_ amount: Int) {
    debitBalance += amount
    print("Deposited \(amount). Current debit balance: \(debitBalanceInfo).")
}

mutating func creditDeposit(_ amount: Int) {
    creditBalance += amount
    print("Deposited \(amount). Current credit balance: \(creditBalanceInfo).")
}
```

##### Explanation: 
These methods handle deposits. The balance is updated based on the amount deposited and prints the updated balance for both debit and credit accounts.

#### Snippet: Withdrawal Methods

```swift
mutating func debitWithdraw(_ amount: Int) {
    if amount > debitBalance {
        print("Insufficient funds. Debit balance: \(debitBalanceInfo).")
    } else {
        debitBalance -= amount
        print("Withdrawn \(amount). New debit balance: \(debitBalanceInfo).")
    }
}

mutating func creditWithdraw(_ amount: Int) {
    if amount > availableCredit {
        print("Insufficient credit. Available credit: \(creditBalanceInfo).")
    } else {
        creditBalance -= amount
        print("Withdrawn \(amount). New credit balance: \(creditBalanceInfo).")
    }
}
```

##### Explanation: 
These methods handle withdrawals. They check whether sufficient funds/credit are available before withdrawing the specified amount.

### 3. Money Transfer and Balance Check

#### Snippet: Transfer Money

```swift
func transferMoney(transferType: String, transferAmount: Int, bankAccount: inout BankAccount) {
    switch transferType {
        case "withdraw":
            if accountType == "credit" { bankAccount.creditWithdraw(transferAmount) }
            else if accountType == "debit" { bankAccount.debitWithdraw(transferAmount) }
        case "deposit":
            if accountType == "credit" { bankAccount.creditDeposit(transferAmount) }
            else if accountType == "debit" { bankAccount.debitDeposit(transferAmount) }
    }
}
```

##### Explanation: 
This method transfers money by either withdrawing or depositing based on the `transferType` (either "withdraw" or "deposit").

#### Snippet: Check Balance

```swift
func checkBalance(bankAccount: BankAccount) {
    switch accountType {
        case "credit":
            print(bankAccount.creditBalanceInfo)
        case "debit":
            print(bankAccount.debitBalanceInfo)
    }
}
```

##### Explanation: 
This method prints the current balance based on the account type (debit or credit).

## Main Program Flow

### Snippet: System Interaction

```swift
let virtualBankSystem = VirtualBankSystem()
virtualBankSystem.greetCustomers()

repeat {
    virtualBankSystem.onboardCustomerAccountOpening()
    let numberPadKey = Int.random(in: 1...3)
    virtualBankSystem.makeAccount(numberPadKey: numberPadKey)
} while virtualBankSystem.accountType == " "
```

##### Explanation: 
This code simulates the customer onboarding process, allowing them to select an account type randomly between debit and credit.

### Snippet: Transfer and Balance Check
```swift
repeat {
    print("What would you like to do?")
    print("1. Check bank account")
    print("2. Withdraw money")
    print("3. Deposit money")
    print("4. Close the system")
    
    let option = Int.random(in: 1...5)
    print("Selected option: \(option).")
    
    switch option {
        case 1:
            virtualBankSystem.checkBalance(bankAccount: bankAccount)
        case 2:
            virtualBankSystem.transferMoney(transferType: "withdraw", transferAmount: transferAmount, bankAccount: &bankAccount)
        case 3:
            virtualBankSystem.transferMoney(transferType: "deposit", transferAmount: transferAmount, bankAccount: &bankAccount)
        case 4:
            virtualBankSystem.isOpened = false
            print("The system is closed.")
        default:
            break
    }
} while virtualBankSystem.isOpened
```

##### Explanation: 
This loop allows the user to perform various actions such as checking the balance, withdrawing, depositing money, or closing the system. The options are chosen randomly here for simulation.

## Conclusion
This virtual banking system offers basic operations for a credit or debit account, allowing deposits, withdrawals, and balance checking. The system can be extended to support more features like account history or multiple accounts.











