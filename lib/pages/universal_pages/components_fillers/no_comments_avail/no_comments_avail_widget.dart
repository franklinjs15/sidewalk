import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'no_comments_avail_model.dart';
export 'no_comments_avail_model.dart';

class NoCommentsAvailWidget extends StatefulWidget {
  const NoCommentsAvailWidget({super.key});

  @override
  State<NoCommentsAvailWidget> createState() => _NoCommentsAvailWidgetState();
}

class _NoCommentsAvailWidgetState extends State<NoCommentsAvailWidget> {
  late NoCommentsAvailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoCommentsAvailModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 160.0,
        height: 188.0,
        decoration: BoxDecoration(
          color: const Color(0xFF5A0DB7),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x34090F13),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  'There are no comments here',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Dekko',
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
