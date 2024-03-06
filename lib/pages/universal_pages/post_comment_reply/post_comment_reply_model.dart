import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_comment_reply_widget.dart' show PostCommentReplyWidget;
import 'package:flutter/material.dart';

class PostCommentReplyModel extends FlutterFlowModel<PostCommentReplyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for replytoField widget.
  FocusNode? replytoFieldFocusNode;
  TextEditingController? replytoFieldController;
  String? Function(BuildContext, String?)? replytoFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  VidSubCommentsRecord? newSubComment;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  VidSubCommentsRecord? newSubComment1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    replytoFieldFocusNode?.dispose();
    replytoFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
