import '/flutter_flow/flutter_flow_util.dart';
import 'create_or_edit_industry_widget.dart' show CreateOrEditIndustryWidget;
import 'package:flutter/material.dart';

class CreateOrEditIndustryModel
    extends FlutterFlowModel<CreateOrEditIndustryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for IndustryName widget.
  FocusNode? industryNameFocusNode;
  TextEditingController? industryNameTextController;
  String? Function(BuildContext, String?)? industryNameTextControllerValidator;
  // State field(s) for FeatureCheckbox widget.
  bool? featureCheckboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    industryNameFocusNode?.dispose();
    industryNameTextController?.dispose();
  }
}
