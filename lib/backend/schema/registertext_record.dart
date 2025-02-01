import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistertextRecord extends FirestoreRecord {
  RegistertextRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('registertext');

  static Stream<RegistertextRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegistertextRecord.fromSnapshot(s));

  static Future<RegistertextRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegistertextRecord.fromSnapshot(s));

  static RegistertextRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegistertextRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegistertextRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegistertextRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegistertextRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegistertextRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegistertextRecordData({
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegistertextRecordDocumentEquality
    implements Equality<RegistertextRecord> {
  const RegistertextRecordDocumentEquality();

  @override
  bool equals(RegistertextRecord? e1, RegistertextRecord? e2) {
    return e1?.text == e2?.text;
  }

  @override
  int hash(RegistertextRecord? e) => const ListEquality().hash([e?.text]);

  @override
  bool isValidKey(Object? o) => o is RegistertextRecord;
}
