import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "videoLikes" field.
  int? _videoLikes;
  int get videoLikes => _videoLikes ?? 0;
  bool hasVideoLikes() => _videoLikes != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "streamPhoto" field.
  String? _streamPhoto;
  String get streamPhoto => _streamPhoto ?? '';
  bool hasStreamPhoto() => _streamPhoto != null;

  // "userReports" field.
  List<DocumentReference>? _userReports;
  List<DocumentReference> get userReports => _userReports ?? const [];
  bool hasUserReports() => _userReports != null;

  // "is18" field.
  bool? _is18;
  bool get is18 => _is18 ?? false;
  bool hasIs18() => _is18 != null;

  // "following_users" field.
  List<DocumentReference>? _followingUsers;
  List<DocumentReference> get followingUsers => _followingUsers ?? const [];
  bool hasFollowingUsers() => _followingUsers != null;

  // "users_following_me" field.
  List<DocumentReference>? _usersFollowingMe;
  List<DocumentReference> get usersFollowingMe => _usersFollowingMe ?? const [];
  bool hasUsersFollowingMe() => _usersFollowingMe != null;

  // "userHash" field.
  List<String>? _userHash;
  List<String> get userHash => _userHash ?? const [];
  bool hasUserHash() => _userHash != null;

  // "favorite_videos" field.
  List<DocumentReference>? _favoriteVideos;
  List<DocumentReference> get favoriteVideos => _favoriteVideos ?? const [];
  bool hasFavoriteVideos() => _favoriteVideos != null;

  // "profile_visitors" field.
  List<DocumentReference>? _profileVisitors;
  List<DocumentReference> get profileVisitors => _profileVisitors ?? const [];
  bool hasProfileVisitors() => _profileVisitors != null;

  // "vidHistory" field.
  List<String>? _vidHistory;
  List<String> get vidHistory => _vidHistory ?? const [];
  bool hasVidHistory() => _vidHistory != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isVerified = snapshotData['isVerified'] as bool?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _videoLikes = castToType<int>(snapshotData['videoLikes']);
    _username = snapshotData['username'] as String?;
    _streamPhoto = snapshotData['streamPhoto'] as String?;
    _userReports = getDataList(snapshotData['userReports']);
    _is18 = snapshotData['is18'] as bool?;
    _followingUsers = getDataList(snapshotData['following_users']);
    _usersFollowingMe = getDataList(snapshotData['users_following_me']);
    _userHash = getDataList(snapshotData['userHash']);
    _favoriteVideos = getDataList(snapshotData['favorite_videos']);
    _profileVisitors = getDataList(snapshotData['profile_visitors']);
    _vidHistory = getDataList(snapshotData['vidHistory']);
    _state = snapshotData['State'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isVerified,
  bool? isAdmin,
  int? videoLikes,
  String? username,
  String? streamPhoto,
  bool? is18,
  String? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isVerified': isVerified,
      'isAdmin': isAdmin,
      'videoLikes': videoLikes,
      'username': username,
      'streamPhoto': streamPhoto,
      'is18': is18,
      'State': state,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isVerified == e2?.isVerified &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.videoLikes == e2?.videoLikes &&
        e1?.username == e2?.username &&
        e1?.streamPhoto == e2?.streamPhoto &&
        listEquality.equals(e1?.userReports, e2?.userReports) &&
        e1?.is18 == e2?.is18 &&
        listEquality.equals(e1?.followingUsers, e2?.followingUsers) &&
        listEquality.equals(e1?.usersFollowingMe, e2?.usersFollowingMe) &&
        listEquality.equals(e1?.userHash, e2?.userHash) &&
        listEquality.equals(e1?.favoriteVideos, e2?.favoriteVideos) &&
        listEquality.equals(e1?.profileVisitors, e2?.profileVisitors) &&
        listEquality.equals(e1?.vidHistory, e2?.vidHistory) &&
        e1?.state == e2?.state;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isVerified,
        e?.isAdmin,
        e?.videoLikes,
        e?.username,
        e?.streamPhoto,
        e?.userReports,
        e?.is18,
        e?.followingUsers,
        e?.usersFollowingMe,
        e?.userHash,
        e?.favoriteVideos,
        e?.profileVisitors,
        e?.vidHistory,
        e?.state
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
