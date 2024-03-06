import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class VidSubCommentsRecord extends FirestoreRecord {
  VidSubCommentsRecord._(
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

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "vid_main_comment_ref" field.
  DocumentReference? _vidMainCommentRef;
  DocumentReference? get vidMainCommentRef => _vidMainCommentRef;
  bool hasVidMainCommentRef() => _vidMainCommentRef != null;

  // "replyto_user_ref" field.
  DocumentReference? _replytoUserRef;
  DocumentReference? get replytoUserRef => _replytoUserRef;
  bool hasReplytoUserRef() => _replytoUserRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _vidMainCommentRef =
        snapshotData['vid_main_comment_ref'] as DocumentReference?;
    _replytoUserRef = snapshotData['replyto_user_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('vid_sub_comments')
          : FirebaseFirestore.instance.collectionGroup('vid_sub_comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('vid_sub_comments').doc(id);

  static Stream<VidSubCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VidSubCommentsRecord.fromSnapshot(s));

  static Future<VidSubCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VidSubCommentsRecord.fromSnapshot(s));

  static VidSubCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VidSubCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VidSubCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VidSubCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VidSubCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VidSubCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVidSubCommentsRecordData({
  DateTime? date,
  DocumentReference? userRef,
  String? comment,
  DocumentReference? vidMainCommentRef,
  DocumentReference? replytoUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'user_ref': userRef,
      'comment': comment,
      'vid_main_comment_ref': vidMainCommentRef,
      'replyto_user_ref': replytoUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class VidSubCommentsRecordDocumentEquality
    implements Equality<VidSubCommentsRecord> {
  const VidSubCommentsRecordDocumentEquality();

  @override
  bool equals(VidSubCommentsRecord? e1, VidSubCommentsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.userRef == e2?.userRef &&
        e1?.comment == e2?.comment &&
        e1?.vidMainCommentRef == e2?.vidMainCommentRef &&
        e1?.replytoUserRef == e2?.replytoUserRef;
  }

  @override
  int hash(VidSubCommentsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.userRef,
        e?.comment,
        e?.vidMainCommentRef,
        e?.replytoUserRef
      ]);

  @override
  bool isValidKey(Object? o) => o is VidSubCommentsRecord;
}
