import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'commentscoming_model.dart';
export 'commentscoming_model.dart';

class CommentscomingWidget extends StatefulWidget {
  const CommentscomingWidget({super.key});

  @override
  State<CommentscomingWidget> createState() => _CommentscomingWidgetState();
}

class _CommentscomingWidgetState extends State<CommentscomingWidget>
    with TickerProviderStateMixin {
  late CommentscomingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentscomingModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(70.0, 12.0, 70.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3416202A),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Comments coming soon!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          color: const Color(0xFF14181B),
                          fontSize: 19.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ).animateOnActionTrigger(
          animationsMap['containerOnActionTriggerAnimation']!,
        ),
      ),
    );
  }
}
