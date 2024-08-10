import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dang_nhap_widget.dart' show DangNhapWidget;
import 'package:flutter/material.dart';

class DangNhapModel extends FlutterFlowModel<DangNhapWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nhập tên tài khoản!';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nhập mật khẩu!';
    }

    return null;
  }

  // State field(s) for companyCode widget.
  FocusNode? companyCodeFocusNode;
  TextEditingController? companyCodeTextController;
  String? Function(BuildContext, String?)? companyCodeTextControllerValidator;
  String? _companyCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nhập mã công ty!';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Authentication)] action in Button widget.
  ApiCallResponse? authenticationResult;
  bool biometric = false;
  // Stores action output result for [Backend Call - API (Authentication)] action in IconButton widget.
  ApiCallResponse? biometricAuthenticationResult;

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    companyCodeTextControllerValidator = _companyCodeTextControllerValidator;
  }

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    companyCodeFocusNode?.dispose();
    companyCodeTextController?.dispose();
  }
}
