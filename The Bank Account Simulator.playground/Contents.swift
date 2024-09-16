import Cocoa

class VirtualBankSystem {
    
    var accountType = " "
    var input = 0
    var isOpened = true
    
    func greetCustomers() {
        print("Welcome to your virtual bank system.")
    }
    
    func onboardCustomerAccountOpening() {
        print("What kind of account would you like to open?")
        print("1. Debit account")
        print("2. Credit account")
    }
    
    func makeAccount(numberPadKey: Int) {
        print("The selected option is \(numberPadKey)")
        switch numberPadKey {
            
            case 1:
                accountType = "debit"
            
            case 2:
                accountType = "credit"
            
            default:
                print("Invalid Option!")
                return
        }
        print("You have opened a \(accountType) account.")
    }
    
    func transferMoney (
        
        transferType: String,
        transferAmount: Int,
        bankAccount: inout BankAccount
        
    ){
        
        switch transferType{
            
            case "withdraw":
                if accountType == "credit" {
                    bankAccount.creditWithdraw(transferAmount)
                }else if accountType == "debit" {
                    bankAccount.debitWithdraw(transferAmount)
                }
            
            case "deposit":
                if accountType == "credit" {
                    bankAccount.creditDeposit(transferAmount)
                }else if accountType == "debit" {
                    bankAccount.debitDeposit(transferAmount)
            }
            
            default:
                break
        }
    }
    
    func checkBalance(
        bankAccount: BankAccount
    ){
        switch accountType{
            
            case "credit":
                print(bankAccount.creditBalanceInfo)
            
            case "debit":
                print(bankAccount.debitBalanceInfo)
            
            default:
                break
        }
    }
    
}

let virtualBankSystem = VirtualBankSystem()
virtualBankSystem.greetCustomers()

repeat {
    virtualBankSystem.onboardCustomerAccountOpening()
    let numberPadKey = Int.random(in: 1...3)
    virtualBankSystem.makeAccount(numberPadKey: numberPadKey)
} while virtualBankSystem.accountType == " "

let transferAmount = 50
print("Transfer amount: $\(transferAmount).")

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
        virtualBankSystem.transferMoney(
            transferType: "withdraw",
            transferAmount: transferAmount,
            bankAccount: &bankAccount)
        
        case 3:
        virtualBankSystem.transferMoney(transferType: "deposit", transferAmount: transferAmount, bankAccount: &bankAccount)
        
        case 4:
        virtualBankSystem.isOpened = false
        print("The system is closed.")
        
        default:
        break
    }
}while virtualBankSystem.isOpened
struct BankAccount {
    
    var debitBalance = 0
    var creditBalance = 0
    let creditLimit = 100
    
    var debitBalanceInfo: String {
        return "Debit Balance: \(debitBalance)"
    }
    
    var availableCredit: Int {
        return creditLimit + creditBalance
    }
    
    var creditBalanceInfo: String {
        return "Available Credit: \(availableCredit)"
    }
    
    mutating func debitDeposit(_ amount: Int) {
        debitBalance += amount
        print("Deposited an amount of \(amount) and the current available debit balance is \(debitBalanceInfo).")
    }
    
    mutating func creditDeposit (_ amount: Int) {
        creditBalance += amount
        print("Deposited an amount of \(amount) and the current available credit balance is \(creditBalanceInfo).")
        
        if creditBalance == 0 {
            print("Paid off credit balance.")
        }else{
            print("Overpaid credit balance.")
        }
    }
    
    mutating func debitWithdraw(_ amount: Int) {
        if amount > debitBalance {
            print("Insufficient fund to withdraw \(amount)$. Debit Balance: \(debitBalanceInfo)")
        }else{
            debitBalance -= amount
            print("Debit Withdraw: \(amount), and the Debit balance: \(debitBalanceInfo).")
        }
    }
    
    mutating func creditWithdraw(_ amount: Int) {
        if amount > availableCredit {
            print("Insufficient credit to withdraw \(amount)$. Credit Balance: \(creditBalanceInfo).")
        }else{
            creditBalance -= amount
            print("Credit Withdraw: \(amount)$. Credit Balance: \(creditBalanceInfo)")
        }
    }
}

var bankAccount = BankAccount()
print(bankAccount.debitBalanceInfo)
