// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends FFFirebaseStruct {
  NotificationStruct({
    String? content,
    bool? userGenerated,
    String? userId,
    DateTime? date,
    String? title,
    String? initialPageName,
    List<ParameterStruct>? parameters,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _content = content,
        _userGenerated = userGenerated,
        _userId = userId,
        _date = date,
        _title = title,
        _initialPageName = initialPageName,
        _parameters = parameters,
        super(firestoreUtilData);

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "user_generated" field.
  bool? _userGenerated;
  bool get userGenerated => _userGenerated ?? false;
  set userGenerated(bool? val) => _userGenerated = val;

  bool hasUserGenerated() => _userGenerated != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "initial_page_name" field.
  String? _initialPageName;
  String get initialPageName => _initialPageName ?? '';
  set initialPageName(String? val) => _initialPageName = val;

  bool hasInitialPageName() => _initialPageName != null;

  // "parameters" field.
  List<ParameterStruct>? _parameters;
  List<ParameterStruct> get parameters => _parameters ?? const [];
  set parameters(List<ParameterStruct>? val) => _parameters = val;

  void updateParameters(Function(List<ParameterStruct>) updateFn) {
    updateFn(_parameters ??= []);
  }

  bool hasParameters() => _parameters != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        content: data['content'] as String?,
        userGenerated: data['user_generated'] as bool?,
        userId: data['user_id'] as String?,
        date: data['date'] as DateTime?,
        title: data['title'] as String?,
        initialPageName: data['initial_page_name'] as String?,
        parameters: getStructList(
          data['parameters'],
          ParameterStruct.fromMap,
        ),
      );

  static NotificationStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'user_generated': _userGenerated,
        'user_id': _userId,
        'date': _date,
        'title': _title,
        'initial_page_name': _initialPageName,
        'parameters': _parameters?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'user_generated': serializeParam(
          _userGenerated,
          ParamType.bool,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'initial_page_name': serializeParam(
          _initialPageName,
          ParamType.String,
        ),
        'parameters': serializeParam(
          _parameters,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        userGenerated: deserializeParam(
          data['user_generated'],
          ParamType.bool,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        initialPageName: deserializeParam(
          data['initial_page_name'],
          ParamType.String,
          false,
        ),
        parameters: deserializeStructParam<ParameterStruct>(
          data['parameters'],
          ParamType.DataStruct,
          true,
          structBuilder: ParameterStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NotificationStruct &&
        content == other.content &&
        userGenerated == other.userGenerated &&
        userId == other.userId &&
        date == other.date &&
        title == other.title &&
        initialPageName == other.initialPageName &&
        listEquality.equals(parameters, other.parameters);
  }

  @override
  int get hashCode => const ListEquality().hash([
        content,
        userGenerated,
        userId,
        date,
        title,
        initialPageName,
        parameters
      ]);
}

NotificationStruct createNotificationStruct({
  String? content,
  bool? userGenerated,
  String? userId,
  DateTime? date,
  String? title,
  String? initialPageName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationStruct(
      content: content,
      userGenerated: userGenerated,
      userId: userId,
      date: date,
      title: title,
      initialPageName: initialPageName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationStruct? updateNotificationStruct(
  NotificationStruct? notification, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notification
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationStructData(
  Map<String, dynamic> firestoreData,
  NotificationStruct? notification,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notification == null) {
    return;
  }
  if (notification.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notification.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationData =
      getNotificationFirestoreData(notification, forFieldValue);
  final nestedData =
      notificationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notification.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationFirestoreData(
  NotificationStruct? notification, [
  bool forFieldValue = false,
]) {
  if (notification == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notification.toMap());

  // Add any Firestore field values
  notification.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationListFirestoreData(
  List<NotificationStruct>? notifications,
) =>
    notifications?.map((e) => getNotificationFirestoreData(e, true)).toList() ??
    [];
