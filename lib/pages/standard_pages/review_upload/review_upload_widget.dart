import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/universal_pages/post_details/post_details_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'review_upload_model.dart';
export 'review_upload_model.dart';

class ReviewUploadWidget extends StatefulWidget {
  const ReviewUploadWidget({
    super.key,
    required this.uploadedURL,
  });

  final String? uploadedURL;

  @override
  State<ReviewUploadWidget> createState() => _ReviewUploadWidgetState();
}

class _ReviewUploadWidgetState extends State<ReviewUploadWidget>
    with TickerProviderStateMixin {
  late ReviewUploadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 500.ms),
        MoveEffect(
          curve: Curves.linear,
          delay: 500.ms,
          duration: 100.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(-500.0, 0.0),
          end: const Offset(500.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        MoveEffect(
          curve: Curves.linear,
          delay: 600.ms,
          duration: 100.ms,
          begin: const Offset(0.0, 30.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 500.ms),
        MoveEffect(
          curve: Curves.linear,
          delay: 500.ms,
          duration: 100.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewUploadModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'reviewUpload'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
                  videoUrl: widget.uploadedURL!,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.97, 0.81),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 52.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'REVIEW_UPLOAD_PAGE_submitbutton_ON_TAP');
                              logFirebaseEvent('submitbutton_haptic_feedback');
                              HapticFeedback.heavyImpact();
                              logFirebaseEvent(
                                  'submitbutton_update_page_state');
                              setState(() {
                                _model.uploadStarted = true;
                              });
                              logFirebaseEvent('submitbutton_widget_animation');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation']!
                                    .controller
                                  ..reset()
                                  ..repeat();
                              }
                              logFirebaseEvent('submitbutton_backend_call');

                              var videosRecordReference =
                                  VideosRecord.collection.doc();
                              await videosRecordReference.set({
                                ...createVideosRecordData(
                                  dateUploaded: getCurrentTimestamp,
                                  videoUrl: '${widget.uploadedURL}',
                                  content: valueOrDefault<String>(
                                    FFAppState().postText,
                                    '...',
                                  ),
                                  videoID: random_data.randomString(
                                    26,
                                    42,
                                    true,
                                    true,
                                    true,
                                  ),
                                  creatorID: currentUserReference,
                                  thumbnailURL: _model.uploadedFileUrl,
                                  likeCount: 1,
                                  shareCount: 0,
                                  commentCount: 0,
                                  creatorName: valueOrDefault<String>(
                                    currentUserDisplayName,
                                    'Guest',
                                  ),
                                  userPhoto: currentUserPhoto,
                                ),
                                ...mapToFirestore(
                                  {
                                    'videoHash': FFAppState().PostHashtags,
                                    'likedBy_ref': [currentUserReference],
                                  },
                                ),
                              });
                              _model.newVidDoc2 =
                                  VideosRecord.getDocumentFromData({
                                ...createVideosRecordData(
                                  dateUploaded: getCurrentTimestamp,
                                  videoUrl: '${widget.uploadedURL}',
                                  content: valueOrDefault<String>(
                                    FFAppState().postText,
                                    '...',
                                  ),
                                  videoID: random_data.randomString(
                                    26,
                                    42,
                                    true,
                                    true,
                                    true,
                                  ),
                                  creatorID: currentUserReference,
                                  thumbnailURL: _model.uploadedFileUrl,
                                  likeCount: 1,
                                  shareCount: 0,
                                  commentCount: 0,
                                  creatorName: valueOrDefault<String>(
                                    currentUserDisplayName,
                                    'Guest',
                                  ),
                                  userPhoto: currentUserPhoto,
                                ),
                                ...mapToFirestore(
                                  {
                                    'videoHash': FFAppState().PostHashtags,
                                    'likedBy_ref': [currentUserReference],
                                  },
                                ),
                              }, videosRecordReference);
                              logFirebaseEvent('submitbutton_backend_call');

                              await _model.newVidDoc2!.reference
                                  .update(createVideosRecordData(
                                videoIDPassable: _model.newVidDoc2?.reference,
                              ));
                              logFirebaseEvent('submitbutton_update_app_state');
                              FFAppState().uploadInProgress = false;
                              FFAppState().postText = '';
                              FFAppState().PostHashtags = [];
                              logFirebaseEvent('submitbutton_navigate_to');

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

                              logFirebaseEvent('submitbutton_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Your post is live!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0x87000000),
                                ),
                              );

                              setState(() {});
                            },
                            child: Container(
                              width: 98.0,
                              height: 41.0,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFF0094),
                                    Color(0xFFEE0000)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Stack(
                                children: [
                                  if (!_model.uploadStarted)
                                    const Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.keyboard_double_arrow_up,
                                        color: Color(0xFFFDFDFD),
                                        size: 28.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ].divide(const SizedBox(height: 14.0)),
                      ),
                    ].divide(const SizedBox(width: 6.0)),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 8.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFEE0000), Colors.white],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.77, 1.0),
                        end: AlignmentDirectional(-0.77, -1.0),
                      ),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                  ),
                ),
              ),
              if (FFAppState().postText != '')
                Align(
                  alignment: const AlignmentDirectional(-0.91, 0.94),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Container(
                      width: 248.0,
                      height: 127.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation1']!),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                FFAppState().postText,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation2']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 75.0, 14.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'REVIEW_UPLOAD_PAGE_VidThumbail_ON_TAP');
                          logFirebaseEvent(
                              'VidThumbail_upload_media_to_firebase');
                          final selectedMedia = await selectMedia(
                            mediaSource: MediaSource.photoGallery,
                            multiImage: false,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              setState(() {});
                              showUploadMessage(
                                  context, 'Failed to upload data');
                              return;
                            }
                          }
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: const CircleBorder(),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFDFDFD),
                              shape: BoxShape.circle,
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: const Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.image_outlined,
                                color: Color(0xFF253031),
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'REVIEW_UPLOAD_PAGE_VidDetails_ON_TAP');
                            logFirebaseEvent('VidDetails_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const PostDetailsWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFDFDFD),
                                shape: BoxShape.circle,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.mode_edit,
                                  color: FFAppState().postText != ''
                                      ? const Color(0xFFF73563)
                                      : const Color(0xFF253031),
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation3']!),
                      ),
                      Icon(
                        Icons.category_sharp,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ].divide(const SizedBox(height: 26.0)),
                  ),
                ),
              ),
              if (!_model.uploadStarted)
                Align(
                  alignment: const AlignmentDirectional(-1.0, -0.88),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'REVIEW_UPLOAD_Container_800stom1_ON_TAP');
                        if (_model.uploadStarted) {
                          return;
                        }

                        logFirebaseEvent('Container_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Cancel upload'),
                                  content: const Text(
                                      'Are you sure you want to cancel this upload?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: const Text('Nevermind'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          logFirebaseEvent('Container_update_app_state');
                          FFAppState().postText = '';
                          FFAppState().PostHashtags = [];
                          logFirebaseEvent('Container_navigate_back');
                          context.safePop();
                          return;
                        } else {
                          return;
                        }
                      },
                      child: Container(
                        width: 63.0,
                        height: 35.0,
                        decoration: const BoxDecoration(
                          color: Color(0xBF252525),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(12.0),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: const Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFFFDFDFD),
                            size: 20.0,
                          ),
                        ),
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
