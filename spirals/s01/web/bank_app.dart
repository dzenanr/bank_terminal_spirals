import 'dart:html';

import 'package:bank_terminal/bank_terminal.dart';

BankAccount bac;

main() {
  var jw = new Person("John Witgenstein");
  bac = new BankAccount(jw, "456-0692322-12", 1500.0);
  query("#tmpl").model = bac;
}
