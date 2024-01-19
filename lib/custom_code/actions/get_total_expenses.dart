// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future getTotalExpenses(List<ExpensesRecord>? expenses) async {
  // need to get total of amount of expenses collection using list of expenses as parameter
  double totalAmount = 0.0;
  if (expenses != null) {
    for (ExpensesRecord expense in expenses) {
      totalAmount += expense.amount;
    }
  }
}
