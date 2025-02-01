import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_industries_widget.dart' show ListOfIndustriesWidget;
import 'package:flutter/material.dart';

class ListOfIndustriesModel extends FlutterFlowModel<ListOfIndustriesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<IndustriesRecord, bool> checkboxValueMap = {};
  List<IndustriesRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
