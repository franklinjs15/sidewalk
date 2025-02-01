import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SumemployeeRecord extends FirestoreRecord {
  SumemployeeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "employeesum" field.
  DocumentReference? _employeesum;
  DocumentReference? get employeesum => _employeesum;
  bool hasEmployeesum() => _employeesum != null;

  void _initializeFields() {
    _employeesum = snapshotData['employeesum'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sumemployee');

  static Stream<SumemployeeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SumemployeeRecord.fromSnapshot(s));

  static Future<SumemployeeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SumemployeeRecord.fromSnapshot(s));

  static SumemployeeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SumemployeeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SumemployeeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SumemployeeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SumemployeeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SumemployeeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSumemployeeRecordData({
  DocumentReference? employeesum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employeesum': employeesum,
    }.withoutNulls,
  );

  return firestoreData;
}

class SumemployeeRecordDocumentEquality implements Equality<SumemployeeRecord> {
  const SumemployeeRecordDocumentEquality();

  @override
  bool equals(SumemployeeRecord? e1, SumemployeeRecord? e2) {
    return e1?.employeesum == e2?.employeesum;
  }

  @override
  int hash(SumemployeeRecord? e) => const ListEquality().hash([e?.employeesum]);

  @override
  bool isValidKey(Object? o) => o is SumemployeeRecord;
}
