import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'newcategories_page_model.dart';
export 'newcategories_page_model.dart';

class NewcategoriesPageWidget extends StatefulWidget {
  const NewcategoriesPageWidget({super.key});

  @override
  State<NewcategoriesPageWidget> createState() =>
      _NewcategoriesPageWidgetState();
}

class _NewcategoriesPageWidgetState extends State<NewcategoriesPageWidget> {
  late NewcategoriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewcategoriesPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'newcategories_page'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEWCATEGORIES_newcategories_page_ON_INIT');
      logFirebaseEvent('newcategories_page_google_analytics_even');
      logFirebaseEvent('Categories Page');
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VideosRecord>>(
      future: queryVideosRecordOnce(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<VideosRecord> newcategoriesPageVideosRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (false)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 62.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 70.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Text(
                                              'Pool Stuff',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 95.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Text(
                                              'Lawn Care',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 75.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Text(
                                              'Retail Shop',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Text(
                                              'Food Trucks',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 70.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Text(
                                              'Florists',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 70.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Text(
                                              'Breweries',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (false)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: StreamBuilder<List<VideosRecord>>(
                                    stream: queryVideosRecord(
                                      queryBuilder: (videosRecord) =>
                                          videosRecord.where(
                                        'Category',
                                        isEqualTo: 'carousel',
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
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 40.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<VideosRecord>
                                          carouselVideosRecordList =
                                          snapshot.data!;

                                      return SizedBox(
                                        width: 250.0,
                                        height: 280.0,
                                        child: CarouselSlider.builder(
                                          itemCount:
                                              carouselVideosRecordList.length,
                                          itemBuilder:
                                              (context, carouselIndex, _) {
                                            final carouselVideosRecord =
                                                carouselVideosRecordList[
                                                    carouselIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NEWCATEGORIES_Image_iqtvlfrc_ON_TAP');
                                                logFirebaseEvent(
                                                    'Image_update_page_state');
                                                _model.videoList = [];
                                                logFirebaseEvent(
                                                    'Image_update_page_state');
                                                _model.addToVideoList(
                                                    carouselVideosRecord);
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Image_navigate_to');

                                                context.pushNamed(
                                                  'ProfileViewVideos',
                                                  queryParameters: {
                                                    'indexToStart':
                                                        serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                    'videos': serializeParam(
                                                      _model.videoList,
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'videos': _model.videoList,
                                                  },
                                                );

                                                logFirebaseEvent(
                                                    'Image_google_analytics_event');
                                                logFirebaseEvent(
                                                    'carousel_cat');
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  carouselVideosRecord.thumbnailURL,
                                                  width: 374.0,
                                                  height: 140.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController1 ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0,
                                                min(
                                                    1,
                                                    carouselVideosRecordList
                                                            .length -
                                                        1)),
                                            viewportFraction: 0.6,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.2,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                const Duration(milliseconds: 350),
                                            autoPlayInterval: const Duration(
                                                milliseconds: (350 + 3000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex1 = index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (false)
                          Align(
                            alignment: const AlignmentDirectional(0.84, -0.96),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 45.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.notifications_none_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NEWCATEGORIES_notificationsBtn_ON_TAP');
                                  logFirebaseEvent(
                                      'notificationsBtn_navigate_to');

                                  context.pushNamed('Notifications');
                                },
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 70.0, 12.0, 10.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Text(
                                                'Explore',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 52.0,
                                              child: Divider(
                                                height: 2.0,
                                                thickness: 3.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Text(
                                                'Pizzerias 🍕',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFC8C9CB),
                                                          fontSize: 19.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Text(
                                                'Bakery 🍪 ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFC8C9CB),
                                                          fontSize: 19.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 32.0,
                                              child: Divider(
                                                height: 2.0,
                                                thickness: 3.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Text(
                                                'Breweries 🍺',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFC8C9CB),
                                                          fontSize: 19.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Text(
                                                'Food Trucks 🚚',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFC8C9CB),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
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
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 2.0),
                                            child: Text(
                                              'More',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: const Color(0xFFC8C9CB),
                                                    fontSize: 19.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
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
                                      const Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Color(0xFFC8C9CB),
                                          size: 28.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 210.0,
                            child: CarouselSlider(
                              items: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Image.asset(
                                    'assets/images/hgkjkl.jpeg',
                                    width: 260.0,
                                    height: 170.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Image.asset(
                                    'assets/images/sfgfsgsfgsgsdg.jpeg',
                                    width: 260.0,
                                    height: 170.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/hq720.jpg',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                              carouselController: _model.carouselController2 ??=
                                  CarouselSliderController(),
                              options: CarouselOptions(
                                initialPage: 1,
                                viewportFraction: 0.89,
                                disableCenter: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.2,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 350),
                                autoPlayInterval:
                                    const Duration(milliseconds: (350 + 3000)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: true,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex2 = index,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 5.0, 0.0, 0.0),
                          child: Text(
                            'Newly Added ✨',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 3.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'Sales 💰',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final revenue = newcategoriesPageVideosRecordList
                                  .where(
                                      (e) => e.categories.contains('Revenue'))
                                  .toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(revenue.length,
                                      (revenueIndex) {
                                    final revenueItem = revenue[revenueIndex];
                                    return Container(
                                      width: 123.0,
                                      height: 220.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NEWCATEGORIES_Image_oeqj1pqs_ON_TAP');
                                                logFirebaseEvent(
                                                    'Image_navigate_to');

                                                context.pushNamed(
                                                  'ProfileViewVideos',
                                                  queryParameters: {
                                                    'indexToStart':
                                                        serializeParam(
                                                      revenueIndex,
                                                      ParamType.int,
                                                    ),
                                                    'videos': serializeParam(
                                                      newcategoriesPageVideosRecordList
                                                          .where((e) => e
                                                              .categories
                                                              .contains(
                                                                  'Revenue'))
                                                          .toList(),
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'videos':
                                                        newcategoriesPageVideosRecordList
                                                            .where((e) => e
                                                                .categories
                                                                .contains(
                                                                    'Revenue'))
                                                            .toList(),
                                                  },
                                                );

                                                logFirebaseEvent(
                                                    'Image_google_analytics_event');
                                                logFirebaseEvent(
                                                  'sales_category',
                                                  parameters: {
                                                    'Param 1': 'Sales Category',
                                                  },
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  revenueItem.thumbnailURL,
                                                  width: 114.0,
                                                  height: 170.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.0, -0.25),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x83000000),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'NEWCATEGORIES_Icon_fdm0hdzg_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_navigate_to');

                                                  context.pushNamed(
                                                    'ProfileViewVideos',
                                                    queryParameters: {
                                                      'indexToStart':
                                                          serializeParam(
                                                        revenueIndex,
                                                        ParamType.int,
                                                      ),
                                                      'videos': serializeParam(
                                                        newcategoriesPageVideosRecordList
                                                            .where((e) => e
                                                                .categories
                                                                .contains(
                                                                    'Revenue'))
                                                            .toList(),
                                                        ParamType.Document,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'videos':
                                                          newcategoriesPageVideosRecordList
                                                              .where((e) => e
                                                                  .categories
                                                                  .contains(
                                                                      'Revenue'))
                                                              .toList(),
                                                    },
                                                  );

                                                  logFirebaseEvent(
                                                      'Icon_google_analytics_event');
                                                  logFirebaseEvent(
                                                      'sales_icon');
                                                },
                                                child: const Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Colors.white,
                                                  size: 42.0,
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
                                                      3.0, 169.0, 2.0, 0.0),
                                              child: Text(
                                                revenueItem.caption
                                                    .maybeHandleOverflow(
                                                  maxChars: 48,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.65, 0.45),
                                            child: Text(
                                              '10.5k',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.08, 0.45),
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).divide(const SizedBox(width: 2.0)),
                                ),
                              );
                            },
                          ),
                        ),
                        if (false)
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 0.0),
                              child: Container(
                                width: 300.0,
                                height: 260.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).pinky,
                                      const Color(0xFFB92BFB)
                                    ],
                                    stops: const [0.0, 1.0],
                                    begin: const AlignmentDirectional(0.64, 1.0),
                                    end: const AlignmentDirectional(-0.64, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: const Color(0xFF1E2126),
                                          elevation: 0.0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(18.0),
                                              topRight: Radius.circular(18.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 9.0, 4.0, 12.0),
                                            child: Text(
                                              'What’s a topic you want us to explore in upcoming content?',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 21.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.3,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 25.0, 10.0, 0.0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        18.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.send,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Type something...',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'NEWCATEGORIES_SUBMIT_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'Poll':
                                                      FieldValue.arrayUnion([
                                                    _model.textController.text
                                                  ]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_set_form_field');
                                            safeSetState(() {
                                              _model.textController?.text =
                                                  'Submitted! We will review this';
                                            });
                                          },
                                          text: 'Submit',
                                          options: FFButtonOptions(
                                            width: 155.0,
                                            height: 45.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF518EFD),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.white,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 3.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    'Rent / SqFt📊',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 0.0, 5.0),
                          child: Builder(
                            builder: (context) {
                              final rent = newcategoriesPageVideosRecordList
                                  .where((e) => e.categories.contains('Rent'))
                                  .toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      List.generate(rent.length, (rentIndex) {
                                    final rentItem = rent[rentIndex];
                                    return Container(
                                      width: 123.0,
                                      height: 220.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NEWCATEGORIES_Image_x39atzr0_ON_TAP');
                                                logFirebaseEvent(
                                                    'Image_navigate_to');

                                                context.pushNamed(
                                                  'ProfileViewVideos',
                                                  queryParameters: {
                                                    'indexToStart':
                                                        serializeParam(
                                                      rentIndex,
                                                      ParamType.int,
                                                    ),
                                                    'videos': serializeParam(
                                                      newcategoriesPageVideosRecordList
                                                          .where((e) => e
                                                              .categories
                                                              .contains('Rent'))
                                                          .toList(),
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'videos':
                                                        newcategoriesPageVideosRecordList
                                                            .where((e) => e
                                                                .categories
                                                                .contains(
                                                                    'Rent'))
                                                            .toList(),
                                                  },
                                                );

                                                logFirebaseEvent(
                                                    'Image_google_analytics_event');
                                                logFirebaseEvent('rent_cat');
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  rentItem.thumbnailURL,
                                                  width: 114.0,
                                                  height: 170.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.0, -0.25),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x83000000),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'NEWCATEGORIES_Icon_nbohsvfm_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_navigate_to');

                                                  context.pushNamed(
                                                    'ProfileViewVideos',
                                                    queryParameters: {
                                                      'indexToStart':
                                                          serializeParam(
                                                        rentIndex,
                                                        ParamType.int,
                                                      ),
                                                      'videos': serializeParam(
                                                        newcategoriesPageVideosRecordList
                                                            .where((e) => e
                                                                .categories
                                                                .contains(
                                                                    'Rent'))
                                                            .toList(),
                                                        ParamType.Document,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'videos':
                                                          newcategoriesPageVideosRecordList
                                                              .where((e) => e
                                                                  .categories
                                                                  .contains(
                                                                      'Rent'))
                                                              .toList(),
                                                    },
                                                  );

                                                  logFirebaseEvent(
                                                      'Icon_google_analytics_event');
                                                  logFirebaseEvent('rent_icon');
                                                },
                                                child: const Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Colors.white,
                                                  size: 42.0,
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
                                                      3.0, 169.0, 2.0, 0.0),
                                              child: Text(
                                                rentItem.caption
                                                    .maybeHandleOverflow(
                                                  maxChars: 48,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).divide(const SizedBox(width: 2.0)),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 36.0, 0.0, 4.0),
                            child: Text(
                              'Small Towns📍',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 27.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final smallTowns =
                                  newcategoriesPageVideosRecordList
                                      .where((e) =>
                                          e.categories.contains('Small Towns'))
                                      .toList();

                              return SizedBox(
                                width: double.infinity,
                                height: 225.0,
                                child: CarouselSlider.builder(
                                  itemCount: smallTowns.length,
                                  itemBuilder: (context, smallTownsIndex, _) {
                                    final smallTownsItem =
                                        smallTowns[smallTownsIndex];
                                    return Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: SizedBox(
                                        width: 123.0,
                                        height: 220.0,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'NEWCATEGORIES_Image_02u82ygz_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'ProfileViewVideos',
                                                    queryParameters: {
                                                      'indexToStart':
                                                          serializeParam(
                                                        smallTownsIndex,
                                                        ParamType.int,
                                                      ),
                                                      'videos': serializeParam(
                                                        newcategoriesPageVideosRecordList
                                                            .where((e) => e
                                                                .categories
                                                                .contains(
                                                                    'Small Towns'))
                                                            .toList(),
                                                        ParamType.Document,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'videos':
                                                          newcategoriesPageVideosRecordList
                                                              .where((e) => e
                                                                  .categories
                                                                  .contains(
                                                                      'Small Towns'))
                                                              .toList(),
                                                    },
                                                  );

                                                  logFirebaseEvent(
                                                      'Image_google_analytics_event');
                                                  logFirebaseEvent(
                                                      'small_towns');
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    smallTownsItem.thumbnailURL,
                                                    width: 114.0,
                                                    height: 170.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -0.25),
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x83000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
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
                                                        'NEWCATEGORIES_Icon_7d03vz3j_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_navigate_to');

                                                    context.pushNamed(
                                                      'ProfileViewVideos',
                                                      queryParameters: {
                                                        'indexToStart':
                                                            serializeParam(
                                                          smallTownsIndex,
                                                          ParamType.int,
                                                        ),
                                                        'videos':
                                                            serializeParam(
                                                          newcategoriesPageVideosRecordList
                                                              .where((e) => e
                                                                  .categories
                                                                  .contains(
                                                                      'Small Towns'))
                                                              .toList(),
                                                          ParamType.Document,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'videos':
                                                            newcategoriesPageVideosRecordList
                                                                .where((e) => e
                                                                    .categories
                                                                    .contains(
                                                                        'Small Towns'))
                                                                .toList(),
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'Icon_google_analytics_event');
                                                    logFirebaseEvent(
                                                        'small_towns_icon');
                                                  },
                                                  child: const Icon(
                                                    Icons.play_arrow_rounded,
                                                    color: Colors.white,
                                                    size: 35.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 167.0, 2.0, 0.0),
                                                child: Text(
                                                  smallTownsItem.caption
                                                      .maybeHandleOverflow(
                                                    maxChars: 48,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  carouselController:
                                      _model.carouselController3 ??=
                                          CarouselSliderController(),
                                  options: CarouselOptions(
                                    initialPage:
                                        max(0, min(1, smallTowns.length - 1)),
                                    viewportFraction: 0.32,
                                    disableCenter: true,
                                    enlargeCenterPage: false,
                                    enlargeFactor: 0.0,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: true,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 3500),
                                    autoPlayInterval:
                                        const Duration(milliseconds: (3500 + 0)),
                                    autoPlayCurve: Curves.linear,
                                    pauseAutoPlayInFiniteScroll: true,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex3 = index,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 6.0),
                                    child: Text(
                                      'Wages & Pay',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 27.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/sidewalk-14.jpg',
                                        width: 45.0,
                                        height: 45.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final payscales =
                                  newcategoriesPageVideosRecordList
                                      .where((e) =>
                                          e.categories.contains('Payscales'))
                                      .toList();

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(payscales.length,
                                    (payscalesIndex) {
                                  final payscalesItem =
                                      payscales[payscalesIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 123.0,
                                      height: 220.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NEWCATEGORIES_Image_o9iuodp5_ON_TAP');
                                                logFirebaseEvent(
                                                    'Image_navigate_to');

                                                context.pushNamed(
                                                  'ProfileViewVideos',
                                                  queryParameters: {
                                                    'indexToStart':
                                                        serializeParam(
                                                      payscalesIndex,
                                                      ParamType.int,
                                                    ),
                                                    'videos': serializeParam(
                                                      newcategoriesPageVideosRecordList
                                                          .where((e) => e
                                                              .categories
                                                              .contains(
                                                                  'Payscales'))
                                                          .toList(),
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'videos':
                                                        newcategoriesPageVideosRecordList
                                                            .where((e) => e
                                                                .categories
                                                                .contains(
                                                                    'Payscales'))
                                                            .toList(),
                                                  },
                                                );

                                                logFirebaseEvent(
                                                    'Image_google_analytics_event');
                                                logFirebaseEvent(
                                                    'Wages_Category');
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  payscalesItem.thumbnailURL,
                                                  width: 114.0,
                                                  height: 170.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -0.3),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 5.0, 0.0),
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x83000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
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
                                                        'NEWCATEGORIES_Icon_zjbcromj_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_navigate_to');

                                                    context.pushNamed(
                                                      'ProfileViewVideos',
                                                      queryParameters: {
                                                        'indexToStart':
                                                            serializeParam(
                                                          payscalesIndex,
                                                          ParamType.int,
                                                        ),
                                                        'videos':
                                                            serializeParam(
                                                          newcategoriesPageVideosRecordList
                                                              .where((e) => e
                                                                  .categories
                                                                  .contains(
                                                                      'Payscales'))
                                                              .toList(),
                                                          ParamType.Document,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'videos':
                                                            newcategoriesPageVideosRecordList
                                                                .where((e) => e
                                                                    .categories
                                                                    .contains(
                                                                        'Payscales'))
                                                                .toList(),
                                                      },
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.play_arrow_rounded,
                                                    color: Colors.white,
                                                    size: 37.0,
                                                  ),
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
                                                      3.0, 169.0, 2.0, 0.0),
                                              child: Text(
                                                payscalesItem.caption
                                                    .maybeHandleOverflow(
                                                  maxChars: 48,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 36.0, 0.0, 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 6.0),
                                    child: Text(
                                      'Espresso Machines',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 27.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/sidewalk-12.jpg',
                                      width: 39.0,
                                      height: 39.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  9.0, 0.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final espressomachines =
                                      newcategoriesPageVideosRecordList
                                          .where((e) => e.categories
                                              .contains('Espresso Machines'))
                                          .toList();

                                  return SizedBox(
                                    width: double.infinity,
                                    height: 225.0,
                                    child: CarouselSlider.builder(
                                      itemCount: espressomachines.length,
                                      itemBuilder:
                                          (context, espressomachinesIndex, _) {
                                        final espressomachinesItem =
                                            espressomachines[
                                                espressomachinesIndex];
                                        return Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: SizedBox(
                                            width: 123.0,
                                            height: 225.0,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
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
                                                          'NEWCATEGORIES_Image_lmpp2i7w_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_navigate_to');

                                                      context.pushNamed(
                                                        'ProfileViewVideos',
                                                        queryParameters: {
                                                          'indexToStart':
                                                              serializeParam(
                                                            espressomachinesIndex,
                                                            ParamType.int,
                                                          ),
                                                          'videos':
                                                              serializeParam(
                                                            newcategoriesPageVideosRecordList
                                                                .where((e) => e
                                                                    .categories
                                                                    .contains(
                                                                        'Espresso Machines'))
                                                                .toList(),
                                                            ParamType.Document,
                                                            isList: true,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'videos': newcategoriesPageVideosRecordList
                                                              .where((e) => e
                                                                  .categories
                                                                  .contains(
                                                                      'Espresso Machines'))
                                                              .toList(),
                                                        },
                                                      );

                                                      logFirebaseEvent(
                                                          'Image_google_analytics_event');
                                                      logFirebaseEvent(
                                                          'Espresso_Machines_Category');
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        espressomachinesItem.thumbnailURL,
                                                        width: 114.0,
                                                        height: 170.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -0.3),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0x83000000),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
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
                                                            'NEWCATEGORIES_Icon_6rzb8kps_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_navigate_to');

                                                        context.pushNamed(
                                                          'ProfileViewVideos',
                                                          queryParameters: {
                                                            'indexToStart':
                                                                serializeParam(
                                                              espressomachinesIndex,
                                                              ParamType.int,
                                                            ),
                                                            'videos':
                                                                serializeParam(
                                                              newcategoriesPageVideosRecordList
                                                                  .where((e) => e
                                                                      .categories
                                                                      .contains(
                                                                          'Espresso Machines'))
                                                                  .toList(),
                                                              ParamType
                                                                  .Document,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'videos': newcategoriesPageVideosRecordList
                                                                .where((e) => e
                                                                    .categories
                                                                    .contains(
                                                                        'Espresso Machines'))
                                                                .toList(),
                                                          },
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .play_arrow_rounded,
                                                        color: Colors.white,
                                                        size: 35.0,
                                                      ),
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
                                                            .fromSTEB(
                                                                3.0,
                                                                167.0,
                                                                2.0,
                                                                0.0),
                                                    child: Text(
                                                      espressomachinesItem.caption
                                                          .maybeHandleOverflow(
                                                        maxChars: 48,
                                                        replacement: '…',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController4 ??=
                                              CarouselSliderController(),
                                      options: CarouselOptions(
                                        initialPage: max(
                                            0,
                                            min(1,
                                                espressomachines.length - 1)),
                                        viewportFraction: 0.32,
                                        disableCenter: true,
                                        enlargeCenterPage: false,
                                        enlargeFactor: 0.0,
                                        enableInfiniteScroll: true,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: true,
                                        autoPlayAnimationDuration:
                                            const Duration(milliseconds: 3500),
                                        autoPlayInterval:
                                            const Duration(milliseconds: (3500 + 0)),
                                        autoPlayCurve: Curves.linear,
                                        pauseAutoPlayInFiniteScroll: true,
                                        onPageChanged: (index, _) => _model
                                            .carouselCurrentIndex4 = index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 9.0),
                                    child: Text(
                                      'Employees ',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 27.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/sidewalk-11.jpg',
                                        width: 43.0,
                                        height: 43.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 0.0, 5.0),
                          child: Builder(
                            builder: (context) {
                              final employees =
                                  newcategoriesPageVideosRecordList
                                      .where((e) =>
                                          e.categories.contains('Employees'))
                                      .toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(employees.length,
                                      (employeesIndex) {
                                    final employeesItem =
                                        employees[employeesIndex];
                                    return Container(
                                      width: 123.0,
                                      height: 225.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NEWCATEGORIES_Image_1he87cej_ON_TAP');
                                                logFirebaseEvent(
                                                    'Image_navigate_to');

                                                context.pushNamed(
                                                  'ProfileViewVideos',
                                                  queryParameters: {
                                                    'indexToStart':
                                                        serializeParam(
                                                      employeesIndex,
                                                      ParamType.int,
                                                    ),
                                                    'videos': serializeParam(
                                                      newcategoriesPageVideosRecordList
                                                          .where((e) => e
                                                              .categories
                                                              .contains(
                                                                  'Employees'))
                                                          .toList(),
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'videos':
                                                        newcategoriesPageVideosRecordList
                                                            .where((e) => e
                                                                .categories
                                                                .contains(
                                                                    'Employees'))
                                                            .toList(),
                                                  },
                                                );

                                                logFirebaseEvent(
                                                    'Image_google_analytics_event');
                                                logFirebaseEvent(
                                                    'Employees_Category');
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  employeesItem.thumbnailURL,
                                                  width: 114.0,
                                                  height: 170.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -0.3),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x83000000),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'NEWCATEGORIES_Icon_9ks54ss4_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_navigate_to');

                                                  context.pushNamed(
                                                    'ProfileViewVideos',
                                                    queryParameters: {
                                                      'indexToStart':
                                                          serializeParam(
                                                        employeesIndex,
                                                        ParamType.int,
                                                      ),
                                                      'videos': serializeParam(
                                                        newcategoriesPageVideosRecordList
                                                            .where((e) => e
                                                                .categories
                                                                .contains(
                                                                    'Employees'))
                                                            .toList(),
                                                        ParamType.Document,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'videos':
                                                          newcategoriesPageVideosRecordList
                                                              .where((e) => e
                                                                  .categories
                                                                  .contains(
                                                                      'Employees'))
                                                              .toList(),
                                                    },
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Colors.white,
                                                  size: 37.0,
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
                                                      3.0, 167.0, 2.0, 0.0),
                                              child: Text(
                                                employeesItem.caption
                                                    .maybeHandleOverflow(
                                                  maxChars: 48,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).divide(const SizedBox(width: 2.0)),
                                ),
                              );
                            },
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
      },
    );
  }
}
