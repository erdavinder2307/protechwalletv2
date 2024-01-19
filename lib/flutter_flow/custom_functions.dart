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

double? getTotalExpense(List<ExpensesRecord>? expenses) {
  double totalAmount = 0.0;
  if (expenses != null) {
    for (ExpensesRecord expense in expenses) {
      totalAmount += expense.amount;
    }
  }
  return totalAmount;
}
