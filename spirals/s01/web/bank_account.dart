import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('bank-account')
class BankAccount extends PolymerElement {
  @published var bac;
  double amount = 0.0;
  
  created() {
    super.created();
    // onPropertyChange here
  }

  transact(Event e, var detail, Node target) {
    InputElement amountInput = shadowRoot.query("#amount");
    if (!checkAmount(amountInput.value)) return;
    bac.transact(amount);
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