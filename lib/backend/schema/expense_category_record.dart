import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ExpenseCategoryRecord extends FirestoreRecord {
  ExpenseCategoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "category_description" field.
  String? _categoryDescription;
  String get categoryDescription => _categoryDescription ?? '';
  bool hasCategoryDescription() => _categoryDescription != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _categoryName = snapshotData['category_name'] as String?;
    _categoryDescription = snapshotData['category_description'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('expense_category');

  static Stream<ExpenseCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpenseCategoryRecord.fromSnapshot(s));

  static Future<ExpenseCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpenseCategoryRecord.fromSnapshot(s));

  static ExpenseCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpenseCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpenseCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpenseCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpenseCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpenseCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpenseCategoryRecordData({
  String? categoryName,
  String? categoryDescription,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_name': categoryName,
      'category_description': categoryDescription,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpenseCategoryRecordDocumentEquality
    implements Equality<ExpenseCategoryRecord> {
  const ExpenseCategoryRecordDocumentEquality();

  @override
  bool equals(ExpenseCategoryRecord? e1, ExpenseCategoryRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.categoryDescription == e2?.categoryDescription &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ExpenseCategoryRecord? e) => const ListEquality()
      .hash([e?.categoryName, e?.categoryDescription, e?.user]);

  @override
  bool isValidKey(Object? o) => o is ExpenseCategoryRecord;
}
