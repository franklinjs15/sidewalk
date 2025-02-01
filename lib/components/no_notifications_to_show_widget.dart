import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_notifications_to_show_model.dart';
export 'no_notifications_to_show_model.dart';

class NoNotificationsToShowWidget extends StatefulWidget {
  const NoNotificationsToShowWidget({super.key});

  @override
  State<NoNotificationsToShowWidget> createState() =>
      _NoNotificationsToShowWidgetState();
}

class _NoNotificationsToShowWidgetState
    extends State<NoNotificationsToShowWidget> {
  late NoNotificationsToShowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoNotificationsToShowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.0,
      height: 377.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 100.0,
          ),
          Text(
            'No Notifications To Display',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Dekko',
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
