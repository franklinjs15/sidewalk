import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registerpage2_model.dart';
export 'registerpage2_model.dart';

class Registerpage2Widget extends StatefulWidget {
  const Registerpage2Widget({super.key});

  @override
  State<Registerpage2Widget> createState() => _Registerpage2WidgetState();
}

class _Registerpage2WidgetState extends State<Registerpage2Widget> {
  late Registerpage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Registerpage2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'registerpage2'});
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
                              colors: [Color(0xFFFF3273), Color(0xFFFF8A2E)],
                              stops: [0.0, 1.0],
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    23.0, 25.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: 190.0,
                                  height: 460.0,
                                  child: CarouselSlider(
                                    items: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          child: Image.asset(
                                            'assets/images/IMG_6059.PNG',
                                            width: 180.0,
                                            height: 400.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.asset(
                                            'assets/images/IMG_6056.PNG',
                                            width: 180.0,
                                            height: 400.0,
                                            fit: BoxFit.cover,
                                            alignment: const Alignment(0.0, 0.0),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.asset(
                                            'assets/images/IMG_6057.PNG',
                                            width: 180.0,
                                            height: 410.0,
                                            fit: BoxFit.cover,
                                            alignment: const Alignment(0.0, 0.0),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                          child: Image.asset(
                                            'assets/images/IMG_6058.PNG',
                                            width: 180.0,
                                            height: 420.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                    carouselController:
                                        _model.carouselController ??=
                                            CarouselSliderController(),
                                    options: CarouselOptions(
                                      initialPage: 1,
                                      viewportFraction: 0.77,
                                      disableCenter: true,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.15,
                                      enableInfiniteScroll: true,
                                      scrollDirection: Axis.vertical,
                                      autoPlay: true,
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 800),
                                      autoPlayInterval:
                                          const Duration(milliseconds: (800 + 900)),
                                      autoPlayCurve: Curves.linear,
                                      pauseAutoPlayInFiniteScroll: true,
                                      onPageChanged: (index, _) =>
                                          _model.carouselCurrentIndex = index,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 75.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/sidewalk_research-10.gif',
                                    width: 170.0,
                                    height: 312.0,
                                    fit: BoxFit.contain,
                                    alignment: const Alignment(0.0, 0.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 40.0),
                              child: Text(
                                'When you\'re in the app, swipe up on videos to watch the next one',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (false)
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 9.0, 0.0, 18.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 115.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x7A3A3939),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                Container(
                                  width: 115.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                Container(
                                  width: 115.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x7A3A3939),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.6),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'REGISTERPAGE2_CONTINUE_AS_GUEST_BTN_ON_T');
                              logFirebaseEvent('Button_haptic_feedback');
                              HapticFeedback.heavyImpact();
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'registerpage3',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            text: 'Continue as Guest',
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 63.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF1F85EC),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 27.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Color(0xFF1F85EC),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 40.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'REGISTERPAGE2_PAGE_Text_llqnsqwx_ON_TAP');
                              logFirebaseEvent('Text_navigate_back');
                              context.safePop();
                            },
                            child: Text(
                              'Back',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFD8DBDD),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
    );
  }
}
