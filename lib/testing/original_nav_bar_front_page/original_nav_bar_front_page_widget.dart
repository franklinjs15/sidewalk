import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'original_nav_bar_front_page_model.dart';
export 'original_nav_bar_front_page_model.dart';

class OriginalNavBarFrontPageWidget extends StatefulWidget {
  const OriginalNavBarFrontPageWidget({super.key});

  @override
  State<OriginalNavBarFrontPageWidget> createState() =>
      _OriginalNavBarFrontPageWidgetState();
}

class _OriginalNavBarFrontPageWidgetState
    extends State<OriginalNavBarFrontPageWidget> with TickerProviderStateMixin {
  late OriginalNavBarFrontPageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OriginalNavBarFrontPageModel());

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
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 77.0,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(2.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: const Icon(
                                Icons.home_outlined,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ORIGINAL_NAV_BAR_FRONT_home_outlined_ICN');
                                logFirebaseEvent('IconButton_navigate_to');

                                context.pushNamed('HomePage');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Colors.transparent,
                              icon: const Icon(
                                Icons.search_rounded,
                                color: Color(0xFFAEAEAE),
                                size: 35.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ORIGINAL_NAV_BAR_FRONT_search_rounded_IC');
                                logFirebaseEvent('IconButton_navigate_to');

                                context.pushNamed('newcategories_page');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (false)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ORIGINAL_NAV_BAR_FRONT_Container_zx7opnq');
                          logFirebaseEvent('Container_haptic_feedback');
                          HapticFeedback.mediumImpact();
                        },
                        child: Container(
                          width: 46.0,
                          height: 34.0,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF00B8FF), Color(0xFF0DB77D)],
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.add,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ).animateOnActionTrigger(
                                animationsMap['iconOnActionTriggerAnimation']!,
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
                            color: Color(0xFFAEAEAE),
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'ORIGINAL_NAV_BAR_FRONT_person_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_to');

                            context.goNamed(
                              'UserAccount',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(width: 1.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
