import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import 'package:flutter/material.dart';

Future<List<BankAccountsRecord>> loadTransactionData(
    BuildContext context) async {
  List<BankAccountsRecord>? bankAccounts5;

  bankAccounts5 = await queryBankAccountsRecordOnce(
    queryBuilder: (bankAccountsRecord) => bankAccountsRecord.where(
      'user',
      isEqualTo: currentUserReference,
    ),
  );
  return bankAccounts5;
}
