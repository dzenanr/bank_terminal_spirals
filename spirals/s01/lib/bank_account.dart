part of bank_terminal;

class BankAccount {
  String _number;
  Person owner;
  double _balance;
  //static const double INTEREST = 5.0;

  @observable String get number => _number;
  set number(value) {
    if (value == null || value.isEmpty) return;
    // test the format:
    RegExp exp = new RegExp(r"[0-9]{3}-[0-9]{7}-[0-9]{2}");
    if (exp.hasMatch(value)) _number = value;
  }

  @observable double get balance => _balance;
  set balance(value) {
    if (value >= 0) _balance = value;
  }
  
  //onPropertyChange(this, #backingObservable, () => notifyProperty(this, #obserableGetter)); 

  BankAccount(this.owner, number, balance) {
    this.number = number;
    this.balance = balance;
  }

  deposit(double amount) {
    balance += amount;
  }

  withdraw(double amount) {
    balance += amount;
  }

  String toString() => 'Bank account from $owner with number $number'
      ' and balance $balance';
}

