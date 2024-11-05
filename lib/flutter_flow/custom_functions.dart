import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? getTotalExpense(List<TransactionsRecord>? expenses) {
  double totalAmount = 0.0;
  if (expenses != null) {
    for (TransactionsRecord expense
        in expenses.where((element) => element.type == "Debit")) {
      totalAmount += expense.amount;
    }
  }
  return totalAmount;
}

double? getTotalIncome(List<TransactionsRecord>? incomes) {
  double totalAmount = 0.0;
  if (incomes != null) {
    for (TransactionsRecord incomes
        in incomes.where((element) => element.type == "Credit")) {
      totalAmount += incomes.amount;
    }
  }
  return totalAmount;
}

double? getNetWorth(List<TransactionsRecord>? transactions) {
  double totalAmount = 0.0;
  if (transactions != null) {
    double income = getTotalIncome(transactions) ?? 0.0;
    double expenses = getTotalExpense(transactions) ?? 0.0;
    totalAmount = income - expenses;
  }
  return totalAmount;
}
