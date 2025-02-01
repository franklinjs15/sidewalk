import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'registerpage3_model.dart';
export 'registerpage3_model.dart';

class Registerpage3Widget extends StatefulWidget {
  const Registerpage3Widget({super.key});

  @override
  State<Registerpage3Widget> createState() => _Registerpage3WidgetState();
}

class _Registerpage3WidgetState extends State<Registerpage3Widget>
    with TickerProviderStateMixin {
  late Registerpage3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Registerpage3Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'registerpage3'});
    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 15000.0.ms,
            duration: 1000.0.ms,
            hz: 2,
            offset: const Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
    });

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
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: double.infinity,
                  height: 950.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            constraints: const BoxConstraints(
                              minHeight: 900.0,
                            ),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFFF3273), Color(0xFFFF8A2E)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(-1.0, -0.87),
                                end: AlignmentDirectional(1.0, 0.87),
                              ),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        13.0, 0.0, 0.0, 10.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x1D000000),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-0.16, -0.1),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'REGISTERPAGE3_PAGE_Icon_hfv50z9d_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_navigate_to');

                                            context.pushNamed(
                                              'registerpage1',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .leftToRight,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                ),
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 28.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 14.0, 0.0),
                                  child: Text(
                                    'After you sign-in, you\'ll see a pop up like the one below. Make sure to click \"Allow\" so you\'re notified when I add new videos! ',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 21.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 140.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/sidewalk_research-72.png',
                                        width: 330.0,
                                        height: 310.0,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 16.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'REGISTERPAGE3_CONTINUE_AS_GUEST_BTN_ON_T');
                                        logFirebaseEvent(
                                            'Button_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        logFirebaseEvent('Button_auth');
                                        GoRouter.of(context).prepareAuthEvent();
                                        final user = await authManager
                                            .signInAnonymously(context);
                                        if (user == null) {
                                          return;
                                        }

                                        context.goNamedAuth(
                                            'HomePage', context.mounted);
                                      },
                                      text: 'Continue as Guest',
                                      options: FFButtonOptions(
                                        width: 350.0,
                                        height: 63.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.black,
                                              fontSize: 25.0,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'buttonOnPageLoadAnimation']!),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 85.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'REGISTERPAGE3_PAGE_Text_00t94wre_ON_TAP');
                                        logFirebaseEvent('Text_navigate_to');

                                        context.pushNamed('registerpage4');
                                      },
                                      child: Text(
                                        'Or Sign In / Sign Up',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 19.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
