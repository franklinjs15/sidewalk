import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_of_industries_model.dart';
export 'list_of_industries_model.dart';

class ListOfIndustriesWidget extends StatefulWidget {
  const ListOfIndustriesWidget({super.key});

  @override
  State<ListOfIndustriesWidget> createState() => _ListOfIndustriesWidgetState();
}

class _ListOfIndustriesWidgetState extends State<ListOfIndustriesWidget> {
  late ListOfIndustriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfIndustriesModel());

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
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Industries',
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
                          'LIST_OF_INDUSTRIES_Icon_cjz1acmw_ON_TAP');
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
              StreamBuilder<List<IndustriesRecord>>(
                stream: queryIndustriesRecord(),
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
                  List<IndustriesRecord> listViewIndustriesRecordList =
                      snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewIndustriesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewIndustriesRecord =
                          listViewIndustriesRecordList[listViewIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'LIST_OF_INDUSTRIES_Container_q2bzuxmq_ON');
                            logFirebaseEvent('Container_bottom_sheet');
                            Navigator.pop(context, listViewIndustriesRecord);
                          },
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: const Color(0x4739D2C0),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 5.0, 10.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      listViewIndustriesRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Dekko',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Featured',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValueMap[
                                                  listViewIndustriesRecord] ??=
                                              listViewIndustriesRecord.featured,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                        .checkboxValueMap[
                                                    listViewIndustriesRecord] =
                                                newValue!);
                                          },
                                          side: BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
