import '/flutter_flow/flutter_flow_util.dart';
import 'registerlogin_widget.dart' show RegisterloginWidget;
import 'package:flutter/material.dart';

class RegisterloginModel extends FlutterFlowModel<RegisterloginWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for registeremail widget.
  FocusNode? registeremailFocusNode;
  TextEditingController? registeremailController;
  String? Function(BuildContext, String?)? registeremailControllerValidator;
  // State field(s) for registerpassword widget.
  FocusNode? registerpasswordFocusNode;
  TextEditingController? registerpasswordController;
  late bool registerpasswordVisibility;
  String? Function(BuildContext, String?)? registerpasswordControllerValidator;
  // State field(s) for loginEmail widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailController;
  String? Function(BuildContext, String?)? loginEmailControllerValidator;
  // State field(s) for loginpassword widget.
  FocusNode? loginpasswordFocusNode;
  TextEditingController? loginpasswordController;
  late bool loginpasswordVisibility;
  String? Function(BuildContext, String?)? loginpasswordControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    registerpasswordVisibility = false;
    loginpasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    registeremailFocusNode?.dispose();
    registeremailController?.dispose();

    registerpasswordFocusNode?.dispose();
    registerpasswordController?.dispose();

    loginEmailFocusNode?.dispose();
    loginEmailController?.dispose();

    loginpasswordFocusNode?.dispose();
    loginpasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
