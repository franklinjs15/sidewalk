import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'landingpageweb_model.dart';
export 'landingpageweb_model.dart';

class LandingpagewebWidget extends StatefulWidget {
  const LandingpagewebWidget({super.key});

  @override
  State<LandingpagewebWidget> createState() => _LandingpagewebWidgetState();
}

class _LandingpagewebWidgetState extends State<LandingpagewebWidget> {
  late LandingpagewebModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingpagewebModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'landingpageweb'});
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
                  height: 990.0,
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
                              colors: [Color(0xFFEA2291), Color(0xFFFF8A2E)],
                              stops: [0.2, 1.0],
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
                alignment: const AlignmentDirectional(0.0, -1.0),
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
                              0.0, 5.0, 0.0, 0.0),
                          child: SizedBox(
                            width: 500.0,
                            height: 330.0,
                            child: CarouselSlider(
                              items: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        1.0, 0.0, 1.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Image.asset(
                                        'assets/images/sidewalk-29.png',
                                        width: 164.0,
                                        height: 300.0,
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
                                        1.0, 0.0, 1.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Image.asset(
                                        'assets/images/sidewalk-26.png',
                                        width: 164.0,
                                        height: 300.0,
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
                                        1.0, 0.0, 1.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Image.asset(
                                        'assets/images/sidewalk-25.png',
                                        width: 164.0,
                                        height: 300.0,
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
                                        1.0, 0.0, 1.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Image.asset(
                                        'assets/images/kg_screeno.jpg',
                                        width: 164.0,
                                        height: 300.0,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              carouselController: _model.carouselController ??=
                                  CarouselSliderController(),
                              options: CarouselOptions(
                                initialPage: 2,
                                viewportFraction: 0.45,
                                disableCenter: true,
                                enlargeCenterPage: false,
                                enlargeFactor: 0.0,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 3000),
                                autoPlayInterval:
                                    const Duration(milliseconds: (3000 + 0)),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            23.0, 8.0, 23.0, 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: Text(
                              'Small business owners sharing insights coast to coast📍',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Bangers',
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'LANDINGPAGEWEB_Image_n70iu0qi_ON_TAP');
                                logFirebaseEvent('Image_haptic_feedback');
                                HapticFeedback.lightImpact();
                                logFirebaseEvent('Image_launch_u_r_l');
                                await launchURL(
                                    'https://apps.apple.com/us/app/sidewalk-coffee-shops/id6472616630');
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Download_on_the_App_Store_Badge.svg.png',
                                  width: 174.0,
                                  height: 55.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'LANDINGPAGEWEB_Image_09m6mc6r_ON_TAP');
                                  logFirebaseEvent('Image_haptic_feedback');
                                  HapticFeedback.lightImpact();
                                  logFirebaseEvent('Image_launch_u_r_l');
                                  await launchURL(
                                      'https://play.google.com/store/apps/details?id=com.sidewalkcoffeeshops&pcampaignid=web_share');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/en_badge_web_generic.png',
                                    width: 195.0,
                                    height: 53.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 1.0),
                        child: Container(
                          width: 350.0,
                          height: 320.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/sidewalk_research-73.png',
                                    width: 210.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 22.0),
                                  child: Text(
                                    '\"What a fun way for us small business owners to keep up on trends\"\n- @pacman  ⭐️⭐️⭐️⭐️⭐️',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 22.0),
                                  child: Text(
                                    '“Looking forward to seeing what other categories they add!\"\n-@user ⭐️⭐️⭐️⭐️⭐️',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    '“Great info if you own a business or thinking about starting one!\n-@TiffA ⭐️⭐️⭐️⭐️⭐️',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (MediaQuery.sizeOf(context).width >= 600.0)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/sidewalk_research-67.png',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
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
