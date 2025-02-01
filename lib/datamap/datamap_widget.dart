import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'datamap_model.dart';
export 'datamap_model.dart';

class DatamapWidget extends StatefulWidget {
  const DatamapWidget({super.key});

  @override
  State<DatamapWidget> createState() => _DatamapWidgetState();
}

class _DatamapWidgetState extends State<DatamapWidget>
    with TickerProviderStateMixin {
  late DatamapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatamapModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'datamap'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DATAMAP_PAGE_datamap_ON_INIT_STATE');
      logFirebaseEvent('datamap_haptic_feedback');
      HapticFeedback.mediumImpact();
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 150.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 100.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 300.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 350.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 350.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 500.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 500.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 200.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation15': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation16': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation17': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation18': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation19': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 400.0.ms,
            duration: 910.0.ms,
            begin: const Offset(-3.0, -3.0),
            end: const Offset(1.0, 1.0),
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
        backgroundColor: const Color(0xFFFDF5F1),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: RefreshIndicator(
              onRefresh: () async {},
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 10.0),
                      child: Container(
                        width: 300.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F6F1),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0x43696969),
                            width: 0.2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 1.0),
                                child: Text(
                                  'Total Employee Wages Analyzed',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.15,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                '174 Employees',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (valueOrDefault(currentUserDocument?.wages, '') == '')
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              'Hourly Wages by Shop',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/US-states-Abbreviation-map.jpg',
                                width: 380.0,
                                height: 270.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_gp0jh0yh_ON_TAP');
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Holland, Michigan'),
                                        content: const Text(
                                            '19,000 Population                   \$1,500/Mo'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation1']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.13, -0.63),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 170.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_jf1jsywl_ON_TAP');
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation2']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 35.0, 220.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_nuczn1et_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation3']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.52, -0.43),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  100.0, 190.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_a7mw9ak4_ON_TAP');
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Holland, Michigan'),
                                        content: const Text(
                                            '19,000 Population                   \$1,500/Mo'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation4']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.09, -0.96),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_5dn82z97_ON_TAP');
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Holland, Michigan'),
                                        content: const Text(
                                            '19,000 Population                   \$1,500/Mo'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation5']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.44, -0.31),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 90.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_bupae7d0_ON_TAP');
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Holland, Michigan'),
                                        content: const Text(
                                            '19,000 Population                   \$1,500/Mo'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation6']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.28, -0.15),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_2uxxmpjy_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.heavyImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation7']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 210.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_elemfx3e_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation8']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 160.0, 90.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_m5qkh2x8_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation9']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 100.0, 30.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_hj3rnszy_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation10']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  170.0, 90.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_9bj9w75c_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation11']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 90.0, 290.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_76lc1n6a_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation12']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 70.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_smkfxnls_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation13']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  50.0, 90.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_taefwsv7_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation14']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  200.0, 160.0, 90.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_h9yfgjel_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation15']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  300.0, 100.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_dzz357iu_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation16']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 70.0, 160.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_99f4rfbt_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation17']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.5, 0.26),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_kkng6a2z_ON_TAP');
                                  logFirebaseEvent('Icon_haptic_feedback');
                                  HapticFeedback.mediumImpact();
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Colorado Spring, CO'),
                                        content: const Text(
                                            '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation18']!),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.52, -0.43),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 160.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DATAMAP_PAGE_Icon_cjoza04l_ON_TAP');
                                  logFirebaseEvent('Icon_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Holland, Michigan'),
                                        content: const Text(
                                            '19,000 Population                   \$1,500/Mo'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.location_pin,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation19']!),
                            ),
                          ),
                        ],
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
