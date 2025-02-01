import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'create_or_edit_industry_model.dart';
export 'create_or_edit_industry_model.dart';

class CreateOrEditIndustryWidget extends StatefulWidget {
  const CreateOrEditIndustryWidget({
    super.key,
    required this.edit,
    this.industry,
  });

  final bool? edit;
  final IndustriesRecord? industry;

  @override
  State<CreateOrEditIndustryWidget> createState() =>
      _CreateOrEditIndustryWidgetState();
}

class _CreateOrEditIndustryWidgetState
    extends State<CreateOrEditIndustryWidget> {
  late CreateOrEditIndustryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateOrEditIndustryModel());

    _model.industryNameTextController ??= TextEditingController(
        text: widget.industry != null
            ? valueOrDefault<String>(
                widget.industry?.name,
                'Name',
              )
            : '');
    _model.industryNameFocusNode ??= FocusNode();

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
                    widget.edit! ? 'Edit Industry' : 'Create Industry',
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
                          'CREATE_OR_EDIT_INDUSTRY_Icon_vuq8dchw_ON');
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: SizedBox(
                        width: 200.0,
                        child: TextFormField(
                          controller: _model.industryNameTextController,
                          focusNode: _model.industryNameFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Industry Name',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Dekko',
                                  letterSpacing: 0.0,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Dekko',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Dekko',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.industryNameTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Feature on the home page',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Dekko',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).primary,
                    ),
                    child: Checkbox(
                      value: _model.featureCheckboxValue ??=
                          widget.industry != null
                              ? widget.industry!.featured
                              : false,
                      onChanged: (newValue) async {
                        safeSetState(
                            () => _model.featureCheckboxValue = newValue!);
                      },
                      side: BorderSide(
                        width: 2,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('CREATE_OR_EDIT_INDUSTRY_SaveBtn_ON_TAP');
                    if (widget.edit!) {
                      logFirebaseEvent('SaveBtn_backend_call');

                      await widget.industry!.reference
                          .update(createIndustriesRecordData(
                        name: _model.industryNameTextController.text,
                        featured: _model.featureCheckboxValue,
                      ));
                    } else {
                      logFirebaseEvent('SaveBtn_backend_call');

                      await IndustriesRecord.collection
                          .doc()
                          .set(createIndustriesRecordData(
                            name: _model.industryNameTextController.text,
                            featured: _model.featureCheckboxValue,
                          ));
                    }

                    logFirebaseEvent('SaveBtn_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Dekko',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
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
