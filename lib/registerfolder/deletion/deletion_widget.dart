import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'deletion_model.dart';
export 'deletion_model.dart';

class DeletionWidget extends StatefulWidget {
  const DeletionWidget({super.key});

  @override
  State<DeletionWidget> createState() => _DeletionWidgetState();
}

class _DeletionWidgetState extends State<DeletionWidget> {
  late DeletionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletionModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'deletion'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('DELETION_PAGE_Icon_a6knjg0q_ON_TAP');
                      logFirebaseEvent('Icon_navigate_back');
                      context.safePop();
                    },
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 54.0,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 130.0, 0.0, 0.0),
                    child: Text(
                      'Delete Account Permanently?',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 23.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(37.0, 5.0, 37.0, 0.0),
                child: Text(
                  'Your account and content will be deleted permanently after clicking the button below. If you do not wish to delete your account, you can go back to the app by clicking the \"back\" icon up top.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('DELETION_DELETE_MY_ACCOUNT_BTN_ON_TAP');
                    logFirebaseEvent('Button_auth');
                    await authManager.deleteUser(context);

                    context.goNamedAuth('HomePage', context.mounted);
                  },
                  text: 'Delete My Account',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
