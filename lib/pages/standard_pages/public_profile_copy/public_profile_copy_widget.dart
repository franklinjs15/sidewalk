import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/universal_pages/components_fillers/no_likes_public/no_likes_public_widget.dart';
import '/pages/universal_pages/components_fillers/pubusernoupload/pubusernoupload_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'public_profile_copy_model.dart';
export 'public_profile_copy_model.dart';

class PublicProfileCopyWidget extends StatefulWidget {
  const PublicProfileCopyWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<PublicProfileCopyWidget> createState() =>
      _PublicProfileCopyWidgetState();
}

class _PublicProfileCopyWidgetState extends State<PublicProfileCopyWidget>
    with TickerProviderStateMixin {
  late PublicProfileCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasStackTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicProfileCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PublicProfileCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PUBLIC_PROFILE_COPY_PublicProfileCopy_ON');
      logFirebaseEvent('PublicProfileCopy_backend_call');

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
      'stackOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-500.0, 0.0),
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

        final publicProfileCopyUsersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PUBLIC_PROFILE_COPY_Image_qex0vgl8_ON_TA');
                                              logFirebaseEvent(
                                                  'Image_expand_image');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      valueOrDefault<String>(
                                                        publicProfileCopyUsersRecord
                                                            .backgroundpic,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/lpkq1ojril0v/safdfdff.jpeg',
                                                      ),
                                                      fit: BoxFit.contain,
                                                      alignment:
                                                          const Alignment(0.0, 0.0),
                                                    ),
                                                    allowRotation: false,
                                                    tag: valueOrDefault<String>(
                                                      publicProfileCopyUsersRecord
                                                          .backgroundpic,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/lpkq1ojril0v/safdfdff.jpeg',
                                                    ),
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: valueOrDefault<String>(
                                                publicProfileCopyUsersRecord
                                                    .backgroundpic,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/lpkq1ojril0v/safdfdff.jpeg',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    publicProfileCopyUsersRecord
                                                        .backgroundpic,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tok-flow-01-h-e6-d7-x-w65-a-y-c4-q-y-s49-q-k-b-g8-e-49jj7l/assets/lpkq1ojril0v/safdfdff.jpeg',
                                                  ),
                                                  width: 393.0,
                                                  height: 230.0,
                                                  fit: BoxFit.fitWidth,
                                                  alignment:
                                                      const Alignment(0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 55.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor: const Color(0xA0FFFFFF),
                                                icon: Icon(
                                                  Icons.arrow_back_ios_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'PUBLIC_PROFILE_COPY_arrow_back_ios_round');
                                                  logFirebaseEvent(
                                                      'IconButton_navigate_back');
                                                  context.safePop();
                                                },
                                              ),
                                            ),
                                          ),
                                          if (false)
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        146.0, 190.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      width: 4.5,
                                                    ),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Visibility(
                                                    visible: false,
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 95.0,
                                                        height: 95.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            publicProfileCopyUsersRecord
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
                                            ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.04, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      146.0, 190.0, 0.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 4.5,
                                                  ),
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: SizedBox(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  child: CarouselSlider(
                                                    items: [
                                                      InkWell(
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
                                                              'PUBLIC_PROFILE_COPY_Image_xh0dtzye_ON_TA');
                                                          logFirebaseEvent(
                                                              'Image_expand_image');
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    publicProfileCopyUsersRecord
                                                                        .ownerpic,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  publicProfileCopyUsersRecord
                                                                      .ownerpic,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                                ),
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: valueOrDefault<
                                                              String>(
                                                            publicProfileCopyUsersRecord
                                                                .ownerpic,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                          ),
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      90.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          90.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      90.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      90.0),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                publicProfileCopyUsersRecord
                                                                    .ownerpic,
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                              ),
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
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
                                                              'PUBLIC_PROFILE_COPY_Image_3jovlm1w_ON_TA');
                                                          logFirebaseEvent(
                                                              'Image_expand_image');
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    publicProfileCopyUsersRecord
                                                                        .photoUrl,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  publicProfileCopyUsersRecord
                                                                      .photoUrl,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                                ),
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: valueOrDefault<
                                                              String>(
                                                            publicProfileCopyUsersRecord
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                          ),
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      90.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          90.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      90.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      90.0),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                publicProfileCopyUsersRecord
                                                                    .photoUrl,
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                              ),
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    carouselController: _model
                                                            .carouselController ??=
                                                        CarouselSliderController(),
                                                    options: CarouselOptions(
                                                      initialPage: 1,
                                                      viewportFraction: 1.0,
                                                      disableCenter: true,
                                                      enlargeCenterPage: true,
                                                      enlargeFactor: 0.1,
                                                      enableInfiniteScroll:
                                                          true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      autoPlay: true,
                                                      autoPlayAnimationDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  220),
                                                      autoPlayInterval:
                                                          const Duration(
                                                              milliseconds:
                                                                  (220 + 3700)),
                                                      autoPlayCurve:
                                                          Curves.linear,
                                                      pauseAutoPlayInFiniteScroll:
                                                          true,
                                                      onPageChanged: (index,
                                                              _) =>
                                                          _model.carouselCurrentIndex =
                                                              index,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: Text(
                                          publicProfileCopyUsersRecord.shopName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Owner:  ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Text(
                                            publicProfileCopyUsersRecord
                                                .ownername,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          '📍${publicProfileCopyUsersRecord.state}',
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
                                        publicProfileCopyUsersRecord.population,
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
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Text(
                                                  publicProfileCopyUsersRecord
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Text(
                                                  publicProfileCopyUsersRecord
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
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Locations',
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                publicProfileCopyUsersRecord
                                                    .sqft,
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
                                                  .fromSTEB(3.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'SqFt',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              publicProfileCopyUsersRecord
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
                                                  .fromSTEB(3.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Employees',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
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
                                        labelColor: Colors.black,
                                        unselectedLabelColor: const Color(0xFF646F78),
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                42.0, 0.0, 42.0, 0.0),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        tabs: const [
                                          Tab(
                                            text: 'Videos',
                                          ),
                                          Tab(
                                            text: 'Stats',
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
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 5.0, 4.0, 0.0),
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
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          0,
                                                        ),
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
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        200.0,
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
                                                                            'PUBLIC_PROFILE_COPY_Column_bfky7c6f_ON_T');
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
                                                                              isList: true,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'videos':
                                                                                tabBarVideosRecordList,
                                                                            kTransitionInfoKey:
                                                                                const TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.scale,
                                                                              alignment: Alignment.bottomCenter,
                                                                              duration: Duration(milliseconds: 250),
                                                                            ),
                                                                          },
                                                                        );

                                                                        logFirebaseEvent(
                                                                            'Column_update_page_state');
                                                                        _model.videoUrls = tabBarVideosRecordList
                                                                            .map((e) =>
                                                                                e.videoUrl)
                                                                            .toList()
                                                                            .cast<String>();
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 0.0,
                                                                              buttonSize: 50.0,
                                                                              fillColor: const Color(0x1D141415),
                                                                              icon: const Icon(
                                                                                Icons.play_arrow_rounded,
                                                                                color: Colors.white,
                                                                                size: 34.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('PUBLIC_PROFILE_COPY_play_arrow_rounded_I');
                                                                                logFirebaseEvent('IconButton_update_page_state');
                                                                                _model.videoUrls = tabBarVideosRecordList.map((e) => e.videoUrl).toList().cast<String>();
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ).animateOnActionTrigger(
                                                                animationsMap[
                                                                    'stackOnActionTriggerAnimation']!,
                                                                hasBeenTriggered:
                                                                    hasStackTriggered),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  'Profit & Losses',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              if (false)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 6.0,
                                                                4.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<VideosRecord>>(
                                                      future:
                                                          queryVideosRecordOnce(
                                                        queryBuilder: (videosRecord) =>
                                                            videosRecord
                                                                .where(
                                                                  'likedBy_ref',
                                                                  arrayContains:
                                                                      widget
                                                                          .userRef,
                                                                )
                                                                .orderBy(
                                                                    'dateUploaded',
                                                                    descending:
                                                                        true),
                                                        limit: 100,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              child:
                                                                  SpinKitPumpingHeart(
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
                                                          return const Center(
                                                            child:
                                                                NoLikesPublicWidget(),
                                                          );
                                                        }

                                                        return MasonryGridView
                                                            .builder(
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
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          200.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0x96454545),
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              staggeredViewVideosRecord.thumbnailURL,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/il9htsvkawz2/photo_2023-10-03_14-33-11.jpg',
                                                                            ),
                                                                          ).image,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
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
                                                                              color: Colors.white,
                                                                              size: 32.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('PUBLIC_PROFILE_COPY_play_circle_outlined');
                                                                              logFirebaseEvent('IconButton_navigate_to');

                                                                              context.pushNamed(
                                                                                'viewVidUpload',
                                                                                pathParameters: {
                                                                                  'vidRef': serializeParam(
                                                                                    staggeredViewVideosRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
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
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: ListView(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    Text(
                                                      'Income:          \$75,000',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Expenses:      \$55,000',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Profit:            \$20,000',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  'Equipment List',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: ListView(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    Text(
                                                      'Espresso Machine:     La Marzocco',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      '       Grinder:       La Minelli ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Mugs:      \$200',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
