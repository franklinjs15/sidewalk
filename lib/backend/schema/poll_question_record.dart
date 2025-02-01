import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PollQuestionRecord extends FirestoreRecord {
  PollQuestionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PollQuestion');

  static Stream<PollQuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PollQuestionRecord.fromSnapshot(s));

  static Future<PollQuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PollQuestionRecord.fromSnapshot(s));

  static PollQuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PollQuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PollQuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PollQuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PollQuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PollQuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPollQuestionRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class PollQuestionRecordDocumentEquality
    implements Equality<PollQuestionRecord> {
  const PollQuestionRecordDocumentEquality();

  @override
  bool equals(PollQuestionRecord? e1, PollQuestionRecord? e2) {
    return e1?.title == e2?.title;
  }

  @override
  int hash(PollQuestionRecord? e) => const ListEquality().hash([e?.title]);

  @override
  bool isValidKey(Object? o) => o is PollQuestionRecord;
}
