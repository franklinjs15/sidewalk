import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/universal_pages/comments/comments_widget.dart';
import '/pages/universal_pages/extras/create_or_edit_industry_menu/create_or_edit_industry_menu_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 16000.0.ms,
            duration: 3000.0.ms,
            begin: const Offset(115.0, 0.0),
            end: const Offset(0.0, 0.0),
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: responsiveVisibility(
            context: context,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: const Color(0xFF38B6FF),
                  automaticallyImplyLeading: false,
                  title: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 3.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'HOME_PAGE_PAGE_Text_603um0p6_ON_TAP');
                          logFirebaseEvent('Text_navigate_to');

                          context.pushNamed('recordvideo');
                        },
                        child: Text(
                          'SidewalkTV',
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
                    ),
                  ),
                  actions: const [],
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/sidewalk_research_(APP_icon)-16.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  centerTitle: false,
                  toolbarHeight: 35.0,
                  elevation: 0.0,
                )
              : null,
          body: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView(
                    controller: _model.pageViewController ??= PageController(
                        initialPage: max(
                            0,
                            min(
                                valueOrDefault<int>(
                                  _model.activePageViewHome,
                                  1,
                                ),
                                1))),
                    onPageChanged: (_) async {
                      logFirebaseEvent(
                          'HOME_PAGE_PAGE_pageView_ON_WIDGET_SWIPE');
                      logFirebaseEvent('pageView_update_page_state');
                      _model.activePageViewHome = valueOrDefault<int>(
                        _model.pageViewCurrentIndex,
                        1,
                      );
                      safeSetState(() {});
                    },
                    scrollDirection: Axis.horizontal,
                    children: [
                      Visibility(
                        visible: false,
                        child: Stack(
                          children: [
                            if ((currentUserDocument?.userHash.toList() ?? []).isEmpty)
                              Align(
                                alignment: const AlignmentDirectional(-0.01, -0.42),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 286.0,
                                    height: 77.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Recommendations unavailable',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Dekko',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((currentUserDocument?.userHash.toList() ?? []).isNotEmpty)
                              AuthUserStreamWidget(
                                builder: (context) => const SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child:
                                      custom_widgets.ShiguPlayrRecommendations(
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 98.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 62.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_ProfilePic_ON_TAP');
                                          logFirebaseEvent(
                                              'ProfilePic_navigate_to');

                                          context.pushNamed(
                                            'PublicProfile',
                                            pathParameters: {
                                              'userRef': serializeParam(
                                                FFAppState().tempCreatorID,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 56.0,
                                          height: 52.0,
                                          decoration: const BoxDecoration(),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_PAGE_Column_5uo80kkj_ON_TAP');
                                        logFirebaseEvent('Column_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CommentsWidget(
                                                  vidRef:
                                                      FFAppState().tempVidID!,
                                                  creatorRef: FFAppState()
                                                      .tempCreatorID!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
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
                                                  'HOME_PAGE_PAGE_Comment_ON_TAP');
                                              logFirebaseEvent(
                                                  'Comment_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: CommentsWidget(
                                                        vidRef: FFAppState()
                                                            .tempVidID!,
                                                        creatorRef: FFAppState()
                                                            .tempCreatorID!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Container(
                                              width: 56.0,
                                              height: 52.0,
                                              decoration: const BoxDecoration(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 22.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Share_ON_TAP');
                                                logFirebaseEvent('Share_share');
                                                await Share.share(
                                                  '',
                                                  sharePositionOrigin:
                                                      getWidgetBoundingBox(
                                                          context),
                                                );
                                              },
                                              child: Container(
                                                width: 56.0,
                                                height: 52.0,
                                                decoration: const BoxDecoration(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 32.0))
                                      .addToEnd(const SizedBox(height: 55.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            const Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.ShiguPlayr(
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            if (false)
                              Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 85.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (false)
                                        Text(
                                          'Visit \nprofiles \n↓    ↓',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation']!),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_ProfilePic_ON_TAP');
                                          logFirebaseEvent(
                                              'ProfilePic_haptic_feedback');
                                          HapticFeedback.lightImpact();
                                          logFirebaseEvent(
                                              'ProfilePic_navigate_to');

                                          context.pushNamed(
                                            'PublicProfileCopy',
                                            pathParameters: {
                                              'userRef': serializeParam(
                                                FFAppState().tempCreatorID,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 56.0,
                                          height: 58.0,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_Column_tvkp1e8i_ON_TAP');
                                          logFirebaseEvent(
                                              'Column_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: CommentsWidget(
                                                    vidRef:
                                                        FFAppState().tempVidID!,
                                                    creatorRef: FFAppState()
                                                        .tempCreatorID!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Like_ON_TAP');
                                              },
                                              child: Container(
                                                width: 53.0,
                                                height: 52.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_Column_rvngrk9h_ON_TAP');
                                          logFirebaseEvent(
                                              'Column_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: CommentsWidget(
                                                    vidRef:
                                                        FFAppState().tempVidID!,
                                                    creatorRef: FFAppState()
                                                        .tempCreatorID!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Comment_ON_TAP');
                                                logFirebaseEvent(
                                                    'Comment_haptic_feedback');
                                                HapticFeedback.lightImpact();
                                                logFirebaseEvent(
                                                    'Comment_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: CommentsWidget(
                                                          vidRef: FFAppState()
                                                              .tempVidID!,
                                                          creatorRef: FFAppState()
                                                              .tempCreatorID!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Container(
                                                width: 56.0,
                                                height: 52.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Share_ON_TAP');
                                                logFirebaseEvent(
                                                    'Share_haptic_feedback');
                                                HapticFeedback.mediumImpact();
                                                logFirebaseEvent('Share_share');
                                                await Share.share(
                                                  valueOrDefault<String>(
                                                    'sidewalk://watchit.page.link${GoRouterState.of(context).uri.toString()}',
                                                    'sidewalk://watchit.page.link/homePageExt',
                                                  ),
                                                  sharePositionOrigin:
                                                      getWidgetBoundingBox(
                                                          context),
                                                );
                                              },
                                              child: Container(
                                                width: 56.0,
                                                height: 53.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 22.0)),
                                  ),
                                ),
                              ),
                            if (false)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 175.0, 50.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_Container_eogdo6rz_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_haptic_feedback');
                                          HapticFeedback.lightImpact();
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            'PublicProfileCopy',
                                            pathParameters: {
                                              'userRef': serializeParam(
                                                FFAppState().tempCreatorID,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 199.0,
                                          height: 55.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (false)
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        decoration: const BoxDecoration(),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 8.0, 12.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StreamBuilder<List<IndustriesRecord>>(
                                stream: queryIndustriesRecord(
                                  queryBuilder: (industriesRecord) =>
                                      industriesRecord.where(
                                    'featured',
                                    isEqualTo: true,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitPumpingHeart(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<IndustriesRecord>
                                      rowIndustriesRecordList = snapshot.data!;

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                          rowIndustriesRecordList.length,
                                          (rowIndex) {
                                        final rowIndustriesRecord =
                                            rowIndustriesRecordList[rowIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_PAGE_Column_har6ddz5_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_update_page_state');
                                              _model.selectedIndustry =
                                                  rowIndustriesRecord.reference;
                                              logFirebaseEvent(
                                                  'Column_update_app_state');
                                              FFAppState()
                                                      .currentSelectedIndustry =
                                                  rowIndustriesRecord.reference;
                                              safeSetState(() {});
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 2.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_PAGE_Text_8gn6h363_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_update_page_state');
                                                      _model.selectedIndustry =
                                                          rowIndustriesRecord
                                                              .reference;
                                                      logFirebaseEvent(
                                                          'Text_update_app_state');
                                                      FFAppState()
                                                              .currentSelectedIndustry =
                                                          rowIndustriesRecord
                                                              .reference;
                                                      safeSetState(() {});
                                                    },
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        rowIndustriesRecord
                                                            .name,
                                                        'Explore',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.selectedIndustry ==
                                                                      rowIndustriesRecord
                                                                          .reference
                                                                  ? Colors.white
                                                                  : const Color(
                                                                      0xC5ECECEC),
                                                              const Color(0xB5ECECEC),
                                                            ),
                                                            fontSize: 19.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.activePageViewHome ==
                                                    0)
                                                  const Opacity(
                                                    opacity: 0.0,
                                                    child: SizedBox(
                                                      width: 32.0,
                                                      child: Divider(
                                                        height: 2.0,
                                                        thickness: 3.0,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.isAdmin, false))
                                AuthUserStreamWidget(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_PAGE_industryBtn_ON_TAP');
                                      logFirebaseEvent(
                                          'industryBtn_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        isDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  const CreateOrEditIndustryMenuWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (false)
                Align(
                  alignment: const AlignmentDirectional(0.84, -0.96),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    fillColor: const Color(0x35000000),
                    icon: Icon(
                      Icons.notifications_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'HOME_PAGE_PAGE_notificationsBtn_ON_TAP');
                      logFirebaseEvent('notificationsBtn_navigate_to');

                      context.pushNamed('Notifications');
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
