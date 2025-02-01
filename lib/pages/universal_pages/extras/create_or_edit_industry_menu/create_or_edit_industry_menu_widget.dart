import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/universal_pages/extras/create_or_edit_industry/create_or_edit_industry_widget.dart';
import '/pages/universal_pages/extras/list_of_industries/list_of_industries_widget.dart';
import 'package:flutter/material.dart';
import 'create_or_edit_industry_menu_model.dart';
export 'create_or_edit_industry_menu_model.dart';

class CreateOrEditIndustryMenuWidget extends StatefulWidget {
  const CreateOrEditIndustryMenuWidget({super.key});

  @override
  State<CreateOrEditIndustryMenuWidget> createState() =>
      _CreateOrEditIndustryMenuWidgetState();
}

class _CreateOrEditIndustryMenuWidgetState
    extends State<CreateOrEditIndustryMenuWidget> {
  late CreateOrEditIndustryMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateOrEditIndustryMenuModel());

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
        height: MediaQuery.sizeOf(context).height * 0.45,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(
                0.0,
                -3.0,
              ),
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
                    'Create or change industry',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Staatliches',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
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
                          'CREATE_OR_EDIT_INDUSTRY_MENU_Icon_5bgqb5');
                      logFirebaseEvent('Icon_bottom_sheet');
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'CREATE_OR_EDIT_INDUSTRY_MENU_Container_w');
                    logFirebaseEvent('Container_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const CreateOrEditIndustryWidget(
                            edit: false,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 32.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: Icon(
                                    Icons.gavel,
                                    color: Color(0xFF20A394),
                                    size: 24.0,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Create New Industry',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Dekko',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 45.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Create a brand new industry in the system.',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Dekko',
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                        ),
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
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'CREATE_OR_EDIT_INDUSTRY_MENU_Container_5');
                    logFirebaseEvent('Container_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const ListOfIndustriesWidget(),
                        );
                      },
                    ).then((value) =>
                        safeSetState(() => _model.selectedIndustry = value));

                    logFirebaseEvent('Container_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: CreateOrEditIndustryWidget(
                            edit: true,
                            industry: _model.selectedIndustry,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));

                    safeSetState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 32.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: Icon(
                                    Icons.create_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Change Existing Industry',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Dekko',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 45.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Edit an existing industry or feature it on the home page.',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Dekko',
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                        ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
