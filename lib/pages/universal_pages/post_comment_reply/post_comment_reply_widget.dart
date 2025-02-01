import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'post_comment_reply_model.dart';
export 'post_comment_reply_model.dart';

class PostCommentReplyWidget extends StatefulWidget {
  const PostCommentReplyWidget({
    super.key,
    required this.replyToComment,
    required this.replyingTo,
  });

  final CommentsRecord? replyToComment;
  final String? replyingTo;

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

    _model.replytoFieldTextController ??= TextEditingController();
    _model.replytoFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Material(
            color: Colors.transparent,
            elevation: 1.0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6.0, 16.0, 6.0, 18.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.replytoFieldTextController,
                          focusNode: _model.replytoFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Replying to @${valueOrDefault<String>(
                              widget.replyingTo,
                              'User',
                            )}',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  letterSpacing: 0.0,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Open Sans',
                                    letterSpacing: 0.0,
                                  ),
                          maxLines: null,
                          minLines: 1,
                          maxLength: 120,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          validator: _model.replytoFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 28.0),
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
                          logFirebaseEvent('IconButton_backend_call');

                          var commentsRecordReference =
                              CommentsRecord.collection.doc();
                          await commentsRecordReference
                              .set(createCommentsRecordData(
                            videoRef: widget.replyToComment?.videoRef,
                            parentComment: widget.replyToComment?.parentComment
                                            ?.id !=
                                        null &&
                                    widget.replyToComment?.parentComment?.id !=
                                        ''
                                ? widget.replyToComment?.parentComment
                                : widget.replyToComment?.reference,
                            createdDate: getCurrentTimestamp,
                            commentingUser: currentUserReference,
                            comment: _model.replytoFieldTextController.text,
                            hasReplies: false,
                          ));
                          _model.createdReply =
                              CommentsRecord.getDocumentFromData(
                                  createCommentsRecordData(
                                    videoRef: widget.replyToComment?.videoRef,
                                    parentComment: widget.replyToComment
                                                    ?.parentComment?.id !=
                                                null &&
                                            widget.replyToComment
                                                    ?.parentComment?.id !=
                                                ''
                                        ? widget.replyToComment?.parentComment
                                        : widget.replyToComment?.reference,
                                    createdDate: getCurrentTimestamp,
                                    commentingUser: currentUserReference,
                                    comment:
                                        _model.replytoFieldTextController.text,
                                    hasReplies: false,
                                  ),
                                  commentsRecordReference);
                          if (!_model.createdReply!.hasReplies) {
                            logFirebaseEvent('IconButton_backend_call');

                            await _model.createdReply!.parentComment!
                                .update(createCommentsRecordData(
                              hasReplies: true,
                            ));
                          }
                          logFirebaseEvent(
                              'IconButton_trigger_push_notification');
                          triggerPushNotification(
                            notificationTitle: 'You Got a Reply!',
                            notificationText:
                                '$currentUserDisplayName replied to your comment!',
                            notificationSound: 'default',
                            userRefs: [widget.replyToComment!.commentingUser!],
                            initialPageName: 'viewVidUpload',
                            parameterData: {
                              'vidRef': widget.replyToComment?.videoRef,
                            },
                          );

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
