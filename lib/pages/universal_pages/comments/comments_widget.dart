import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/universal_pages/components_fillers/no_comments_avail/no_comments_avail_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'comments_model.dart';
export 'comments_model.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({
    super.key,
    required this.vidRef,
    required this.creatorRef,
  });

  final DocumentReference? vidRef;
  final DocumentReference? creatorRef;

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  late CommentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsModel());

    _model.commentTextController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.8,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 225.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.6,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.6,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 14.0, 74.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        128.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        'Comments',
                                        '0 comments',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'COMMENTS_COMP_Icon_hisvjsmq_ON_TAP');
                                  logFirebaseEvent(
                                      'Icon_close_dialog_drawer_etc');
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close_sharp,
                                  color: Colors.black,
                                  size: 28.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Container(
                          width: double.infinity,
                          height: 326.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: StreamBuilder<List<CommentsRecord>>(
                              stream: queryCommentsRecord(
                                queryBuilder: (commentsRecord) => commentsRecord
                                    .where(
                                      'video_ref',
                                      isEqualTo: widget.vidRef,
                                    )
                                    .where(
                                      'parent_comment',
                                      isEqualTo: null,
                                    )
                                    .orderBy('created_date', descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitRipple(
                                        color: Color(0xFF3995D2),
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<CommentsRecord>
                                    commentsListCommentsRecordList =
                                    snapshot.data!;
                                if (commentsListCommentsRecordList.isEmpty) {
                                  return const NoCommentsAvailWidget();
                                }

                                return ListView.separated(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      commentsListCommentsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10.0),
                                  itemBuilder: (context, commentsListIndex) {
                                    final commentsListCommentsRecord =
                                        commentsListCommentsRecordList[
                                            commentsListIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              commentsListCommentsRecord
                                                  .commentingUser!),
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

                                            final columnUsersRecord =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
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
                                                            'COMMENTS_CircleImage_ejbhajqr_ON_TAP');
                                                        logFirebaseEvent(
                                                            'CircleImage_navigate_to');

                                                        context.pushNamed(
                                                          'PublicProfile',
                                                          pathParameters: {
                                                            'userRef':
                                                                serializeParam(
                                                              commentsListCommentsRecord
                                                                  .commentingUser,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 45.0,
                                                        height: 45.0,
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
                                                            columnUsersRecord
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnUsersRecord
                                                                          .shopName,
                                                                      'User',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (commentsListCommentsRecord
                                                                        .commentingUser ==
                                                                    widget
                                                                        .creatorRef)
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'OP',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Dekko',
                                                                            color:
                                                                                const Color(0xFF5A0DB7),
                                                                            fontSize:
                                                                                8.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Text(
                                                                commentsListCommentsRecord
                                                                    .comment,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 10.0)),
                                                ),
                                                if (loggedIn)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        42.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  dateTimeFormat(
                                                                      "relative",
                                                                      commentsListCommentsRecord
                                                                          .createdDate!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                ),
                                                                if (false)
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
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
                                                                            'COMMENTS_COMP_Text_363vwz7l_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Text_update_component_state');
                                                                        _model.replyingToUser =
                                                                            columnUsersRecord.displayName;
                                                                        _model.replyingToComment =
                                                                            commentsListCommentsRecord.reference;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Reply',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final likesElement =
                                                                    currentUserReference;
                                                                final likesUpdate = commentsListCommentsRecord
                                                                        .likes
                                                                        .contains(
                                                                            likesElement)
                                                                    ? FieldValue
                                                                        .arrayRemove([
                                                                        likesElement
                                                                      ])
                                                                    : FieldValue
                                                                        .arrayUnion([
                                                                        likesElement
                                                                      ]);
                                                                await commentsListCommentsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'likes':
                                                                          likesUpdate,
                                                                    },
                                                                  ),
                                                                });
                                                                logFirebaseEvent(
                                                                    'COMMENTS_ToggleIcon_rbeb6a4r_ON_TOGGLE');
                                                                if (commentsListCommentsRecord
                                                                    .likes
                                                                    .contains(
                                                                        currentUserReference)) {
                                                                  logFirebaseEvent(
                                                                      'ToggleIcon_backend_call');

                                                                  await commentsListCommentsRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'likes':
                                                                            FieldValue.arrayRemove([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  return;
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'ToggleIcon_backend_call');

                                                                  await commentsListCommentsRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'likes':
                                                                            FieldValue.arrayUnion([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  return;
                                                                }
                                                              },
                                                              value: commentsListCommentsRecord
                                                                  .likes
                                                                  .contains(
                                                                      currentUserReference),
                                                              onIcon: Icon(
                                                                Icons
                                                                    .favorite_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                size: 22.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .favorite_border_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 22.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                formatNumber(
                                                                  commentsListCommentsRecord
                                                                      .likes
                                                                      .length,
                                                                  formatType:
                                                                      FormatType
                                                                          .compact,
                                                                ),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (commentsListCommentsRecord
                                                    .hasReplies)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  50.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<CommentsRecord>>(
                                                        stream:
                                                            queryCommentsRecord(
                                                          queryBuilder: (commentsRecord) =>
                                                              commentsRecord
                                                                  .where(
                                                                    'video_ref',
                                                                    isEqualTo:
                                                                        widget
                                                                            .vidRef,
                                                                  )
                                                                  .where(
                                                                    'parent_comment',
                                                                    isEqualTo:
                                                                        commentsListCommentsRecord
                                                                            .reference,
                                                                  )
                                                                  .orderBy(
                                                                      'created_date',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<CommentsRecord>
                                                              expandableCommentsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            color: const Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              initialExpanded:
                                                                  false,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Text(
                                                                  'View  ${expandableCommentsRecordList.length.toString()} Replies',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                collapsed:
                                                                    Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final replies = expandableCommentsRecordList
                                                                            .toList()
                                                                            .take(1)
                                                                            .toList();

                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              replies.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              const SizedBox(height: 5.0),
                                                                          itemBuilder:
                                                                              (context, repliesIndex) {
                                                                            final repliesItem =
                                                                                replies[repliesIndex];
                                                                            return StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(repliesItem.commentingUser!),
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

                                                                                final columnUsersRecord = snapshot.data!;

                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
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
                                                                                            logFirebaseEvent('COMMENTS_CircleImage_0y835e9y_ON_TAP');
                                                                                            logFirebaseEvent('CircleImage_navigate_to');

                                                                                            context.pushNamed(
                                                                                              'PublicProfile',
                                                                                              pathParameters: {
                                                                                                'userRef': serializeParam(
                                                                                                  columnUsersRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
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
                                                                                                columnUsersRecord.photoUrl,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                                                              ),
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          columnUsersRecord.shopName,
                                                                                                          'User',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 13.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (commentsListCommentsRecord.commentingUser == widget.creatorRef)
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'OP',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Dekko',
                                                                                                                color: const Color(0xFF5A0DB7),
                                                                                                                fontSize: 8.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 12.0, 0.0),
                                                                                                  child: Text(
                                                                                                    commentsListCommentsRecord.comment,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Roboto',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(const SizedBox(width: 10.0)),
                                                                                    ),
                                                                                    if (loggedIn)
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(42.0, 0.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      dateTimeFormat("relative", commentsListCommentsRecord.createdDate!),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 11.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Reply',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
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
                                                                                                ToggleIcon(
                                                                                                  onPressed: () async {
                                                                                                    final likesElement = currentUserReference;
                                                                                                    final likesUpdate = commentsListCommentsRecord.likes.contains(likesElement) ? FieldValue.arrayRemove([likesElement]) : FieldValue.arrayUnion([likesElement]);
                                                                                                    await commentsListCommentsRecord.reference.update({
                                                                                                      ...mapToFirestore(
                                                                                                        {
                                                                                                          'likes': likesUpdate,
                                                                                                        },
                                                                                                      ),
                                                                                                    });
                                                                                                    logFirebaseEvent('COMMENTS_ToggleIcon_dhnrmj17_ON_TOGGLE');
                                                                                                    if (repliesItem.likes.contains(currentUserReference)) {
                                                                                                      logFirebaseEvent('ToggleIcon_backend_call');

                                                                                                      await repliesItem.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'likes': FieldValue.arrayRemove([currentUserReference]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      return;
                                                                                                    } else {
                                                                                                      logFirebaseEvent('ToggleIcon_backend_call');

                                                                                                      await repliesItem.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'likes': FieldValue.arrayUnion([currentUserReference]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      return;
                                                                                                    }
                                                                                                  },
                                                                                                  value: commentsListCommentsRecord.likes.contains(currentUserReference),
                                                                                                  onIcon: Icon(
                                                                                                    Icons.favorite_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    size: 22.0,
                                                                                                  ),
                                                                                                  offIcon: Icon(
                                                                                                    Icons.favorite_border_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 22.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      commentsListCommentsRecord.likes.length,
                                                                                                      formatType: FormatType.compact,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                expanded:
                                                                    Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final repliesAll =
                                                                            expandableCommentsRecordList.toList();

                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              repliesAll.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              const SizedBox(height: 5.0),
                                                                          itemBuilder:
                                                                              (context, repliesAllIndex) {
                                                                            final repliesAllItem =
                                                                                repliesAll[repliesAllIndex];
                                                                            return StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(repliesAllItem.commentingUser!),
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

                                                                                final columnReplyUsersRecord = snapshot.data!;

                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
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
                                                                                            logFirebaseEvent('COMMENTS_CircleImage_7wid78ew_ON_TAP');
                                                                                            logFirebaseEvent('CircleImage_navigate_to');

                                                                                            context.pushNamed(
                                                                                              'PublicProfile',
                                                                                              pathParameters: {
                                                                                                'userRef': serializeParam(
                                                                                                  columnReplyUsersRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
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
                                                                                                columnReplyUsersRecord.photoUrl,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/watch-it-tik-tok-clone-xyjz2w/assets/jrljaknwywz5/icons8-person-104.png',
                                                                                              ),
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          columnReplyUsersRecord.displayName,
                                                                                                          'User',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              fontSize: 13.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (commentsListCommentsRecord.commentingUser == widget.creatorRef)
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'OP',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Dekko',
                                                                                                                color: const Color(0xFF5A0DB7),
                                                                                                                fontSize: 8.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 12.0, 0.0),
                                                                                                  child: Text(
                                                                                                    commentsListCommentsRecord.comment,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Roboto',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(const SizedBox(width: 10.0)),
                                                                                    ),
                                                                                    if (loggedIn)
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(42.0, 0.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      dateTimeFormat("relative", commentsListCommentsRecord.createdDate!),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            fontSize: 11.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('COMMENTS_COMP_Text_p56vwq35_ON_TAP');
                                                                                                          logFirebaseEvent('Text_update_component_state');
                                                                                                          _model.replyingToUser = columnReplyUsersRecord.displayName;
                                                                                                          _model.replyingToComment = commentsListCommentsRecord.reference;
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Text(
                                                                                                          'Reply',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Roboto',
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
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
                                                                                                ToggleIcon(
                                                                                                  onPressed: () async {
                                                                                                    final likesElement = currentUserReference;
                                                                                                    final likesUpdate = commentsListCommentsRecord.likes.contains(likesElement) ? FieldValue.arrayRemove([likesElement]) : FieldValue.arrayUnion([likesElement]);
                                                                                                    await commentsListCommentsRecord.reference.update({
                                                                                                      ...mapToFirestore(
                                                                                                        {
                                                                                                          'likes': likesUpdate,
                                                                                                        },
                                                                                                      ),
                                                                                                    });
                                                                                                    logFirebaseEvent('COMMENTS_ToggleIcon_cndfttm0_ON_TOGGLE');
                                                                                                    if (repliesAllItem.likes.contains(currentUserReference)) {
                                                                                                      logFirebaseEvent('ToggleIcon_backend_call');

                                                                                                      await repliesAllItem.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'likes': FieldValue.arrayRemove([currentUserReference]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      return;
                                                                                                    } else {
                                                                                                      logFirebaseEvent('ToggleIcon_backend_call');

                                                                                                      await repliesAllItem.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'likes': FieldValue.arrayUnion([currentUserReference]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      return;
                                                                                                    }
                                                                                                  },
                                                                                                  value: commentsListCommentsRecord.likes.contains(currentUserReference),
                                                                                                  onIcon: Icon(
                                                                                                    Icons.favorite_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    size: 22.0,
                                                                                                  ),
                                                                                                  offIcon: Icon(
                                                                                                    Icons.favorite_border_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 22.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    formatNumber(
                                                                                                      commentsListCommentsRecord.likes.length,
                                                                                                      formatType: FormatType.compact,
                                                                                                    ),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                theme:
                                                                    const ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
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
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      child: Container(
                        width: double.infinity,
                        height: 95.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          children: [
                            if (loggedIn)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    6.0, 12.0, 6.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 6.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.commentTextController,
                                          focusNode: _model.commentFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: _model
                                                        .replyingToComment !=
                                                    null
                                                ? 'Replying to ${_model.replyingToUser}'
                                                : 'Type your comment...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                            ),
                                            filled: true,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: null,
                                          minLines: 1,
                                          validator: _model
                                              .commentTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: const Icon(
                                          Icons.send,
                                          color: Color(0xFF3889FF),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'COMMENTS_COMP_send_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_backend_call');

                                          var commentsRecordReference =
                                              CommentsRecord.collection.doc();
                                          await commentsRecordReference
                                              .set(createCommentsRecordData(
                                            videoRef: widget.vidRef,
                                            createdDate: getCurrentTimestamp,
                                            commentingUser:
                                                currentUserReference,
                                            comment: _model
                                                .commentTextController.text,
                                            hasReplies: false,
                                          ));
                                          _model.newComment = CommentsRecord
                                              .getDocumentFromData(
                                                  createCommentsRecordData(
                                                    videoRef: widget.vidRef,
                                                    createdDate:
                                                        getCurrentTimestamp,
                                                    commentingUser:
                                                        currentUserReference,
                                                    comment: _model
                                                        .commentTextController
                                                        .text,
                                                    hasReplies: false,
                                                  ),
                                                  commentsRecordReference);
                                          logFirebaseEvent(
                                              'IconButton_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle: 'New Comment',
                                            notificationText:
                                                '${valueOrDefault(currentUserDocument?.shopName, '')} just commented on your video!',
                                            notificationImageUrl:
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.ownerpic,
                                                    ''),
                                            userRefs: [widget.creatorRef!],
                                            initialPageName: 'viewVidUpload',
                                            parameterData: {
                                              'vidRef': widget.vidRef,
                                            },
                                          );
                                          logFirebaseEvent(
                                              'IconButton_clear_text_fields_pin_codes');
                                          safeSetState(() {
                                            _model.commentTextController
                                                ?.clear();
                                          });

                                          safeSetState(() {});
                                        },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
