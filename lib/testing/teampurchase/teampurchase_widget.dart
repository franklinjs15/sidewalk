import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'teampurchase_model.dart';
export 'teampurchase_model.dart';

class TeampurchaseWidget extends StatefulWidget {
  const TeampurchaseWidget({super.key});

  @override
  State<TeampurchaseWidget> createState() => _TeampurchaseWidgetState();
}

class _TeampurchaseWidgetState extends State<TeampurchaseWidget> {
  late TeampurchaseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeampurchaseModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'teampurchase'});
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

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
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=500&h=500',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: TextFormField(
                  controller: _model.textController4,
                  focusNode: _model.textFieldFocusNode4,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Dekko',
                              letterSpacing: 0.0,
                            ),
                    hintText: 'Search',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Dekko',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Dekko',
                        letterSpacing: 0.0,
                      ),
                  validator:
                      _model.textController4Validator.asValidator(context),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.chat_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1675347203088-351703ffbe7b?w=500&h=500',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Will Hobick',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Growth @ FlutterFlow',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '2h',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 6.0, 0.0),
                                          child: Text(
                                            '•',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.globeAmericas,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 12.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.ellipsisH,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Text(
                              'This is random post data...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Dekko',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '12 likes',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Dekko',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '2 comments',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 6.0, 0.0),
                                      child: Text(
                                        '•',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '5 resposts',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 24.0,
                            thickness: 1.0,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 3.0, 0.0),
                                        child: Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=500&h=500',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.thumb_up_off_alt,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Like',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Comment',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.sync_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Repost',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.send_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Send',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 35.0,
                                    height: 35.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1529154856870-24c2137edce6?w=500&h=500',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      focusNode: _model.textFieldFocusNode1,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            'Leave your thoughts here...',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                      minLines: 1,
                                      validator: _model.textController1Validator
                                          .asValidator(context),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1599751449455-a09b9bc72a4a?w=500&h=500',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Will Hobick',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Growth @ FlutterFlow',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '2h',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 6.0, 0.0),
                                          child: Text(
                                            '•',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.globeAmericas,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 12.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.ellipsisH,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Text(
                              '3X Syrup pallets',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                'https://lot.dhl.com/wp-content/uploads/2019/05/res_shutterstock_1016714740-800x420.jpg',
                                width: double.infinity,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '12 likes',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Dekko',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '2 comments',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 6.0, 0.0),
                                      child: Text(
                                        '•',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '5 resposts',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 24.0,
                            thickness: 1.0,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 3.0, 0.0),
                                        child: Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1599231092464-92e569eccdf0?w=500&h=500',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.thumb_up_off_alt,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Like',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Comment',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.sync_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Repost',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.send_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Send',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 35.0,
                                    height: 35.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1548600983-a171dced97f5?w=500&h=500',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            'Leave your thoughts here...',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model.textController2Validator
                                          .asValidator(context),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1685640205903-6c6009b09596?w=500&h=500',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Will Hobick',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Growth @ FlutterFlow',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '2h',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 6.0, 0.0),
                                          child: Text(
                                            '•',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Dekko',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.globeAmericas,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 12.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.ellipsisH,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Text(
                              '100 Rolls of Cottenelle',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  child: Image.network(
                                    'https://i5.walmartimages.com/seo/Cottonelle-Professional-Bulk-Toilet-Paper-for-Business-17713-Standard-Toilet-Paper-Rolls-2-PLY-White-60-Rolls-per-Case-451-Sheets-per-Roll_13ffca25-a99e-4855-8fd6-0baca0a0cf1e.3560a9c02beb712832b7a695abc0e7ee.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
                                    width: double.infinity,
                                    height: 280.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Schedule a demo today!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: Text(
                                          'corporatecompany.com',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Dekko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '12 likes',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Dekko',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '2 comments',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 6.0, 0.0),
                                      child: Text(
                                        '•',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '5 resposts',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 24.0,
                            thickness: 1.0,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 3.0, 0.0),
                                        child: Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1511806754518-53bada35f930?w=500&h=500',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.thumb_up_off_alt,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Like',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.insert_comment_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Comment',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.sync_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Repost',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.send_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    Text(
                                      'Send',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 35.0,
                                    height: 35.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1714617006524-13c7bf829893?w=500&h=500',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController3,
                                      focusNode: _model.textFieldFocusNode3,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            'Leave your thoughts here...',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Dekko',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Dekko',
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model.textController3Validator
                                          .asValidator(context),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
