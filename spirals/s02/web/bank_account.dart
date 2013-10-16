import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('bank-account')
class BankAccount extends PolymerElement {
  @published var bac;
  @published double balance;
  double amount = 0.0;

  /*
  created() {
    super.created();
    // the following does not update balance
    new PathObserver(bac, "balance").changes.listen((e) => balance = bac.balance);
  }
  */

  inserted() {
    super.inserted();
    balance = bac.balance;
  }

  /*
  bacChanged(oldValue) {
    balance = bac.balance;
  }
  */

  transact(Event e, var detail, Node target) {
    InputElement amountInput = shadowRoot.query("#amount");
    if (!checkAmount(amountInput.value)) return;
    bac.transact(amount);  // bacChanged doesn't get called
    balance = bac.balance;
  }

  enter(Event e, var detail, Node target) {
    if (e.keyCode == KeyCode.ENTER) {
      transact(e, detail, target);
    }
  }

  checkAmount(String in_amount) {
    try {
      amount = double.parse(in_amount);
    } on FormatException catch(ex) {
      return false;
    }
    return true;
  }
}