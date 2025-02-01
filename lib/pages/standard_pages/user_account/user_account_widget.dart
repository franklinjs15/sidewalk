import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/prompt_app_download_widget.dart';
import '/components/settings_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/standard_pages/following_users/following_users_widget.dart';
import '/pages/universal_pages/components_fillers/no_likes/no_likes_widget.dart';
import '/pages/universal_pages/components_fillers/user_not_upload_yet/user_not_upload_yet_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'user_account_model.dart';
export 'user_account_model.dart';

class UserAccountWidget extends StatefulWidget {
  const UserAccountWidget({super.key});

  @override
  State<UserAccountWidget> createState() => _UserAccountWidgetState();
}

class _UserAccountWidgetState extends State<UserAccountWidget>
    with TickerProviderStateMixin {
  late UserAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserAccountModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'UserAccount'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
      'stackOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
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
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(40.0),
                  child: AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'USER_ACCOUNT_PAGE_Icon_nz20gc6s_ON_TAP');
                        logFirebaseEvent('Icon_haptic_feedback');
                        HapticFeedback.lightImpact();
                        logFirebaseEvent('Icon_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const SizedBox(
                                  height: 350.0,
                                  child: SettingsSheetWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Icon(
                        Icons.settings_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    title: Text(
                      'Your Profile',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    actions: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (false)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: const Icon(
                                  Icons.logout,
                                  color: Color(0x2014181B),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'USER_ACCOUNT_PAGE_logout_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_auth');
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'registerpage1', context.mounted);
                                },
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'USER_ACCOUNT_Container_sxtg2tug_ON_TAP');
                                logFirebaseEvent('Container_haptic_feedback');
                                HapticFeedback.mediumImpact();
                                logFirebaseEvent(
                                    'Container_upload_media_to_firebase');
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: false,
                                  allowVideo: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(
                                      () => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
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
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    safeSetState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }

                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(
                                  'reviewUpload',
                                  queryParameters: {
                                    'videoFile': serializeParam(
                                      _model.uploadedFileUrl,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 150),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 46.0,
                                height: 34.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 2.0, 4.0, 2.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 92.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'iconOnActionTriggerAnimation']!,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    centerTitle: true,
                    elevation: 0.0,
                  ),
                )
              : null,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: SizedBox(
                          height: 285.0,
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            children: [
                              if (false)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
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
                                            'USER_ACCOUNT_Container_ywfieque_ON_TAP');
                                      },
                                      child: Container(
                                        width: 25.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF5A0DB7),
                                              Color(0xFFEE0000)
                                            ],
                                            stops: [0.2, 1.0],
                                            begin:
                                                AlignmentDirectional(1.0, 0.9),
                                            end: AlignmentDirectional(
                                                -1.0, -0.9),
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: const Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              '📍${valueOrDefault<String>(
                                                valueOrDefault(
                                                    currentUserDocument?.state,
                                                    ''),
                                                'City, State',
                                              )}',
                                              '📍 City, State',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        if (false)
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              '@$currentUserDisplayName',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.shopName,
                                                    ''),
                                                '\"Your Shop Name Here\"',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'USER_ACCOUNT_PAGE_Image_uzd87mrh_ON_TAP');
                                      logFirebaseEvent('Image_haptic_feedback');
                                      HapticFeedback.lightImpact();
                                      if (!(currentUserEmail != '')) {
                                        logFirebaseEvent('Image_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
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
                                                child:
                                                    const PromptAppDownloadWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        return;
                                      }
                                      logFirebaseEvent('Image_navigate_to');

                                      context.pushNamed('editprofile');
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          valueOrDefault(
                                              currentUserDocument
                                                  ?.backgroundpic,
                                              ''),
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/shgp3a2bodf9/Screenshot_2024-06-11_at_9.40.06_AM.png',
                                        ),
                                        width: 300.0,
                                        height: 176.0,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 45.0),
                                  child: Container(
                                    width: 90.0,
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(50.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        width: 4.5,
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: SizedBox(
                                      width: 100.0,
                                      height: 100.0,
                                      child: CarouselSlider(
                                        items: [
                                          AuthUserStreamWidget(
                                            builder: (context) => ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(90.0),
                                                bottomRight:
                                                    Radius.circular(90.0),
                                                topLeft: Radius.circular(90.0),
                                                topRight: Radius.circular(90.0),
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/cbzpljq8ajm1/Screenshot_2024-06-04_at_10.34.26_AM.png',
                                                ),
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(90.0),
                                                bottomRight:
                                                    Radius.circular(90.0),
                                                topLeft: Radius.circular(90.0),
                                                topRight: Radius.circular(90.0),
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.ownerpic,
                                                      ''),
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/rm19ckanfmd1/Screenshot_2024-06-04_at_10.47.55_AM.png',
                                                ),
                                                width: 300.0,
                                                height: 200.0,
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
                                          viewportFraction: 1.0,
                                          disableCenter: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.1,
                                          enableInfiniteScroll: true,
                                          scrollDirection: Axis.horizontal,
                                          autoPlay: true,
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 200),
                                          autoPlayInterval: const Duration(
                                              milliseconds: (200 + 4000)),
                                          autoPlayCurve: Curves.linear,
                                          pauseAutoPlayInFiniteScroll: true,
                                          onPageChanged: (index, _) => _model
                                              .carouselCurrentIndex = index,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.19, 0.76),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 23.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'USER_ACCOUNT_Container_ocsoyeq1_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_haptic_feedback');
                                      HapticFeedback.lightImpact();
                                      if (!(currentUserEmail != '')) {
                                        logFirebaseEvent(
                                            'Container_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
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
                                                child:
                                                    const PromptAppDownloadWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        return;
                                      }
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed('editprofile');
                                    },
                                    child: Container(
                                      width: 26.0,
                                      height: 26.0,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFEF358B),
                                            Color(0xFFFF8A2E)
                                          ],
                                          stops: [0.2, 1.0],
                                          begin: AlignmentDirectional(1.0, 0.9),
                                          end: AlignmentDirectional(-1.0, -0.9),
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'USER_ACCOUNT_PAGE_Icon_tcdw83g1_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_haptic_feedback');
                                            HapticFeedback.lightImpact();
                                            if (!(currentUserEmail != '')) {
                                              logFirebaseEvent(
                                                  'Icon_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
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
                                                      child:
                                                          const PromptAppDownloadWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              return;
                                            }
                                            logFirebaseEvent(
                                                'Icon_navigate_to');

                                            context.pushNamed('editprofile');
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 17.0,
                                          ),
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
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'USER_ACCOUNT_PAGE_Column_q8fry2p9_ON_TAP');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<String>(
                                          valueOrDefault(
                                              currentUserDocument?.established,
                                              ''),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Est.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
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
                                      'USER_ACCOUNT_PAGE_Column_nzauh9ab_ON_TAP');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<String>(
                                          valueOrDefault(
                                              currentUserDocument?.locations,
                                              ''),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Locations',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (false)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'USER_ACCOUNT_PAGE_Column_j4v8zgue_ON_TAP');
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault<String>(
                                            valueOrDefault(
                                                currentUserDocument?.sqft, ''),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'SqFt',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
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
                                      'USER_ACCOUNT_PAGE_Column_sahsi8jw_ON_TAP');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<String>(
                                          valueOrDefault(
                                              currentUserDocument?.employees,
                                              ''),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Employees',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 6.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'USER_ACCOUNT_EDIT_PROFILE_INFO_BTN_ON_TA');
                            logFirebaseEvent('Button_haptic_feedback');
                            HapticFeedback.lightImpact();
                            if (!(currentUserEmail != '')) {
                              logFirebaseEvent('Button_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
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
                                      child: const PromptAppDownloadWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              return;
                            }
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('editprofile');
                          },
                          text: 'Edit Profile Info',
                          options: FFButtonOptions(
                            width: 265.0,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFEAEAEA),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 1.0,
                            borderSide: const BorderSide(
                              color: Color(0x10585858),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      if (false)
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 14.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'USER_ACCOUNT_PAGE_Column_o1lnjmox_ON_TAP');
                                    logFirebaseEvent('Column_bottom_sheet');
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
                                            child: const FollowingUsersWidget(
                                              initTab: 0,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                (currentUserDocument
                                                            ?.followingUsers
                                                            .toList() ??
                                                        [])
                                                    .length,
                                                formatType: FormatType.compact,
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      GradientText(
                                        'Following',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        colors: const [
                                          Color(0xFFD239B1),
                                          Color(0xFF5A0DB7)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 3.0,
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
                                        'USER_ACCOUNT_PAGE_Column_41zzefpd_ON_TAP');
                                    logFirebaseEvent('Column_tab_bar');
                                    safeSetState(() {
                                      _model.tabBarController!.animateTo(
                                        1,
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault(
                                                currentUserDocument?.sqft, ''),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      GradientText(
                                        'Likes',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        colors: const [
                                          Color(0xFF5A0DB7),
                                          Color(0xFFEE0000)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 2.0,
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
                                        'USER_ACCOUNT_PAGE_Column_b190mikk_ON_TAP');
                                    logFirebaseEvent('Column_bottom_sheet');
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
                                            child: const FollowingUsersWidget(
                                              initTab: 1,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                (currentUserDocument
                                                            ?.usersFollowingMe
                                                            .toList() ??
                                                        [])
                                                    .length,
                                                formatType: FormatType.compact,
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      GradientText(
                                        'Followers',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        colors: const [
                                          Color(0xFFD239B1),
                                          Color(0xFF5A0DB7)
                                        ],
                                        gradientType: GradientType.radial,
                                        radius: 1.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: TabBar(
                                isScrollable: true,
                                labelColor:
                                    FlutterFlowTheme.of(context).secondary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    42.0, 0.0, 42.0, 0.0),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Dekko',
                                      letterSpacing: 0.0,
                                    ),
                                unselectedLabelStyle: const TextStyle(),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                padding: const EdgeInsets.all(4.0),
                                tabs: [
                                  Tab(
                                    icon: Icon(
                                      Icons.video_collection_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 26.0,
                                    ),
                                    iconMargin: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 45.0, 0.0, 0.0),
                                  ),
                                  Tab(
                                    icon: Icon(
                                      Icons.bookmark_border,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 26.0,
                                    ),
                                    iconMargin: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 45.0, 0.0, 0.0),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 124.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 6.0, 4.0, 0.0),
                                      child: FutureBuilder<List<VideosRecord>>(
                                        future: queryVideosRecordOnce(
                                          queryBuilder: (videosRecord) =>
                                              videosRecord
                                                  .where(
                                                    'creatorID',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .orderBy('dateUploaded',
                                                      descending: true),
                                          limit: 100,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child: SpinKitPumpingHeart(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<VideosRecord>
                                              staggeredViewVideosRecordList =
                                              snapshot.data!;
                                          if (staggeredViewVideosRecordList
                                              .isEmpty) {
                                            return const UserNotUploadYetWidget();
                                          }

                                          return MasonryGridView.builder(
                                            gridDelegate:
                                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                            ),
                                            itemCount:
                                                staggeredViewVideosRecordList
                                                    .length,
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (context, staggeredViewIndex) {
                                              final staggeredViewVideosRecord =
                                                  staggeredViewVideosRecordList[
                                                      staggeredViewIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 4.0),
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0x96454545),
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                staggeredViewVideosRecord.thumbnailURL,
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/il9htsvkawz2/photo_2023-10-03_14-33-11.jpg',
                                                              ),
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: const Color(
                                                                0x8F252525),
                                                            icon: const Icon(
                                                              Icons.play_arrow,
                                                              color:
                                                                  Colors.white,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'USER_ACCOUNT_PAGE_play_arrow_ICN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconButton_navigate_to');

                                                              context.pushNamed(
                                                                'viewVidUpload',
                                                                pathParameters:
                                                                    {
                                                                  'vidRef':
                                                                      serializeParam(
                                                                    staggeredViewVideosRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .scale,
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomCenter,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            250),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          if (false)
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor: const Color(
                                                                  0x8F252525),
                                                              icon: const Icon(
                                                                Icons
                                                                    .delete_sharp,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'USER_ACCOUNT_delete_sharp_ICN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButton_backend_call');
                                                                await staggeredViewVideosRecord
                                                                    .reference
                                                                    .delete();
                                                              },
                                                            ),
                                                        ].divide(const SizedBox(
                                                            width: 6.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'stackOnActionTriggerAnimation']!,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 6.0, 4.0, 0.0),
                                        child:
                                            StreamBuilder<List<VideosRecord>>(
                                          stream: queryVideosRecord(
                                            queryBuilder: (videosRecord) =>
                                                videosRecord
                                                    .where(
                                                      'likedBy_ref',
                                                      arrayContains:
                                                          currentUserReference,
                                                    )
                                                    .orderBy('dateUploaded',
                                                        descending: true),
                                            limit: 100,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitPumpingHeart(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<VideosRecord>
                                                staggeredViewVideosRecordList =
                                                snapshot.data!;
                                            if (staggeredViewVideosRecordList
                                                .isEmpty) {
                                              return const NoLikesWidget();
                                            }

                                            return MasonryGridView.builder(
                                              gridDelegate:
                                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                              ),
                                              itemCount:
                                                  staggeredViewVideosRecordList
                                                      .length,
                                              itemBuilder: (context,
                                                  staggeredViewIndex) {
                                                final staggeredViewVideosRecord =
                                                    staggeredViewVideosRecordList[
                                                        staggeredViewIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 4.0),
                                                  child: Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 200.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0x96454545),
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  staggeredViewVideosRecord.thumbnailURL,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/il9htsvkawz2/photo_2023-10-03_14-33-11.jpg',
                                                                ),
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor: const Color(
                                                                  0x8F252525),
                                                              icon: const Icon(
                                                                Icons
                                                                    .play_arrow,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'USER_ACCOUNT_PAGE_play_arrow_ICN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButton_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'viewVidUpload',
                                                                  pathParameters:
                                                                      {
                                                                    'vidRef':
                                                                        serializeParam(
                                                                      staggeredViewVideosRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        const TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .scale,
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomCenter,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              250),
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                            if (false)
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    8.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor: const Color(
                                                                    0x8F252525),
                                                                icon: const Icon(
                                                                  Icons
                                                                      .remove_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'USER_ACCOUNT_remove_circle_outline_ICN_O');
                                                                  logFirebaseEvent(
                                                                      'IconButton_backend_call');

                                                                  await staggeredViewVideosRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'likedBy_ref':
                                                                            FieldValue.arrayRemove([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                },
                                                              ),
                                                          ].divide(const SizedBox(
                                                              width: 6.0)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
