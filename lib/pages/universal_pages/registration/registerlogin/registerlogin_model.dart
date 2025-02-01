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
  TextEditingController? registeremailTextController;
  String? Function(BuildContext, String?)? registeremailTextControllerValidator;
  // State field(s) for registerpassword widget.
  FocusNode? registerpasswordFocusNode;
  TextEditingController? registerpasswordTextController;
  late bool registerpasswordVisibility;
  String? Function(BuildContext, String?)?
      registerpasswordTextControllerValidator;
  // State field(s) for loginEmail widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  // State field(s) for loginpassword widget.
  FocusNode? loginpasswordFocusNode;
  TextEditingController? loginpasswordTextController;
  late bool loginpasswordVisibility;
  String? Function(BuildContext, String?)? loginpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    registerpasswordVisibility = false;
    loginpasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    registeremailFocusNode?.dispose();
    registeremailTextController?.dispose();

    registerpasswordFocusNode?.dispose();
    registerpasswordTextController?.dispose();

    loginEmailFocusNode?.dispose();
    loginEmailTextController?.dispose();

    loginpasswordFocusNode?.dispose();
    loginpasswordTextController?.dispose();
  }
}
