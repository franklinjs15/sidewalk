import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_copy_widget.dart' show FeedbackCopyWidget;
import 'package:flutter/material.dart';

class FeedbackCopyModel extends FlutterFlowModel<FeedbackCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for updateEmail widget.
  FocusNode? updateEmailFocusNode;
  TextEditingController? updateEmailController;
  String? Function(BuildContext, String?)? updateEmailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    updateEmailFocusNode?.dispose();
    updateEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
