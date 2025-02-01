import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_notifications_to_show_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Notifications'});
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
                            'NOTIFICATIONS_PAGE_Icon_ig10qjlo_ON_TAP');
                        logFirebaseEvent('Icon_navigate_back');
                        context.safePop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xFF161617),
                        size: 28.0,
                      ),
                    ),
                    title: Text(
                      'Your Notifications',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    actions: const [],
                    centerTitle: true,
                    elevation: 0.0,
                  ),
                )
              : null,
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: StreamBuilder<List<NotificationsRecord>>(
                  stream: queryNotificationsRecord(
                    queryBuilder: (notificationsRecord) => notificationsRecord
                        .where(
                          'user_refs',
                          arrayContains: currentUserReference,
                        )
                        .orderBy('timestamp', descending: true),
                  ),
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
                    List<NotificationsRecord> listViewNotificationsRecordList =
                        snapshot.data!;
                    if (listViewNotificationsRecordList.isEmpty) {
                      return const NoNotificationsToShowWidget();
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewNotificationsRecordList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewNotificationsRecord =
                            listViewNotificationsRecordList[listViewIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 2.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      listViewNotificationsRecord
                                          .notificationTitle,
                                      'Title',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                          "relative",
                                          listViewNotificationsRecord
                                              .timestamp),
                                      'Timestamp',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2.0, 2.0, 0.0, 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 45.0,
                                        height: 45.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/sidewalk_research_(APP_icon)-16.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            listViewNotificationsRecord
                                                .notificationText,
                                            'Body',
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
