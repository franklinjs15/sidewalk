// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IndustryStruct extends FFFirebaseStruct {
  IndustryStruct({
    DocumentReference? industryRef,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _industryRef = industryRef,
        _name = name,
        super(firestoreUtilData);

  // "industry_ref" field.
  DocumentReference? _industryRef;
  DocumentReference? get industryRef => _industryRef;
  set industryRef(DocumentReference? val) => _industryRef = val;

  bool hasIndustryRef() => _industryRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static IndustryStruct fromMap(Map<String, dynamic> data) => IndustryStruct(
        industryRef: data['industry_ref'] as DocumentReference?,
        name: data['name'] as String?,
      );

  static IndustryStruct? maybeFromMap(dynamic data) =>
      data is Map ? IndustryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'industry_ref': _industryRef,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'industry_ref': serializeParam(
          _industryRef,
          ParamType.DocumentReference,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static IndustryStruct fromSerializableMap(Map<String, dynamic> data) =>
      IndustryStruct(
        industryRef: deserializeParam(
          data['industry_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['industries'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IndustryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IndustryStruct &&
        industryRef == other.industryRef &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([industryRef, name]);
}

IndustryStruct createIndustryStruct({
  DocumentReference? industryRef,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IndustryStruct(
      industryRef: industryRef,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IndustryStruct? updateIndustryStruct(
  IndustryStruct? industry, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    industry
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIndustryStructData(
  Map<String, dynamic> firestoreData,
  IndustryStruct? industry,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (industry == null) {
    return;
  }
  if (industry.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && industry.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final industryData = getIndustryFirestoreData(industry, forFieldValue);
  final nestedData = industryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = industry.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIndustryFirestoreData(
  IndustryStruct? industry, [
  bool forFieldValue = false,
]) {
  if (industry == null) {
    return {};
  }
  final firestoreData = mapToFirestore(industry.toMap());

  // Add any Firestore field values
  industry.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIndustryListFirestoreData(
  List<IndustryStruct>? industrys,
) =>
    industrys?.map((e) => getIndustryFirestoreData(e, true)).toList() ?? [];
