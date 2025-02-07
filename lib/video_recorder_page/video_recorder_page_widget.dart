import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'video_recorder_page_model.dart';
export 'video_recorder_page_model.dart';

class VideoRecorderPageWidget extends StatefulWidget {
  const VideoRecorderPageWidget({
    super.key,
    required this.clipType,
  });

  /// Type of clip being recorded (rent, sales, employees)
  final String? clipType;

  @override
  State<VideoRecorderPageWidget> createState() =>
      _VideoRecorderPageWidgetState();
}

class _VideoRecorderPageWidgetState extends State<VideoRecorderPageWidget> {
  late VideoRecorderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoRecorderPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'videoRecorderPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: custom_widgets.VideoRecorder(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  clipType: '\${param.clipType}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
