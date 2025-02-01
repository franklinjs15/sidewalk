// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ParameterStruct extends FFFirebaseStruct {
  ParameterStruct({
    String? key,
    String? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _key = key,
        _value = value,
        super(firestoreUtilData);

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static ParameterStruct fromMap(Map<String, dynamic> data) => ParameterStruct(
        key: data['key'] as String?,
        value: data['value'] as String?,
      );

  static ParameterStruct? maybeFromMap(dynamic data) => data is Map
      ? ParameterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'key': _key,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static ParameterStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParameterStruct(
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ParameterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParameterStruct && key == other.key && value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([key, value]);
}

ParameterStruct createParameterStruct({
  String? key,
  String? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParameterStruct(
      key: key,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParameterStruct? updateParameterStruct(
  ParameterStruct? parameter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    parameter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParameterStructData(
  Map<String, dynamic> firestoreData,
  ParameterStruct? parameter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (parameter == null) {
    return;
  }
  if (parameter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && parameter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final parameterData = getParameterFirestoreData(parameter, forFieldValue);
  final nestedData = parameterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = parameter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParameterFirestoreData(
  ParameterStruct? parameter, [
  bool forFieldValue = false,
]) {
  if (parameter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(parameter.toMap());

  // Add any Firestore field values
  parameter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParameterListFirestoreData(
  List<ParameterStruct>? parameters,
) =>
    parameters?.map((e) => getParameterFirestoreData(e, true)).toList() ?? [];
