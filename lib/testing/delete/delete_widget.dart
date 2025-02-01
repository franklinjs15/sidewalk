import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'delete_model.dart';
export 'delete_model.dart';

class DeleteWidget extends StatefulWidget {
  const DeleteWidget({super.key});

  @override
  State<DeleteWidget> createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget>
    with TickerProviderStateMixin {
  late DeleteModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.12,
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
    return Visibility(
      visible: false,
      child: Align(
        alignment: const AlignmentDirectional(0.0, 1.0),
        child: Material(
          color: Colors.transparent,
          elevation: 2.0,
          child: Container(
            width: double.infinity,
            height: 72.0,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: const Icon(
                                    Icons.home_outlined,
                                    color: Colors.black,
                                    size: 26.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'DELETE_COMP_home_outlined_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.goNamed(
                                      'HomePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'DELETE_COMP_Container_cjnjl3bf_ON_TAP');
                              },
                              child: Container(
                                width: 46.0,
                                height: 34.0,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFF0094),
                                      Color(0xFF5A0DB7)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 2.0, 4.0, 2.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 92.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 24.0,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'iconOnActionTriggerAnimation']!,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 26.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'DELETE_COMP_person_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.goNamed(
                                      'UserAccount',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(width: 2.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
