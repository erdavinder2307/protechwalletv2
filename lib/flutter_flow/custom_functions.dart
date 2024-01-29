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

double? getTotalExpense(List<TransactionsRecord>? transactions) {
  double totalAmount = 0.0;
  if (transactions != null) {
    for (TransactionsRecord transaction in transactions) {
      if (transaction.type == "Debit") totalAmount += transaction.amount;
    }
  }
  return totalAmount;
}

double? getTotalIncome(List<TransactionsRecord>? transactions) {
  double totalAmount = 0.0;
  if (transactions != null) {
    for (TransactionsRecord transaction in transactions) {
      if (transaction.type == "Credit") totalAmount += transaction.amount;
    }
  }
  return totalAmount;
}

double? getNetWorth(List<TransactionsRecord>? transactions) {
  double totalAmount = 0.0;
  double totalExpense = getTotalExpense(transactions) as double;
  double totalIncome = getTotalIncome(transactions) as double;
  totalAmount = totalIncome - totalExpense;

  return totalAmount;
}

double? getPercentIncrease(List<TransactionsRecord>? transactions) {
  double totalAmount = 0.0;
  double totalExpense = getTotalExpense(transactions) as double;
  double totalIncome = getTotalIncome(transactions) as double;
  totalAmount = totalIncome / (totalIncome + totalExpense);

  return totalAmount;
}
