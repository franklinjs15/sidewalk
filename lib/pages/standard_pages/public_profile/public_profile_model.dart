import '/flutter_flow/flutter_flow_util.dart';
import 'public_profile_widget.dart' show PublicProfileWidget;
import 'package:flutter/material.dart';

class PublicProfileModel extends FlutterFlowModel<PublicProfileWidget> {
  ///  Local state fields for this page.

  int? activePageView = 0;

  bool uploadSelectVis = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
