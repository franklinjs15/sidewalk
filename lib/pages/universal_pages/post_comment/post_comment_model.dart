import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_comment_widget.dart' show PostCommentWidget;
import 'package:flutter/material.dart';

class PostCommentModel extends FlutterFlowModel<PostCommentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  VidCommentsRecord? newSubComment;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
