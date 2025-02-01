import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/universal_pages/comments/comments_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'view_vid_upload_model.dart';
export 'view_vid_upload_model.dart';

class ViewVidUploadWidget extends StatefulWidget {
  const ViewVidUploadWidget({
    super.key,
    required this.vidRef,
  });

  final DocumentReference? vidRef;

  @override
  State<ViewVidUploadWidget> createState() => _ViewVidUploadWidgetState();
}

class _ViewVidUploadWidgetState extends State<ViewVidUploadWidget>
    with TickerProviderStateMixin {
  late ViewVidUploadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewVidUploadModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'viewVidUpload'});
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 1.0,
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

    return StreamBuilder<VideosRecord>(
      stream: VideosRecord.getDocument(widget.vidRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitPumpingHeart(
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }

        final viewVidUploadVideosRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.TekPlay(
                      width: double.infinity,
                      height: double.infinity,
                      videoUrl: viewVidUploadVideosRecord.videoUrl,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.51, 0.88),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 36.0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            viewVidUploadVideosRecord.creatorID!),
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

                          return Container(
                            width: 306.0,
                            height: 111.0,
                            constraints: BoxConstraints(
                              minWidth: MediaQuery.sizeOf(context).width * 0.5,
                              maxWidth: MediaQuery.sizeOf(context).width * 0.75,
                            ),
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIEW_VID_UPLOAD_Text_cm8s5wzh_ON_TAP');
                                          logFirebaseEvent(
                                              'Text_haptic_feedback');
                                          HapticFeedback.lightImpact();
                                          logFirebaseEvent('Text_navigate_to');

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
                                        child: Text(
                                          containerUsersRecord.displayName,
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
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (false)
                                          Expanded(
                                            child: Text(
                                              viewVidUploadVideosRecord.content,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        lineHeight: 2.0,
                                                      ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 42.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 45.0,
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_sharp,
                                    color: Colors.white,
                                    size: 36.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VIEW_VID_UPLOAD_arrow_back_ios_new_sharp');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.safePop();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 36.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    viewVidUploadVideosRecord.creatorID!),
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

                                  final containerUsersRecord = snapshot.data!;

                                  return Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                                              'VIEW_VID_UPLOAD_CircleImage_l4qniap0_ON_');
                                          logFirebaseEvent(
                                              'CircleImage_haptic_feedback');
                                          HapticFeedback.lightImpact();
                                          logFirebaseEvent(
                                              'CircleImage_navigate_to');

                                          context.pushNamed(
                                            'PublicProfileCopy',
                                            pathParameters: {
                                              'userRef': serializeParam(
                                                FFAppState().tempCreatorID,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
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
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 40.0,
                                child: Stack(
                                  children: [
                                    if (!viewVidUploadVideosRecord.likedByRef
                                        .contains(currentUserReference))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.2),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 2.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'VIEW_VID_UPLOAD_Image_jev9pl8z_ON_TAP');
                                              logFirebaseEvent(
                                                  'Image_haptic_feedback');
                                              HapticFeedback.lightImpact();
                                              logFirebaseEvent(
                                                  'Image_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        '\"Saves\" are coming!'),
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
                                    if (viewVidUploadVideosRecord.likedByRef
                                        .contains(currentUserReference))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.2),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 2.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'VIEW_VID_UPLOAD_Image_y0beokuw_ON_TAP');
                                              logFirebaseEvent(
                                                  'Image_backend_call');

                                              await viewVidUploadVideosRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'likedBy_ref':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                    'LikeCount':
                                                        FieldValue.increment(
                                                            -(1)),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'Image_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'videoLikes':
                                                        FieldValue.increment(
                                                            -(1)),
                                                  },
                                                ),
                                              });
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/icons8-like-104_(1).png',
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
                                      viewVidUploadVideosRecord.likeCount,
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Dekko',
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
                                        'VIEW_VID_UPLOAD_Image_9vycxr4o_ON_TAP');
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
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: CommentsWidget(
                                              vidRef: viewVidUploadVideosRecord
                                                  .reference,
                                              creatorRef:
                                                  viewVidUploadVideosRecord
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
                              if (false)
                                Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      viewVidUploadVideosRecord.commentCount,
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Dekko',
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
                                          'VIEW_VID_UPLOAD_Image_q9sgejw1_ON_TAP');
                                      logFirebaseEvent('Image_share');
                                      await Share.share(
                                        '',
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                      logFirebaseEvent('Image_backend_call');

                                      await viewVidUploadVideosRecord.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'ShareCount':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/sidewalk_research-sharethicky.png',
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (false)
                                Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      viewVidUploadVideosRecord.shareCount,
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Dekko',
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
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Visibility(
                                  visible: false,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 120.0,
                                      height: 120.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/icons8-music-record-94.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ],
                          ),
                        ]
                            .divide(const SizedBox(height: 32.0))
                            .addToStart(const SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
