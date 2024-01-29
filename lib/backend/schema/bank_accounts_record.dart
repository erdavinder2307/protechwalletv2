import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BankAccountsRecord extends FirestoreRecord {
  BankAccountsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _bankName = snapshotData['bank_name'] as String?;
    _description = snapshotData['description'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bank_accounts');

  static Stream<BankAccountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BankAccountsRecord.fromSnapshot(s));

  static Future<BankAccountsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BankAccountsRecord.fromSnapshot(s));

  static BankAccountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BankAccountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BankAccountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BankAccountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BankAccountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BankAccountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBankAccountsRecordData({
  String? bankName,
  String? description,
  DocumentReference? user,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bank_name': bankName,
      'description': description,
      'user': user,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BankAccountsRecordDocumentEquality
    implements Equality<BankAccountsRecord> {
  const BankAccountsRecordDocumentEquality();

  @override
  bool equals(BankAccountsRecord? e1, BankAccountsRecord? e2) {
    return e1?.bankName == e2?.bankName &&
        e1?.description == e2?.description &&
        e1?.user == e2?.user &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(BankAccountsRecord? e) => const ListEquality()
      .hash([e?.bankName, e?.description, e?.user, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is BankAccountsRecord;
}
