import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProfileVisitorsRecord extends FirestoreRecord {
  ProfileVisitorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('profile_visitors')
          : FirebaseFirestore.instance.collectionGroup('profile_visitors');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('profile_visitors').doc(id);

  static Stream<ProfileVisitorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileVisitorsRecord.fromSnapshot(s));

  static Future<ProfileVisitorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileVisitorsRecord.fromSnapshot(s));

  static ProfileVisitorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileVisitorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileVisitorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileVisitorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileVisitorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileVisitorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileVisitorsRecordData({
  DateTime? date,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileVisitorsRecordDocumentEquality
    implements Equality<ProfileVisitorsRecord> {
  const ProfileVisitorsRecordDocumentEquality();

  @override
  bool equals(ProfileVisitorsRecord? e1, ProfileVisitorsRecord? e2) {
    return e1?.date == e2?.date && e1?.userRef == e2?.userRef;
  }

  @override
  int hash(ProfileVisitorsRecord? e) =>
      const ListEquality().hash([e?.date, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is ProfileVisitorsRecord;
}
