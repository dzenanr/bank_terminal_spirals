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
    print('deposit');
    if (!checkAmount(e)) return;
    print('amount: $amount');
    if (amount >= 0) bac.deposit(amount);
    else bac.withdraw(amount);
    print('balance: ${bac.balance}}');
    shadowRoot.query("#balance").innerHtml = bac.balance.toString();
    disableRefresh(e);
  }

  checkAmount(e) {
    try {
      amount = double.parse(in_amount);
    } on FormatException catch(ex) {
      return false;
    }
    return true;
  }

  disableRefresh(e) {
    e.preventDefault();
    e.stopPropagation();
  }

}