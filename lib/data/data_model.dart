import '/flutter_flow/flutter_flow_util.dart';
import 'data_widget.dart' show DataWidget;
import 'package:flutter/material.dart';

class DataModel extends FlutterFlowModel<DataWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future<String?> tooltip(BuildContext context) async {
    String? fdf;

    logFirebaseEvent('Tooltip_action_block');
    fdf = await tooltip(context);

    return null;
  }
}
