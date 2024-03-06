import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'post_age_flag_model.dart';
export 'post_age_flag_model.dart';

class PostAgeFlagWidget extends StatefulWidget {
  const PostAgeFlagWidget({super.key});

  @override
  State<PostAgeFlagWidget> createState() => _PostAgeFlagWidgetState();
}

class _PostAgeFlagWidgetState extends State<PostAgeFlagWidget> {
  late PostAgeFlagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostAgeFlagModel());

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

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.45,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(0.0, -3.0),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'content flag',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Staatliches',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'POST_AGE_FLAG_COMP_Icon_v11wkbeh_ON_TAP');
                      logFirebaseEvent('Icon_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 26.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: Icon(
                              Icons.family_restroom_sharp,
                              color: Color(0xFF20A394),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Post is Family-Friendly',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Dekko',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          ToggleIcon(
                            onPressed: () async {
                              setState(() => FFAppState().postIs18Older =
                                  !FFAppState().postIs18Older);
                              logFirebaseEvent(
                                  'POST_AGE_FLAG_ToggleIcon_5gfpd5pn_ON_TOG');
                              logFirebaseEvent('ToggleIcon_update_app_state');
                              _model.updatePage(() {
                                FFAppState().postIs18Older = false;
                              });
                              logFirebaseEvent('ToggleIcon_bottom_sheet');
                              Navigator.pop(context);
                            },
                            value: !FFAppState().postIs18Older,
                            onIcon: const Icon(
                              Icons.check_circle_outlined,
                              color: Color(0xFF20A394),
                              size: 25.0,
                            ),
                            offIcon: Icon(
                              Icons.circle_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 45.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Your post is safe for the entire family and has no content that may be offensive to young viewers.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Dekko',
                                    fontSize: 11.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: Icon(
                              Icons.groups_3_rounded,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Post is for Adults Only',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Dekko',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          ToggleIcon(
                            onPressed: () async {
                              setState(() => FFAppState().postIs18Older =
                                  !FFAppState().postIs18Older);
                              logFirebaseEvent(
                                  'POST_AGE_FLAG_ToggleIcon_vna4yrld_ON_TOG');
                              logFirebaseEvent('ToggleIcon_update_app_state');
                              _model.updatePage(() {
                                FFAppState().postIs18Older = true;
                              });
                              logFirebaseEvent('ToggleIcon_bottom_sheet');
                              Navigator.pop(context);
                            },
                            value: FFAppState().postIs18Older,
                            onIcon: Icon(
                              Icons.check_circle_outlined,
                              color: FlutterFlowTheme.of(context).error,
                              size: 25.0,
                            ),
                            offIcon: Icon(
                              Icons.circle_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 45.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Your post is not safe for the entire family and may have content that would be offensive to young viewers.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Dekko',
                                    fontSize: 11.0,
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
      ),
    );
  }
}
