import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/universal_pages/comments/comments_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'commentsforprofilevideos_model.dart';
export 'commentsforprofilevideos_model.dart';

class CommentsforprofilevideosWidget extends StatefulWidget {
  const CommentsforprofilevideosWidget({super.key});

  @override
  State<CommentsforprofilevideosWidget> createState() =>
      _CommentsforprofilevideosWidgetState();
}

class _CommentsforprofilevideosWidgetState
    extends State<CommentsforprofilevideosWidget> {
  late CommentsforprofilevideosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsforprofilevideosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
        child: Container(
          width: double.infinity,
          height: 100.0,
          constraints: const BoxConstraints(
            maxHeight: 115.0,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 1.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'COMMENTSFORPROFILEVIDEOS_ADD_COMMENT__BT');
                      logFirebaseEvent('Button_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: CommentsWidget(
                              vidRef: FFAppState().tempVidID!,
                              creatorRef: currentUserReference!,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    text:
                        '   Add comment...                                 😎🥰☕️   ',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0x3267696B),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
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
  }
}
