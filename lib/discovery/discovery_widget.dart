import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'discovery_model.dart';
export 'discovery_model.dart';

class DiscoveryWidget extends StatefulWidget {
  const DiscoveryWidget({super.key});

  @override
  State<DiscoveryWidget> createState() => _DiscoveryWidgetState();
}

class _DiscoveryWidgetState extends State<DiscoveryWidget> {
  late DiscoveryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscoveryModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Discovery'});
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
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: custom_widgets.DiscoveryPage(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
