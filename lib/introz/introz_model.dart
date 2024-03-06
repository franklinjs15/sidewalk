import '/flutter_flow/flutter_flow_util.dart';
import 'introz_widget.dart' show IntrozWidget;
import 'package:flutter/material.dart';

class IntrozModel extends FlutterFlowModel<IntrozWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
