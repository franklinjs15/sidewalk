import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IndustriesRecord extends FirestoreRecord {
  IndustriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "featured" field.
  bool? _featured;
  bool get featured => _featured ?? false;
  bool hasFeatured() => _featured != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _featured = snapshotData['featured'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('industries');

  static Stream<IndustriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IndustriesRecord.fromSnapshot(s));

  static Future<IndustriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IndustriesRecord.fromSnapshot(s));

  static IndustriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IndustriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IndustriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IndustriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IndustriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IndustriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIndustriesRecordData({
  String? name,
  bool? featured,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'featured': featured,
    }.withoutNulls,
  );

  return firestoreData;
}

class IndustriesRecordDocumentEquality implements Equality<IndustriesRecord> {
  const IndustriesRecordDocumentEquality();

  @override
  bool equals(IndustriesRecord? e1, IndustriesRecord? e2) {
    return e1?.name == e2?.name && e1?.featured == e2?.featured;
  }

  @override
  int hash(IndustriesRecord? e) =>
      const ListEquality().hash([e?.name, e?.featured]);

  @override
  bool isValidKey(Object? o) => o is IndustriesRecord;
}
