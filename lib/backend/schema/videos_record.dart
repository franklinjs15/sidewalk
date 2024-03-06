import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "dateUploaded" field.
  DateTime? _dateUploaded;
  DateTime? get dateUploaded => _dateUploaded;
  bool hasDateUploaded() => _dateUploaded != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "videoID" field.
  String? _videoID;
  String get videoID => _videoID ?? '';
  bool hasVideoID() => _videoID != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  // "userPhoto" field.
  String? _userPhoto;
  String get userPhoto => _userPhoto ?? '';
  bool hasUserPhoto() => _userPhoto != null;

  // "videoIDPassable" field.
  DocumentReference? _videoIDPassable;
  DocumentReference? get videoIDPassable => _videoIDPassable;
  bool hasVideoIDPassable() => _videoIDPassable != null;

  // "creatorID" field.
  DocumentReference? _creatorID;
  DocumentReference? get creatorID => _creatorID;
  bool hasCreatorID() => _creatorID != null;

  // "previewType" field.
  String? _previewType;
  String get previewType => _previewType ?? '';
  bool hasPreviewType() => _previewType != null;

  // "thumbnailURL" field.
  String? _thumbnailURL;
  String get thumbnailURL => _thumbnailURL ?? '';
  bool hasThumbnailURL() => _thumbnailURL != null;

  // "adultOnly" field.
  bool? _adultOnly;
  bool get adultOnly => _adultOnly ?? false;
  bool hasAdultOnly() => _adultOnly != null;

  // "isPrivate" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  bool hasIsPrivate() => _isPrivate != null;

  // "likedBy_ref" field.
  List<DocumentReference>? _likedByRef;
  List<DocumentReference> get likedByRef => _likedByRef ?? const [];
  bool hasLikedByRef() => _likedByRef != null;

  // "LikeCount" field.
  int? _likeCount;
  int get likeCount => _likeCount ?? 0;
  bool hasLikeCount() => _likeCount != null;

  // "videoHash" field.
  List<String>? _videoHash;
  List<String> get videoHash => _videoHash ?? const [];
  bool hasVideoHash() => _videoHash != null;

  // "ShareCount" field.
  int? _shareCount;
  int get shareCount => _shareCount ?? 0;
  bool hasShareCount() => _shareCount != null;

  // "CommentCount" field.
  int? _commentCount;
  int get commentCount => _commentCount ?? 0;
  bool hasCommentCount() => _commentCount != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _dateUploaded = snapshotData['dateUploaded'] as DateTime?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _content = snapshotData['content'] as String?;
    _videoID = snapshotData['videoID'] as String?;
    _creatorName = snapshotData['creatorName'] as String?;
    _userPhoto = snapshotData['userPhoto'] as String?;
    _videoIDPassable = snapshotData['videoIDPassable'] as DocumentReference?;
    _creatorID = snapshotData['creatorID'] as DocumentReference?;
    _previewType = snapshotData['previewType'] as String?;
    _thumbnailURL = snapshotData['thumbnailURL'] as String?;
    _adultOnly = snapshotData['adultOnly'] as bool?;
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _likedByRef = getDataList(snapshotData['likedBy_ref']);
    _likeCount = castToType<int>(snapshotData['LikeCount']);
    _videoHash = getDataList(snapshotData['videoHash']);
    _shareCount = castToType<int>(snapshotData['ShareCount']);
    _commentCount = castToType<int>(snapshotData['CommentCount']);
    _category = snapshotData['Category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  DateTime? dateUploaded,
  String? videoUrl,
  String? content,
  String? videoID,
  String? creatorName,
  String? userPhoto,
  DocumentReference? videoIDPassable,
  DocumentReference? creatorID,
  String? previewType,
  String? thumbnailURL,
  bool? adultOnly,
  bool? isPrivate,
  int? likeCount,
  int? shareCount,
  int? commentCount,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dateUploaded': dateUploaded,
      'videoUrl': videoUrl,
      'content': content,
      'videoID': videoID,
      'creatorName': creatorName,
      'userPhoto': userPhoto,
      'videoIDPassable': videoIDPassable,
      'creatorID': creatorID,
      'previewType': previewType,
      'thumbnailURL': thumbnailURL,
      'adultOnly': adultOnly,
      'isPrivate': isPrivate,
      'LikeCount': likeCount,
      'ShareCount': shareCount,
      'CommentCount': commentCount,
      'Category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateUploaded == e2?.dateUploaded &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.content == e2?.content &&
        e1?.videoID == e2?.videoID &&
        e1?.creatorName == e2?.creatorName &&
        e1?.userPhoto == e2?.userPhoto &&
        e1?.videoIDPassable == e2?.videoIDPassable &&
        e1?.creatorID == e2?.creatorID &&
        e1?.previewType == e2?.previewType &&
        e1?.thumbnailURL == e2?.thumbnailURL &&
        e1?.adultOnly == e2?.adultOnly &&
        e1?.isPrivate == e2?.isPrivate &&
        listEquality.equals(e1?.likedByRef, e2?.likedByRef) &&
        e1?.likeCount == e2?.likeCount &&
        listEquality.equals(e1?.videoHash, e2?.videoHash) &&
        e1?.shareCount == e2?.shareCount &&
        e1?.commentCount == e2?.commentCount &&
        e1?.category == e2?.category;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.dateUploaded,
        e?.videoUrl,
        e?.content,
        e?.videoID,
        e?.creatorName,
        e?.userPhoto,
        e?.videoIDPassable,
        e?.creatorID,
        e?.previewType,
        e?.thumbnailURL,
        e?.adultOnly,
        e?.isPrivate,
        e?.likedByRef,
        e?.likeCount,
        e?.videoHash,
        e?.shareCount,
        e?.commentCount,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
