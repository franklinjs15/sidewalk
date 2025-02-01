import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "notification_text" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  bool hasNotificationText() => _notificationText != null;

  // "notification_title" field.
  String? _notificationTitle;
  String get notificationTitle => _notificationTitle ?? '';
  bool hasNotificationTitle() => _notificationTitle != null;

  // "initial_page_name" field.
  String? _initialPageName;
  String get initialPageName => _initialPageName ?? '';
  bool hasInitialPageName() => _initialPageName != null;

  // "num_sent" field.
  int? _numSent;
  int get numSent => _numSent ?? 0;
  bool hasNumSent() => _numSent != null;

  // "parameter_data" field.
  String? _parameterData;
  String get parameterData => _parameterData ?? '';
  bool hasParameterData() => _parameterData != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "target_audience" field.
  String? _targetAudience;
  String get targetAudience => _targetAudience ?? '';
  bool hasTargetAudience() => _targetAudience != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "user_refs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  // "notifypic" field.
  DocumentReference? _notifypic;
  DocumentReference? get notifypic => _notifypic;
  bool hasNotifypic() => _notifypic != null;

  void _initializeFields() {
    _notificationText = snapshotData['notification_text'] as String?;
    _notificationTitle = snapshotData['notification_title'] as String?;
    _initialPageName = snapshotData['initial_page_name'] as String?;
    _numSent = castToType<int>(snapshotData['num_sent']);
    _parameterData = snapshotData['parameter_data'] as String?;
    _status = snapshotData['status'] as String?;
    _targetAudience = snapshotData['target_audience'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userRefs = getDataList(snapshotData['user_refs']);
    _notifypic = snapshotData['notifypic'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notificationText,
  String? notificationTitle,
  String? initialPageName,
  int? numSent,
  String? parameterData,
  String? status,
  String? targetAudience,
  DateTime? timestamp,
  DocumentReference? notifypic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_text': notificationText,
      'notification_title': notificationTitle,
      'initial_page_name': initialPageName,
      'num_sent': numSent,
      'parameter_data': parameterData,
      'status': status,
      'target_audience': targetAudience,
      'timestamp': timestamp,
      'notifypic': notifypic,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notificationText == e2?.notificationText &&
        e1?.notificationTitle == e2?.notificationTitle &&
        e1?.initialPageName == e2?.initialPageName &&
        e1?.numSent == e2?.numSent &&
        e1?.parameterData == e2?.parameterData &&
        e1?.status == e2?.status &&
        e1?.targetAudience == e2?.targetAudience &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.userRefs, e2?.userRefs) &&
        e1?.notifypic == e2?.notifypic;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.notificationText,
        e?.notificationTitle,
        e?.initialPageName,
        e?.numSent,
        e?.parameterData,
        e?.status,
        e?.targetAudience,
        e?.timestamp,
        e?.userRefs,
        e?.notifypic
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
