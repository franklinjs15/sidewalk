import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/universal_pages/comments/comments_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'profile_view_videos_model.dart';
export 'profile_view_videos_model.dart';

class ProfileViewVideosWidget extends StatefulWidget {
  const ProfileViewVideosWidget({
    super.key,
    int? indexToStart,
    required this.videos,
  }) : indexToStart = indexToStart ?? 0;

  final int indexToStart;
  final List<VideosRecord>? videos;

  @override
  State<ProfileViewVideosWidget> createState() =>
      _ProfileViewVideosWidgetState();
}

class _ProfileViewVideosWidgetState extends State<ProfileViewVideosWidget>
    with TickerProviderStateMixin {
  late ProfileViewVideosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileViewVideosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileViewVideos'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_VIEW_VIDEOS_ProfileViewVideos_ON');
      logFirebaseEvent('ProfileViewVideos_update_app_state');
      FFAppState().profileVideoIndex = widget.indexToStart;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 8000.0.ms,
            duration: 3000.0.ms,
            begin: const Offset(115.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 8500.0.ms,
            duration: 2000.0.ms,
            hz: 3,
            offset: const Offset(0.0, 0.0),
            rotation: 0.209,
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 95.0),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.ProfilePlayer(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    index: widget.indexToStart,
                    videoUrls: widget.videos!.map((e) => e.videoUrl).toList(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.51, 0.88),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 60.0),
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(widget.videos!
                      .elementAtOrNull(FFAppState().profileVideoIndex)!
                      .creatorID!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitPumpingHeart(
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 40.0,
                          ),
                        ),
                      );
                    }

                    final containerUsersRecord = snapshot.data!;

                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PROFILE_VIEW_VIDEOS_Container_f0xbcm0w_O');
                        logFirebaseEvent('Container_haptic_feedback');
                        HapticFeedback.lightImpact();
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed(
                          'PublicProfile',
                          pathParameters: {
                            'userRef': serializeParam(
                              containerUsersRecord.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: 376.0,
                        height: 40.0,
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.sizeOf(context).width * 0.5,
                          maxWidth: MediaQuery.sizeOf(context).width * 0.75,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0x02000000), Color(0x2E000000)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.87, 1.0),
                            end: AlignmentDirectional(-0.87, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PROFILE_VIEW_VIDEOS_Text_wocy3ml6_ON_TAP');
                                logFirebaseEvent('Text_haptic_feedback');
                                HapticFeedback.lightImpact();
                                logFirebaseEvent('Text_navigate_to');

                                context.pushNamed(
                                  'PublicProfileCopy',
                                  pathParameters: {
                                    'userRef': serializeParam(
                                      containerUsersRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                    ),
                                  },
                                );
                              },
                              child: Text(
                                widget.videos!
                                    .elementAtOrNull(
                                        FFAppState().profileVideoIndex)!
                                    .creatorName,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 21.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 110.0,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 73.0,
                        fillColor: const Color(0x0B202020),
                        icon: Icon(
                          Icons.chevron_left_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 60.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'PROFILE_VIEW_VIDEOS_chevron_left_rounded');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.safePop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 105.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (false)
                      Text(
                        'Visit \nprofiles \n↓   ↓',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              lineHeight: 1.17,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(widget.videos!
                                .elementAtOrNull(
                                    FFAppState().profileVideoIndex)!
                                .creatorID!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitPumpingHeart(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }

                              final containerUsersRecord = snapshot.data!;

                              return Container(
                                width: 53.0,
                                height: 53.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).warning,
                                      FlutterFlowTheme.of(context).pinky
                                    ],
                                    stops: const [0.0, 1.0],
                                    begin: const AlignmentDirectional(0.87, 1.0),
                                    end: const AlignmentDirectional(-0.87, -1.0),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PROFILE_VIEW_VIDEOS_CircleImage_5lqekom5');
                                      logFirebaseEvent(
                                          'CircleImage_haptic_feedback');
                                      HapticFeedback.lightImpact();
                                      logFirebaseEvent(
                                          'CircleImage_navigate_to');

                                      context.pushNamed(
                                        'PublicProfileCopy',
                                        pathParameters: {
                                          'userRef': serializeParam(
                                            containerUsersRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 45.0,
                                      height: 45.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          containerUsersRecord.photoUrl,
                                          'https://picsum.photos/seed/296/600',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!);
                            },
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.0,
                          child: Stack(
                            children: [
                              if (!widget.videos!
                                  .elementAtOrNull(
                                      FFAppState().profileVideoIndex)!
                                  .likedByRef
                                  .contains(currentUserReference))
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.2),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFILE_VIEW_VIDEOS_Image_w8h8m4bx_ON_TA');
                                        logFirebaseEvent(
                                            'Image_haptic_feedback');
                                        HapticFeedback.lightImpact();
                                        logFirebaseEvent('Image_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  const Text('\"Saves\" are coming!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/sidewalk_research-40.png',
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (false)
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                widget.videos
                                    ?.elementAtOrNull(
                                        FFAppState().profileVideoIndex)
                                    ?.likeCount,
                                formatType: FormatType.compact,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PROFILE_VIEW_VIDEOS_Image_7t3h29eu_ON_TA');
                              logFirebaseEvent('Image_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Image_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CommentsWidget(
                                        vidRef: widget.videos!
                                            .elementAtOrNull(
                                                FFAppState().profileVideoIndex)!
                                            .reference,
                                        creatorRef: widget.videos!
                                            .elementAtOrNull(
                                                FFAppState().profileVideoIndex)!
                                            .creatorID!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/ddhaosd.png',
                                width: 35.0,
                                height: 35.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<int>(
                          future: queryCommentsRecordCount(
                            queryBuilder: (commentsRecord) =>
                                commentsRecord.where(
                              'video_ref',
                              isEqualTo: widget.videos
                                  ?.elementAtOrNull(
                                      FFAppState().profileVideoIndex)
                                  ?.reference,
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
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            int textCount = snapshot.data!;

                            return Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  textCount,
                                  formatType: FormatType.compact,
                                ),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PROFILE_VIEW_VIDEOS_Image_6bo64obl_ON_TA');
                                logFirebaseEvent('Image_haptic_feedback');
                                HapticFeedback.lightImpact();
                                logFirebaseEvent('Image_share');
                                await Share.share(
                                  'sidewalk://watchit.page.link${GoRouterState.of(context).uri.toString()}',
                                  sharePositionOrigin:
                                      getWidgetBoundingBox(context),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/sidewalk_research-77.png',
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                      .divide(const SizedBox(height: 32.0))
                      .addToStart(const SizedBox(height: 24.0)),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PROFILE_VIEW_VIDEOS_ADD_COMMENT____BTN_O');
                            logFirebaseEvent('Button_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: CommentsWidget(
                                      vidRef: widget.videos!
                                          .elementAtOrNull(
                                              FFAppState().profileVideoIndex)!
                                          .reference,
                                      creatorRef: widget.videos!
                                          .elementAtOrNull(
                                              FFAppState().profileVideoIndex)!
                                          .creatorID!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: 'Add comment...              😎  🥰  ☕️   ',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x79828485),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
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
    );
  }
}
