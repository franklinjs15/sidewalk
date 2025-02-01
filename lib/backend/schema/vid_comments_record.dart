import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VidCommentsRecord extends FirestoreRecord {
  VidCommentsRecord._(
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

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "mention_user" field.
  DocumentReference? _mentionUser;
  DocumentReference? get mentionUser => _mentionUser;
  bool hasMentionUser() => _mentionUser != null;

  // "likescount" field.
  int? _likescount;
  int get likescount => _likescount ?? 0;
  bool hasLikescount() => _likescount != null;

  // "hasReplies" field.
  bool? _hasReplies;
  bool get hasReplies => _hasReplies ?? false;
  bool hasHasReplies() => _hasReplies != null;

  // "parent_comment" field.
  DocumentReference? _parentComment;
  DocumentReference? get parentComment => _parentComment;
  bool hasParentCommentField() => _parentComment != null;

  // "replies_count" field.
  int? _repliesCount;
  int get repliesCount => _repliesCount ?? 0;
  bool hasRepliesCount() => _repliesCount != null;

  // "has_parent_comment" field.
  bool? _hasParentComment;
  bool get hasParentComment => _hasParentComment ?? false;
  bool hasHasParentComment() => _hasParentComment != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _likes = getDataList(snapshotData['likes']);
    _mentionUser = snapshotData['mention_user'] as DocumentReference?;
    _likescount = castToType<int>(snapshotData['likescount']);
    _hasReplies = snapshotData['hasReplies'] as bool?;
    _parentComment = snapshotData['parent_comment'] as DocumentReference?;
    _repliesCount = castToType<int>(snapshotData['replies_count']);
    _hasParentComment = snapshotData['has_parent_comment'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('vid_comments')
          : FirebaseFirestore.instance.collectionGroup('vid_comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('vid_comments').doc(id);

  static Stream<VidCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VidCommentsRecord.fromSnapshot(s));

  static Future<VidCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VidCommentsRecord.fromSnapshot(s));

  static VidCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VidCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VidCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VidCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VidCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VidCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVidCommentsRecordData({
  DateTime? date,
  DocumentReference? userRef,
  String? comment,
  DocumentReference? mentionUser,
  int? likescount,
  bool? hasReplies,
  DocumentReference? parentComment,
  int? repliesCount,
  bool? hasParentComment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'user_ref': userRef,
      'comment': comment,
      'mention_user': mentionUser,
      'likescount': likescount,
      'hasReplies': hasReplies,
      'parent_comment': parentComment,
      'replies_count': repliesCount,
      'has_parent_comment': hasParentComment,
    }.withoutNulls,
  );

  return firestoreData;
}

class VidCommentsRecordDocumentEquality implements Equality<VidCommentsRecord> {
  const VidCommentsRecordDocumentEquality();

  @override
  bool equals(VidCommentsRecord? e1, VidCommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.userRef == e2?.userRef &&
        e1?.comment == e2?.comment &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.mentionUser == e2?.mentionUser &&
        e1?.likescount == e2?.likescount &&
        e1?.hasReplies == e2?.hasReplies &&
        e1?.parentComment == e2?.parentComment &&
        e1?.repliesCount == e2?.repliesCount &&
        e1?.hasParentComment == e2?.hasParentComment;
  }

  @override
  int hash(VidCommentsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.userRef,
        e?.comment,
        e?.likes,
        e?.mentionUser,
        e?.likescount,
        e?.hasReplies,
        e?.parentComment,
        e?.repliesCount,
        e?.hasParentComment
      ]);

  @override
  bool isValidKey(Object? o) => o is VidCommentsRecord;
}
