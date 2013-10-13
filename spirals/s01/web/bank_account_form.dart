import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('bank-account-form')
class BankAccountForm extends PolymerElement {
  @published var bac;
  String in_amount = '25';
  double amount = 0.0;
  
  /*
  bacChanged(double oldValue) {
    notifyProperty(this, #balance);
  }
  
  int get balance => bac.balance;
  */

  deposit(Event e, var detail, Node target) {
    if (!checkAmount(e)) return;
    if (amount >= 0) bac.deposit(amount);
    else bac.withdraw(amount);
  }

  checkAmount(e) {
    try {
      amount = double.parse(in_amount);
    } on FormatException catch(ex) {
      return false;
    }
    return true;
  }
}