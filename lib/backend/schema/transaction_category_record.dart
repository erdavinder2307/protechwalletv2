import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TransactionCategoryRecord extends FirestoreRecord {
  TransactionCategoryRecord._(
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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _categoryName = snapshotData['category_name'] as String?;
    _categoryDescription = snapshotData['category_description'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction_category');

  static Stream<TransactionCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionCategoryRecord.fromSnapshot(s));

  static Future<TransactionCategoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TransactionCategoryRecord.fromSnapshot(s));

  static TransactionCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionCategoryRecordData({
  String? categoryName,
  String? categoryDescription,
  DocumentReference? user,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_name': categoryName,
      'category_description': categoryDescription,
      'user': user,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionCategoryRecordDocumentEquality
    implements Equality<TransactionCategoryRecord> {
  const TransactionCategoryRecordDocumentEquality();

  @override
  bool equals(TransactionCategoryRecord? e1, TransactionCategoryRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.categoryDescription == e2?.categoryDescription &&
        e1?.user == e2?.user &&
        e1?.type == e2?.type;
  }

  @override
  int hash(TransactionCategoryRecord? e) => const ListEquality()
      .hash([e?.categoryName, e?.categoryDescription, e?.user, e?.type]);

  @override
  bool isValidKey(Object? o) => o is TransactionCategoryRecord;
}
