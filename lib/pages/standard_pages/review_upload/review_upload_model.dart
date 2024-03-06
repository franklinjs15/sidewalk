import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'review_upload_widget.dart' show ReviewUploadWidget;
import 'package:flutter/material.dart';

class ReviewUploadModel extends FlutterFlowModel<ReviewUploadWidget> {
  ///  Local state fields for this page.

  bool uploadStarted = false;

  bool commentsAllowed = true;

  bool postIsPublic = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in submitbutton widget.
  VideosRecord? newVidDoc2;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
