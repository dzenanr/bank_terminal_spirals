import 'package:polymer/polymer.dart';
import 'package:bank_terminal/bank_terminal.dart';

@CustomTag('bank-app')
class BankApp extends PolymerElement {
  BankAccount bac;
 
  BankApp() {
    var jw = new Person("John Witgenstein");
    bac = new BankAccount(jw, "456-0692322-12", 1500.0);
  }
}
