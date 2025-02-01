import '/auth/firebase_auth/auth_util.dart';
import '/components/prompt_app_download_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'data_model.dart';
export 'data_model.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({super.key});

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> with TickerProviderStateMixin {
  late DataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'data'});
    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 1420.0.ms,
            duration: 1090.0.ms,
            begin: -2.0,
            end: 2.0,
          ),
        ],
      ),
    });

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
        backgroundColor: const Color(0xFFF4F4F4),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: RefreshIndicator(
              onRefresh: () async {},
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 3.0, 10.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'DATA_PAGE_MY_SHOP_STATS__BTN_ON_TAP');
                            if (!(currentUserEmail != '')) {
                              logFirebaseEvent('Button_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const PromptAppDownloadWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              return;
                            }
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('editstats');
                          },
                          text: 'My shop stats 📊',
                          options: FFButtonOptions(
                            width: 123.0,
                            height: 39.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 1.0,
                            borderSide: const BorderSide(
                              color: Color(0x10585858),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Container(
                        width: 260.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0x43696969),
                            width: 0.2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Combined Sales Analyzed',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.15,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                '\$7,668,000',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.black,
                                  fontSize: 45.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  shadows: [
                                    Shadow(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                      offset: const Offset(1.0, 1.0),
                                      blurRadius: 2.0,
                                    )
                                  ],
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Monthly sales of each shop',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (false)
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 370.0,
                          height: 300.0,
                          decoration: const BoxDecoration(),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 370.0,
                                      height: 280.0,
                                      child: Stack(
                                        children: [
                                          FlutterFlowBarChart(
                                            barData: [
                                              FFBarChartData(
                                                yData: FFAppConstants.Sales,
                                                color: const Color(0xFF25D649),
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              )
                                            ],
                                            xLabels: FFAppConstants.StoreNames,
                                            barWidth: 16.0,
                                            barBorderRadius:
                                                BorderRadius.circular(4.0),
                                            groupSpace: 3.0,
                                            chartStylingInfo: ChartStylingInfo(
                                              enableTooltip: true,
                                              tooltipBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor1,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              showGrid: true,
                                              showBorder: false,
                                            ),
                                            axisBounds: const AxisBounds(),
                                            xAxisLabelInfo: AxisLabelInfo(
                                              title:
                                                  'Average Monthly Sales  (intervals of \$10k)',
                                              titleTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              reservedSize: 20.0,
                                            ),
                                            yAxisLabelInfo: AxisLabelInfo(
                                              showLabels: true,
                                              labelTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                              labelInterval: 10.0,
                                              labelFormatter: LabelFormatter(
                                                numberFormat: (val) =>
                                                    formatNumber(
                                                  val,
                                                  formatType:
                                                      FormatType.compact,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '\$',
                                                ),
                                              ),
                                              reservedSize: 10.0,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, -1.0),
                                            child: FlutterFlowChartLegendWidget(
                                              entries: const [
                                                LegendEntry(Color(0xFF25D649),
                                                    'Individual Shops'),
                                              ],
                                              width: 120.0,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Dekko',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              borderWidth: 1.0,
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              borderColor: const Color(0x70000000),
                                              indicatorSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 36.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Builder(
                                        builder: (_) {
                                          final child = Visibility(
                                            visible: valueOrDefault(
                                                        currentUserDocument
                                                            ?.employees,
                                                        '') ==
                                                    '',
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: 385.0,
                                                height: 290.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: const Color(0x7E201E1E),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(70.0, 110.0,
                                                          70.0, 110.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'DATA_CLICK_TO_ADD_YOUR_OWN_INFO_FIRST_BT');
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                          'editprofile');
                                                    },
                                                    text:
                                                        'Click to add your own info first!',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
                                                      height: 90.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFF3987EF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF3987EF),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                          if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.employees,
                                                      '') ==
                                                  '') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 7.0,
                                                  sigmaY: 10.0,
                                                ),
                                                child: child,
                                              ),
                                            );
                                          }
                                          return child;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 370.0,
                        height: 285.0,
                        decoration: const BoxDecoration(),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            children: [
                              SizedBox(
                                width: 370.0,
                                height: 285.0,
                                child: FlutterFlowBarChart(
                                  barData: const [
                                    FFBarChartData(
                                      yData: FFAppConstants.Sales,
                                      color: Color(0xFF53F852),
                                    )
                                  ],
                                  xLabels: FFAppConstants.StoreNames,
                                  barWidth: 16.0,
                                  barBorderRadius: BorderRadius.circular(4.0),
                                  groupSpace: 8.0,
                                  alignment: BarChartAlignment.spaceAround,
                                  chartStylingInfo: ChartStylingInfo(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    showGrid: true,
                                    showBorder: false,
                                  ),
                                  axisBounds: const AxisBounds(),
                                  xAxisLabelInfo: const AxisLabelInfo(
                                    title:
                                        'Average Monthly Sales (intervals of \$10k)',
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    reservedSize: 28.0,
                                  ),
                                  yAxisLabelInfo: AxisLabelInfo(
                                    showLabels: true,
                                    labelTextStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                    labelInterval: 10.0,
                                    labelFormatter: LabelFormatter(
                                      numberFormat: (val) => formatNumber(
                                        val,
                                        formatType: FormatType.compact,
                                        currency: '\$',
                                      ),
                                    ),
                                    reservedSize: 35.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Builder(
                                    builder: (_) {
                                      final child = Visibility(
                                        visible: valueOrDefault(
                                                    currentUserDocument
                                                        ?.monthlySales,
                                                    '') ==
                                                '',
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: 385.0,
                                            height: 250.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: const Color(0x7E201E1E),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      55.0, 80.0, 55.0, 80.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'DATA_CLICK_TO_ADD_YOUR_SHOP_STATS_FIRST_');
                                                  if (!(currentUserEmail != '')) {
                                                    logFirebaseEvent(
                                                        'Button_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      isDismissible: false,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                const PromptAppDownloadWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    return;
                                                  }
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context
                                                      .pushNamed('editstats');
                                                },
                                                text:
                                                    'Click to add your shop stats first!',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 70.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFF9439EF),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                      if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.monthlySales,
                                                  '') ==
                                              '') {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 7.0,
                                              sigmaY: 10.0,
                                            ),
                                            child: child,
                                          ),
                                        );
                                      }
                                      return child;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (valueOrDefault(currentUserDocument?.monthlySales, '') ==
                            '')
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              'Average Monthly Sales (intervals of \$10k)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    if (valueOrDefault(currentUserDocument?.monthlySales, '') !=
                            '')
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 360.0,
                              height: 34.0,
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Your Monthly Sales:',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                                            lineHeight: 1.15,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          '\$${valueOrDefault(currentUserDocument?.monthlySales, '')}',
                                          '\$0',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 28.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 8.0),
                      child: Container(
                        width: 260.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0x43696969),
                            width: 0.2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Combined Rent Analyzed',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.15,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                '\$600,000+',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.black,
                                  fontSize: 45.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  shadows: [
                                    const Shadow(
                                      color: Color(0xFFFD753A),
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 1.0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          width: 370.0,
                          height: 280.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              if (false)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 5.0,
                                      sigmaY: 5.0,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 230.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text:
                                              'Click to add your own info first!',
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 100.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF3987EF),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            borderSide: const BorderSide(
                                              color: Color(0xFF3987EF),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Screenshot_2024-07-22_at_11.10.32_AM.png',
                                    width: 370.0,
                                    height: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Text(
                                          'Texas',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          width: 370.0,
                          height: 500.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.86,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$8,000 mo @ 2,000 sqft = \$48/sqft',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Text(
                                          'Houston, TX',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.8,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$3,800 mo @ 1,000 sqft = \$45.6/sqft',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 1.0, 0.0, 0.0),
                                            child: Text(
                                              'Los Angeles',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Dekko',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.72,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$3,500 mo @ 1,000 sqft = \$42/sqft',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 0.0, 0.0),
                                          child: Text(
                                            'Los Angeles',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.68,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$4,000 @ 1,250 = \$38.4/sqft',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Text(
                                          'Houston, TX',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.65,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$4,000 @ 1,350 = \$28/sqft + nnn',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Text(
                                          'Waxahachie, TX',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.55,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$5,400 @2,400 = \$27 sqft',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Colorado Springs',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.52,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$2,600 @ 1,450 sqft = \$21.52/sqft',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Holland, MI',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.35,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$4.3k @ 2,400 sqft = \$21.5 sqft',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Colorado Springs',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.35,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$1,500 @ 920 sqft = \$19.56/sqft',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Muskegon, MI',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.35,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$2.5k @ 1,600 sqft = \$18.75sqft',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Grand Haven, MI',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.2,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$6.2k @ 4,500 sqft = \$16.53/sqft',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Text(
                                          'Colorado Springs',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.35,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$2,200 @ 2,200 = \$12/sqft + nnn',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: Text(
                                            'Dallas, TX',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.35,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$1,800 mo @ 2,500 sqft = \$8.64/sqft',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: Text(
                                            'Indiana',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.35,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$2,000 mo @ 3,000 sqft = \$8/sqft',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: Text(
                                            'Indiana',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.35,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFFFF7829),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$1,200 mo @ 4,000 sqft = \$3.6/sqft',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: Text(
                                            'Indiana',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (false)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 5.0,
                                      sigmaY: 5.0,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 230.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text:
                                              'Click to add your own info first!',
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 100.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF3987EF),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            borderSide: const BorderSide(
                                              color: Color(0xFF3987EF),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    Text(
                      'Monthly SqFt \$ of shops',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Container(
                      width: 380.0,
                      height: 515.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.9,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '                                                           \$48/sqft',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Houston, TX',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.84,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '                                           \$45.6/sqft',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 3.0, 1.0, 0.0),
                                        child: Text(
                                          'Los Angeles',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.77,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '                                  \$42/sqft',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Los Angeles',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.71,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '                  \$38.4/sqft',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Houston, TX',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.65,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$28/sqft + nnn',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Waxahachie, TX',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.63,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '      \$27 sqft',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Colorado Springs, CO',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.53,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$21.52/sqft',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Holland, MI',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.52,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$21.5 sqft',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Colorado Springs',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.48,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$19.56/sqft',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Muskegon, Michigan',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.46,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$18.75sqft',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Grand Haven, Michigan',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.42,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$16.53/sqft',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Colorado Springs, CO',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.36,
                                        width: 340.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$12/sqft + nnn',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Joshua, TX',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.37,
                                        width: 270.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$8.64/sqft',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'North Webster, IN',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.37,
                                        width: 250.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$8/sqft',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Warsaw, Indiana',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.29,
                                        width: 160.0,
                                        lineHeight: 28.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor: const Color(0xFFFF7829),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          '\$3.6/sqft',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        barRadius: const Radius.circular(5.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 1.0, 0.0),
                                      child: Text(
                                        'Grabill, Indiana',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'Price per Square Foot (\$)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Builder(
                              builder: (_) {
                                final child = Visibility(
                                  visible: valueOrDefault(
                                              currentUserDocument?.monthlyRent,
                                              '') ==
                                          '',
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 260.0,
                                      height: 85.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'DATA_CLICK_TO_ADD_YOUR_SHOP_STATS_FIRST_');
                                          if (!(currentUserEmail != '')) {
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isDismissible: false,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        const PromptAppDownloadWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            return;
                                          }
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('editstats');
                                        },
                                        text:
                                            'Click to add your shop stats first!',
                                        options: FFButtonOptions(
                                          width: 120.0,
                                          height: 100.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFF9439EF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                  ),
                                );
                                if (valueOrDefault(
                                            currentUserDocument?.monthlyRent,
                                            '') ==
                                        '') {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5.0,
                                        sigmaY: 5.0,
                                      ),
                                      child: child,
                                    ),
                                  );
                                }
                                return child;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (valueOrDefault(currentUserDocument?.monthlyRent, '') ==
                            '')
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              'Price per Square Foot (\$)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    if (valueOrDefault(currentUserDocument?.monthlyRent, '') !=
                            '')
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 360.0,
                              height: 34.0,
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Your SqFt Cost:',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                                            lineHeight: 1.15,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          '\$${valueOrDefault(currentUserDocument?.costPerSqFt, '')}',
                                          '\$0',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 28.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
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
                    if (false)
                      Container(
                        width: 380.0,
                        height: 320.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/US-states-Abbreviation-map.jpg',
                                    width: 380.0,
                                    height: 270.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.44, -0.31),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DATA_PAGE_Icon_5fgarxhn_ON_TAP');
                                    logFirebaseEvent('Icon_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Holland, Michigan'),
                                          content: const Text(
                                              '19,000 Population                   \$1,500/Mo'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.location_pin,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.28, -0.15),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DATA_PAGE_Icon_sd1dp6o0_ON_TAP');
                                    logFirebaseEvent('Icon_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Colorado Spring, CO'),
                                          content: const Text(
                                              '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.location_pin,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.35, -0.16),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DATA_PAGE_Icon_tv6ujbjq_ON_TAP');
                                    logFirebaseEvent('Icon_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Colorado Spring, CO'),
                                          content: const Text(
                                              '250,000 Population  \$1,500/Mo  \$12 / SqFt'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.location_pin,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.52, -0.43),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DATA_PAGE_Icon_ilolgx6o_ON_TAP');
                                    logFirebaseEvent('Icon_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Holland, Michigan'),
                                          content: const Text(
                                              '19,000 Population                   \$1,500/Mo'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.location_pin,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.49, -0.35),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DATA_PAGE_Icon_9iljwofy_ON_TAP');
                                    logFirebaseEvent('Icon_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Holland, Michigan'),
                                          content: const Text(
                                              '19,000 Population                   \$1,500/Mo'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.location_pin,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 10.0),
                      child: Container(
                        width: 300.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0x43696969),
                            width: 0.2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 1.0),
                                child: Text(
                                  'Total Employee Wages Analyzed',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.15,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                '174 Employees',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 380.0,
                      height: 295.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.9,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xF3D22BFB),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '                                                           \$25/hr*',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 1.0, 0.0),
                                          child: Text(
                                            'Holland, MI',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.84,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xF3D22BFB),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '                                           \$20/hr*',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 1.0, 0.0),
                                            child: Text(
                                              'Muskegon, MI',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Dekko',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.84,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xF3D22BFB),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '                                        \$20/hr*',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 1.0, 0.0),
                                          child: Text(
                                            'Colorado Springs',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.71,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xF3D22BFB),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '                  \$16/hr',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 1.0, 0.0),
                                          child: Text(
                                            'Los Angeles',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.67,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xF3D22BFB),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$15/hr',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 1.0, 0.0),
                                          child: Text(
                                            'Grand Haven, MI',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.62,
                                            width: 340.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xF3D22BFB),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$13.65/hr',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 1.0, 0.0),
                                          child: Text(
                                            'Colorado Springs, CO',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.68,
                                            width: 300.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xF3D22BFB),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$13/hr',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 1.0, 0.0),
                                          child: Text(
                                            'Houston, TX',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 3.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            percent: 0.65,
                                            width: 220.0,
                                            lineHeight: 28.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xF3D22BFB),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            center: Text(
                                              '\$9/hr',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            barRadius: const Radius.circular(5.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 1.0, 0.0),
                                          child: Text(
                                            'Dallas, TX',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Hourly Wages by Shop',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) => Builder(
                                builder: (_) {
                                  final child = Visibility(
                                    visible: valueOrDefault(
                                                currentUserDocument?.wages,
                                                '') ==
                                            '',
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 245.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'DATA_CLICK_HERE_TO_ADD_YOUR_STATS_FIRST_');
                                            if (!(currentUserEmail != '')) {
                                              logFirebaseEvent(
                                                  'Button_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          const PromptAppDownloadWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              return;
                                            }
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed('editstats');
                                          },
                                          text:
                                              'Click here to add your stats first',
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 100.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF9439EF),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                    ),
                                  );
                                  if (valueOrDefault(
                                              currentUserDocument?.wages, '') ==
                                          '') {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 5.0,
                                          sigmaY: 5.0,
                                        ),
                                        child: child,
                                      ),
                                    );
                                  }
                                  return child;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (valueOrDefault(currentUserDocument?.wages, '') == '')
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              'Hourly Wages by Shop',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 10.0),
                      child: Container(
                        width: 240.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0x43696969),
                            width: 0.2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                'Point-of-sales\nComparison',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      lineHeight: 1.1,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Container(
                        width: 340.0,
                        height: 275.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/sidewalk_research-74.png',
                                    width: 300.0,
                                    height: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (_) {
                                    final child = Visibility(
                                      visible: valueOrDefault(
                                                  currentUserDocument
                                                      ?.pOSsystem,
                                                  '') ==
                                              '',
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 240.0,
                                          height: 75.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.0),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DATA_CLICK_TO_ADD_YOUR_STATS_FIRST_BTN_O');
                                              if (!(currentUserEmail != '')) {
                                                logFirebaseEvent(
                                                    'Button_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            const PromptAppDownloadWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                return;
                                              }
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed('editstats');
                                            },
                                            text:
                                                'Click to add your stats first',
                                            options: FFButtonOptions(
                                              width: 100.0,
                                              height: 80.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFF3987EF),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      ),
                                    );
                                    if (valueOrDefault(
                                                currentUserDocument?.pOSsystem,
                                                '') ==
                                            '') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 5.0,
                                            sigmaY: 5.0,
                                          ),
                                          child: child,
                                        ),
                                      );
                                    }
                                    return child;
                                  },
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
      ),
    );
  }
}
