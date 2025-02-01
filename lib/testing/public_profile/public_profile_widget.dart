import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/universal_pages/components_fillers/block_report_user/block_report_user_widget.dart';
import '/pages/universal_pages/components_fillers/no_likes_public/no_likes_public_widget.dart';
import '/pages/universal_pages/components_fillers/pubusernoupload/pubusernoupload_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'public_profile_model.dart';
export 'public_profile_model.dart';

class PublicProfileWidget extends StatefulWidget {
  const PublicProfileWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<PublicProfileWidget> createState() => _PublicProfileWidgetState();
}

class _PublicProfileWidgetState extends State<PublicProfileWidget>
    with TickerProviderStateMixin {
  late PublicProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PublicProfile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PUBLIC_PROFILE_PublicProfile_ON_INIT_STA');
      logFirebaseEvent('PublicProfile_backend_call');

      await widget.userRef!.update({
        ...mapToFirestore(
          {
            'profile_visitors': FieldValue.arrayUnion([currentUserReference]),
          },
        ),
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(500.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
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
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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

        final publicProfileUsersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
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
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 29.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'PUBLIC_PROFILE_arrow_back_ios_new_ICN_ON');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.safePop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 0.0),
                                child: Text(
                                  publicProfileUsersRecord.shopName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: const Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PUBLIC_PROFILE_more_vert_outlined_ICN_ON');
                                  logFirebaseEvent('IconButton_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(1.0, -1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: BlockReportUserWidget(
                                            userRef: publicProfileUsersRecord
                                                .reference,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        actions: const [],
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          border: Border.all(
                                            color: const Color(0x9DBCBCBC),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 95.0,
                                            height: 95.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                publicProfileUsersRecord
                                                    .ownerpic,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          border: Border.all(
                                            color: const Color(0x9DBCBCBC),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 95.0,
                                            height: 95.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                publicProfileUsersRecord
                                                    .photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 97.0, 0.0),
                                          child: Text(
                                            publicProfileUsersRecord.ownername,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            '📍${publicProfileUsersRecord.state}',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          publicProfileUsersRecord.population,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (false)
                                        Text(
                                          publicProfileUsersRecord.locations,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      if (false)
                                        Text(
                                          publicProfileUsersRecord.employees,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Text(
                                                    publicProfileUsersRecord
                                                        .established,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  'Est.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Text(
                                                    publicProfileUsersRecord
                                                        .locations,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(3.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Locations',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: const Color(
                                                                0xFF242424),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                              Text(
                                                valueOrDefault<String>(
                                                  publicProfileUsersRecord.sqft,
                                                  'n/a',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'SqFt',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            const Color(0xFF242424),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                publicProfileUsersRecord
                                                    .employees,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Employees',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            const Color(0xFF242424),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (false)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 6.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  publicProfileUsersRecord
                                                      .followingUsers.length,
                                                  formatType:
                                                      FormatType.compact,
                                                ),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Dekko',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                          GradientText(
                                            'Following',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Denk One',
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
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 6.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.videoLikes,
                                                        0),
                                                    formatType:
                                                        FormatType.compact,
                                                  ),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Dekko',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          GradientText(
                                            'Likes',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Denk One',
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
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 6.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  publicProfileUsersRecord
                                                      .usersFollowingMe.length,
                                                  formatType:
                                                      FormatType.compact,
                                                ),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Dekko',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                          GradientText(
                                            'Followers',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Denk One',
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
                                    ],
                                  ),
                                ),
                              if (false)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PUBLIC_PROFILE_PAGE_FOLLOW_BTN_ON_TAP');
                                              if ((currentUserDocument
                                                          ?.followingUsers
                                                          .toList() ??
                                                      [])
                                                  .contains(
                                                      publicProfileUsersRecord
                                                          .reference)) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'following_users':
                                                          FieldValue
                                                              .arrayRemove([
                                                        publicProfileUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                return;
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'following_users':
                                                          FieldValue
                                                              .arrayUnion([
                                                        publicProfileUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                return;
                                              }
                                            },
                                            text: (currentUserDocument
                                                            ?.followingUsers
                                                            .toList() ??
                                                        [])
                                                    .contains(
                                                        publicProfileUsersRecord
                                                            .reference)
                                                ? 'Unfollow'
                                                : 'Follow',
                                            options: FFButtonOptions(
                                              width: 143.0,
                                              height: 41.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                (currentUserDocument
                                                                ?.followingUsers
                                                                .toList() ??
                                                            [])
                                                        .contains(
                                                            publicProfileUsersRecord
                                                                .reference)
                                                    ? const Color(0xFFEDEDEE)
                                                    : const Color(0xFF5A0DB7),
                                                const Color(0xFF5A0DB7),
                                              ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Dekko',
                                                        color: (currentUserDocument
                                                                        ?.followingUsers
                                                                        .toList() ??
                                                                    [])
                                                                .contains(
                                                                    publicProfileUsersRecord
                                                                        .reference)
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: const Color(0xFFEDEDEE),
                                        icon: FaIcon(
                                          FontAwesomeIcons.paperPlane,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 18.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'PUBLIC_PROFILE_paperPlane_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_navigate_to');

                                          context.pushNamed(
                                            'UserMsg',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                publicProfileUsersRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatUser':
                                                  publicProfileUsersRecord,
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                                duration:
                                                    Duration(milliseconds: 150),
                                              ),
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<VideosRecord>>(
                            future: queryVideosRecordOnce(
                              queryBuilder: (videosRecord) => videosRecord
                                  .where(
                                    'creatorID',
                                    isEqualTo: widget.userRef,
                                  )
                                  .orderBy('dateUploaded', descending: true),
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<VideosRecord> tabBarVideosRecordList =
                                  snapshot.data!;

                              return Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: const Color(0xFFFF2E5F),
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              42.0, 0.0, 42.0, 0.0),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                      unselectedLabelStyle: const TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      tabs: [
                                        Tab(
                                          icon: Icon(
                                            Icons.video_collection_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          iconMargin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 45.0, 0.0, 0.0),
                                        ),
                                        const Tab(
                                          icon: Icon(
                                            Icons.bookmarks_outlined,
                                            color: Color(0xFF14181B),
                                          ),
                                          iconMargin:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 6.0, 4.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final userVideos =
                                                        tabBarVideosRecordList
                                                            .toList();
                                                    if (userVideos.isEmpty) {
                                                      return const Center(
                                                        child:
                                                            PubusernouploadWidget(),
                                                      );
                                                    }

                                                    return MasonryGridView
                                                        .builder(
                                                      gridDelegate:
                                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                      ),
                                                      itemCount:
                                                          userVideos.length,
                                                      itemBuilder: (context,
                                                          userVideosIndex) {
                                                        final userVideosItem =
                                                            userVideos[
                                                                userVideosIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 200.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0x96454545),
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          userVideosItem.thumbnailURL,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/il9htsvkawz2/photo_2023-10-03_14-33-11.jpg',
                                                                        ),
                                                                      ).image,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'PUBLIC_PROFILE_Column_we0fvdhh_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Column_update_page_state');
                                                                      _model.videoUrls = tabBarVideosRecordList
                                                                          .map((e) => e
                                                                              .videoUrl)
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                      logFirebaseEvent(
                                                                          'Column_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'ProfileViewVideos',
                                                                        queryParameters:
                                                                            {
                                                                          'indexToStart':
                                                                              serializeParam(
                                                                            userVideosIndex,
                                                                            ParamType.int,
                                                                          ),
                                                                          'videos':
                                                                              serializeParam(
                                                                            tabBarVideosRecordList,
                                                                            ParamType.Document,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'videos':
                                                                              tabBarVideosRecordList,
                                                                          kTransitionInfoKey:
                                                                              const TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.scale,
                                                                            alignment:
                                                                                Alignment.bottomCenter,
                                                                            duration:
                                                                                Duration(milliseconds: 250),
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              75.0,
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.play_circle_outlined,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                32.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('PUBLIC_PROFILE_play_circle_outlined_ICN_');
                                                                            logFirebaseEvent('IconButton_update_page_state');
                                                                            _model.videoUrls =
                                                                                tabBarVideosRecordList.map((e) => e.videoUrl).toList().cast<String>();
                                                                            logFirebaseEvent('IconButton_navigate_to');

                                                                            context.pushNamed(
                                                                              'ProfileViewVideos',
                                                                              queryParameters: {
                                                                                'indexToStart': serializeParam(
                                                                                  userVideosIndex,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'videos': serializeParam(
                                                                                  tabBarVideosRecordList,
                                                                                  ParamType.Document,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'videos': tabBarVideosRecordList,
                                                                                kTransitionInfoKey: const TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.scale,
                                                                                  alignment: Alignment.bottomCenter,
                                                                                  duration: Duration(milliseconds: 250),
                                                                                ),
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'stackOnPageLoadAnimation']!),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 6.0, 4.0, 0.0),
                                            child: FutureBuilder<
                                                List<VideosRecord>>(
                                              future: queryVideosRecordOnce(
                                                queryBuilder: (videosRecord) =>
                                                    videosRecord
                                                        .where(
                                                          'likedBy_ref',
                                                          arrayContains:
                                                              widget.userRef,
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
                                                      child:
                                                          SpinKitPumpingHeart(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                  return const Center(
                                                    child:
                                                        NoLikesPublicWidget(),
                                                  );
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
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  4.0),
                                                      child: Stack(
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
                                                              width: double
                                                                  .infinity,
                                                              height: 200.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x96454545),
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .network(
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
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        75.0,
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .play_circle_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          32.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'PUBLIC_PROFILE_play_circle_outlined_ICN_');
                                                                      logFirebaseEvent(
                                                                          'IconButton_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'viewVidUpload',
                                                                        pathParameters:
                                                                            {
                                                                          'vidRef':
                                                                              serializeParam(
                                                                            staggeredViewVideosRecord.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              const TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.scale,
                                                                            alignment:
                                                                                Alignment.bottomCenter,
                                                                            duration:
                                                                                Duration(milliseconds: 250),
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
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
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    if (false)
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          child: Container(
                            width: double.infinity,
                            height: 72.0,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Visibility(
                              visible: false,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: const Icon(
                                                    Icons.home_outlined,
                                                    color: Colors.black,
                                                    size: 26.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PUBLIC_PROFILE_home_outlined_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_navigate_to');

                                                    context.goNamed(
                                                      'HomePage',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PUBLIC_PROFILE_Container_uk4wgyr1_ON_TAP');
                                              },
                                              child: Container(
                                                width: 46.0,
                                                height: 34.0,
                                                decoration: BoxDecoration(
                                                  gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xFFFF0094),
                                                      Color(0xFF5A0DB7)
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 2.0, 4.0, 2.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 92.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'iconOnActionTriggerAnimation']!,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: const Icon(
                                                    Icons.person,
                                                    color: Colors.black,
                                                    size: 26.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PUBLIC_PROFILE_PAGE_person_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_navigate_to');

                                                    context.goNamed(
                                                      'UserAccount',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(width: 2.0)),
                                        ),
                                      ),
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
