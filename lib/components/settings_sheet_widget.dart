import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'settings_sheet_model.dart';
export 'settings_sheet_model.dart';

class SettingsSheetWidget extends StatefulWidget {
  const SettingsSheetWidget({super.key});

  @override
  State<SettingsSheetWidget> createState() => _SettingsSheetWidgetState();
}

class _SettingsSheetWidgetState extends State<SettingsSheetWidget>
    with TickerProviderStateMixin {
  late SettingsSheetModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsSheetModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1600.0.ms,
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 0.0),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SETTINGS_SHEET_Container_ouyo6adp_ON_TAP');
                logFirebaseEvent('Container_auth');
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('registerpage1', context.mounted);
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'SETTINGS_SHEET_COMP_Row_90xpgvaj_ON_TAP');
                      logFirebaseEvent('Row_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('registerpage1', context.mounted);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_SHEET_COMP_Card_pugsfxtl_ON_TAP');
                            logFirebaseEvent('Card_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                                'registerpage1', context.mounted);
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_SHEET_COMP_Icon_17due3hj_ON_TAP');
                                logFirebaseEvent('Icon_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    'registerpage1', context.mounted);
                              },
                              child: const Icon(
                                Icons.logout_outlined,
                                color: Color(0xFF57636C),
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_SHEET_COMP_Row_rrw7ua7l_ON_TAP');
                                logFirebaseEvent('Row_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    'registerpage1', context.mounted);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SETTINGS_SHEET_COMP_Text_mgd7xhi3_ON_TAP');
                                      logFirebaseEvent('Text_auth');
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context)
                                          .clearRedirectLocation();

                                      context.goNamedAuth(
                                          'registerpage1', context.mounted);
                                    },
                                    child: Text(
                                      'Log Out',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: const Color(0xFF14181B),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
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
            const SizedBox(
              width: 396.0,
              child: Divider(
                thickness: 1.0,
                indent: 20.0,
                color: Color(0x1B000000),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SETTINGS_SHEET_Container_xj9qbm3q_ON_TAP');
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed('privacypolicy');
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'SETTINGS_SHEET_COMP_Row_cyoxh4h8_ON_TAP');
                      logFirebaseEvent('Row_navigate_to');

                      context.pushNamed('privacypolicy');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_SHEET_COMP_Card_ye3m70tk_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.pushNamed('privacypolicy');
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_SHEET_COMP_Icon_0tvcg3d7_ON_TAP');
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed('privacypolicy');
                              },
                              child: const Icon(
                                Icons.privacy_tip_outlined,
                                color: Color(0xFF57636C),
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_SHEET_COMP_Row_da7nikwu_ON_TAP');
                                logFirebaseEvent('Row_navigate_to');

                                context.pushNamed('privacypolicy');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SETTINGS_SHEET_COMP_Text_qost1fh0_ON_TAP');
                                      logFirebaseEvent('Text_navigate_to');

                                      context.pushNamed('privacypolicy');
                                    },
                                    child: Text(
                                      'Privacy Policy',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: const Color(0xFF14181B),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
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
            const SizedBox(
              width: 396.0,
              child: Divider(
                thickness: 1.0,
                indent: 20.0,
                color: Color(0x1B000000),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SETTINGS_SHEET_Container_p265444o_ON_TAP');
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed('deletion');
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'SETTINGS_SHEET_COMP_Row_lhfw9b5g_ON_TAP');
                      logFirebaseEvent('Row_navigate_to');

                      context.pushNamed('deletion');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_SHEET_COMP_Card_shhrv10v_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.pushNamed('deletion');
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_SHEET_COMP_Icon_7a010ud9_ON_TAP');
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed('deletion');
                              },
                              child: const Icon(
                                Icons.person,
                                color: Color(0xFF57636C),
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_SHEET_COMP_Row_72bzvaz7_ON_TAP');
                                logFirebaseEvent('Row_navigate_to');

                                context.pushNamed('deletion');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SETTINGS_SHEET_COMP_Text_p0ab5jeg_ON_TAP');
                                      logFirebaseEvent('Text_navigate_to');

                                      context.pushNamed('deletion');
                                    },
                                    child: Text(
                                      'Account Deletion Section',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: const Color(0xFF14181B),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
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
            const SizedBox(
              width: 396.0,
              child: Divider(
                thickness: 1.0,
                indent: 20.0,
                color: Color(0x1B000000),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SETTINGS_SHEET_Container_t7tvyrcs_ON_TAP');
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed('feedback');
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'SETTINGS_SHEET_COMP_Row_2m9h2zxt_ON_TAP');
                      logFirebaseEvent('Row_navigate_to');

                      context.pushNamed('feedback');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_SHEET_COMP_Card_loekktwj_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.pushNamed('deletion');
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_SHEET_COMP_Icon_dh05l22p_ON_TAP');
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed('feedback');
                              },
                              child: const Icon(
                                Icons.mail_outline,
                                color: Color(0xFF57636C),
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_SHEET_COMP_Row_xwztfh8i_ON_TAP');
                                logFirebaseEvent('Row_navigate_to');

                                context.pushNamed('feedback');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SETTINGS_SHEET_COMP_Text_74hpqnou_ON_TAP');
                                      logFirebaseEvent('Text_navigate_to');

                                      context.pushNamed('feedback');
                                    },
                                    child: Text(
                                      'Contact / Feedback',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: const Color(0xFF14181B),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
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
          ],
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
