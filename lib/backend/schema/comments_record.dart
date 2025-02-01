import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "video_ref" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  // "parent_comment" field.
  DocumentReference? _parentComment;
  DocumentReference? get parentComment => _parentComment;
  bool hasParentComment() => _parentComment != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "commenting_user" field.
  DocumentReference? _commentingUser;
  DocumentReference? get commentingUser => _commentingUser;
  bool hasCommentingUser() => _commentingUser != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "has_replies" field.
  bool? _hasReplies;
  bool get hasReplies => _hasReplies ?? false;
  bool hasHasReplies() => _hasReplies != null;

  void _initializeFields() {
    _videoRef = snapshotData['video_ref'] as DocumentReference?;
    _parentComment = snapshotData['parent_comment'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _commentingUser = snapshotData['commenting_user'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _likes = getDataList(snapshotData['likes']);
    _hasReplies = snapshotData['has_replies'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? videoRef,
  DocumentReference? parentComment,
  DateTime? createdDate,
  DocumentReference? commentingUser,
  String? comment,
  bool? hasReplies,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_ref': videoRef,
      'parent_comment': parentComment,
      'created_date': createdDate,
      'commenting_user': commentingUser,
      'comment': comment,
      'has_replies': hasReplies,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.videoRef == e2?.videoRef &&
        e1?.parentComment == e2?.parentComment &&
        e1?.createdDate == e2?.createdDate &&
        e1?.commentingUser == e2?.commentingUser &&
        e1?.comment == e2?.comment &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.hasReplies == e2?.hasReplies;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.videoRef,
        e?.parentComment,
        e?.createdDate,
        e?.commentingUser,
        e?.comment,
        e?.likes,
        e?.hasReplies
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
