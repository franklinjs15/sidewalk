import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'registerpage1_model.dart';
export 'registerpage1_model.dart';

class Registerpage1Widget extends StatefulWidget {
  const Registerpage1Widget({super.key});

  @override
  State<Registerpage1Widget> createState() => _Registerpage1WidgetState();
}

class _Registerpage1WidgetState extends State<Registerpage1Widget>
    with TickerProviderStateMixin {
  late Registerpage1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Registerpage1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'registerpage1'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REGISTERPAGE1_registerpage1_ON_INIT_STAT');
    });

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 14000.0.ms,
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
                  child: Stack(
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
                              colors: [
                                Color(0xFFFF3273),
                                Color(0xFFFF3273),
                                Color(0xFFFF8A2E)
                              ],
                              stops: [0.0, 0.3, 1.0],
                              begin: AlignmentDirectional(-1.0, -0.87),
                              end: AlignmentDirectional(1.0, 0.87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 1.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 460.0,
                            child: CarouselSlider(
                              items: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Image.asset(
                                      'assets/images/sidewalk-29.png',
                                      width: 209.0,
                                      height: 400.0,
                                      fit: BoxFit.cover,
                                      alignment: const Alignment(0.0, 0.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        1.0, 0.0, 0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        'assets/images/sidewalk-26.png',
                                        width: 209.0,
                                        height: 400.0,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(22.0),
                                    child: Image.asset(
                                      'assets/images/sidewalk-25.png',
                                      width: 209.0,
                                      height: 400.0,
                                      fit: BoxFit.cover,
                                      alignment: const Alignment(0.0, 0.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(22.0),
                                    child: Image.asset(
                                      'assets/images/kg_screeno.jpg',
                                      width: 209.0,
                                      height: 400.0,
                                      fit: BoxFit.cover,
                                      alignment: const Alignment(0.0, 0.0),
                                    ),
                                  ),
                                ),
                              ],
                              carouselController: _model.carouselController ??=
                                  CarouselSliderController(),
                              options: CarouselOptions(
                                initialPage: 2,
                                viewportFraction: 0.57,
                                disableCenter: true,
                                enlargeCenterPage: false,
                                enlargeFactor: 0.0,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 2600),
                                autoPlayInterval:
                                    const Duration(milliseconds: (2600 + 0)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: true,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 85.0),
                        child: Text(
                          'Coffee shop owners around the US sharing real-time trends & numbers',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 122.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'REGISTERPAGE1_PAGE_LETS_GO__BTN_ON_TAP');
                              logFirebaseEvent('Button_haptic_feedback');
                              HapticFeedback.heavyImpact();
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'registerpage3',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            text: 'Let\'s go →',
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 63.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation']!),
                        ),
                      ),
                      if (false)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 100.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'REGISTERPAGE1_PAGE_Text_unbbtjme_ON_TAP');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed('registerpage4');
                            },
                            child: Text(
                              'Or Sign In / Sign Up',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 19.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
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
    );
  }
}
