import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'post_comment_reply_model.dart';
export 'post_comment_reply_model.dart';

class PostCommentReplyWidget extends StatefulWidget {
  const PostCommentReplyWidget({
    super.key,
    required this.replytoCommentRef,
  });

  final DocumentReference? replytoCommentRef;

  @override
  State<PostCommentReplyWidget> createState() => _PostCommentReplyWidgetState();
}

class _PostCommentReplyWidgetState extends State<PostCommentReplyWidget> {
  late PostCommentReplyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostCommentReplyModel());

    _model.replytoFieldController ??= TextEditingController();
    _model.replytoFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('POST_COMMENT_REPLY_Container_ztk0f12t_ON');
        logFirebaseEvent('Container_bottom_sheet');
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        alignment: const AlignmentDirectional(0.0, 1.0),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: StreamBuilder<VidCommentsRecord>(
            stream: VidCommentsRecord.getDocument(widget.replytoCommentRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitPumpingHeart(
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final containerVidCommentsRecord = snapshot.data!;
              return Material(
                color: Colors.transparent,
                elevation: 1.0,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(6.0, 16.0, 6.0, 18.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.replytoFieldController,
                              focusNode: _model.replytoFieldFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                    ),
                                hintText:
                                    'Replying to @${FFAppState().replyToName}',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                filled: true,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                  ),
                              maxLines: null,
                              minLines: 1,
                              maxLength: 120,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              validator: _model.replytoFieldControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 28.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.commentDots,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'POST_COMMENT_REPLY_commentDots_ICN_ON_TA');
                              var shouldSetState = false;
                              if (containerVidCommentsRecord.hasReplies) {
                                logFirebaseEvent('IconButton_backend_call');

                                var vidSubCommentsRecordReference1 =
                                    VidSubCommentsRecord.createDoc(
                                        containerVidCommentsRecord
                                            .parentReference);
                                await vidSubCommentsRecordReference1
                                    .set(createVidSubCommentsRecordData(
                                  date: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                  comment: _model.replytoFieldController.text,
                                  vidMainCommentRef:
                                      containerVidCommentsRecord.reference,
                                  replytoUserRef:
                                      containerVidCommentsRecord.userRef,
                                ));
                                _model.newSubComment =
                                    VidSubCommentsRecord.getDocumentFromData(
                                        createVidSubCommentsRecordData(
                                          date: getCurrentTimestamp,
                                          userRef: currentUserReference,
                                          comment: _model
                                              .replytoFieldController.text,
                                          vidMainCommentRef:
                                              containerVidCommentsRecord
                                                  .reference,
                                          replytoUserRef:
                                              containerVidCommentsRecord
                                                  .userRef,
                                        ),
                                        vidSubCommentsRecordReference1);
                                shouldSetState = true;
                                logFirebaseEvent('IconButton_backend_call');

                                await containerVidCommentsRecord.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'sub_comments_ref': FieldValue.arrayUnion(
                                          [_model.newSubComment?.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('IconButton_backend_call');

                                await containerVidCommentsRecord.parentReference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'CommentCount': FieldValue.increment(1),
                                    },
                                  ),
                                });
                                logFirebaseEvent('IconButton_update_app_state');
                                FFAppState().replyToName = '';
                                logFirebaseEvent(
                                    'IconButton_close_dialog,_drawer,_etc');
                                Navigator.pop(context);
                                if (shouldSetState) setState(() {});
                                return;
                              } else {
                                logFirebaseEvent('IconButton_backend_call');

                                var vidSubCommentsRecordReference2 =
                                    VidSubCommentsRecord.createDoc(
                                        containerVidCommentsRecord
                                            .parentReference);
                                await vidSubCommentsRecordReference2
                                    .set(createVidSubCommentsRecordData(
                                  date: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                  comment: _model.replytoFieldController.text,
                                  vidMainCommentRef:
                                      containerVidCommentsRecord.reference,
                                  replytoUserRef:
                                      containerVidCommentsRecord.userRef,
                                ));
                                _model.newSubComment1 =
                                    VidSubCommentsRecord.getDocumentFromData(
                                        createVidSubCommentsRecordData(
                                          date: getCurrentTimestamp,
                                          userRef: currentUserReference,
                                          comment: _model
                                              .replytoFieldController.text,
                                          vidMainCommentRef:
                                              containerVidCommentsRecord
                                                  .reference,
                                          replytoUserRef:
                                              containerVidCommentsRecord
                                                  .userRef,
                                        ),
                                        vidSubCommentsRecordReference2);
                                shouldSetState = true;
                                logFirebaseEvent('IconButton_backend_call');

                                await containerVidCommentsRecord.reference
                                    .update({
                                  ...createVidCommentsRecordData(
                                    hasReplies: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'sub_comments_ref': FieldValue.arrayUnion(
                                          [_model.newSubComment1?.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('IconButton_backend_call');

                                await containerVidCommentsRecord.parentReference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'CommentCount': FieldValue.increment(1),
                                    },
                                  ),
                                });
                                logFirebaseEvent('IconButton_update_app_state');
                                FFAppState().replyToName = '';
                                logFirebaseEvent(
                                    'IconButton_close_dialog,_drawer,_etc');
                                Navigator.pop(context);
                                if (shouldSetState) setState(() {});
                                return;
                              }

                              if (shouldSetState) setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
