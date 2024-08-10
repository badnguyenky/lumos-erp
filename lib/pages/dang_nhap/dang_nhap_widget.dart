import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/bottom_sheet/bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'dang_nhap_model.dart';
export 'dang_nhap_model.dart';

class DangNhapWidget extends StatefulWidget {
  const DangNhapWidget({super.key});

  @override
  State<DangNhapWidget> createState() => _DangNhapWidgetState();
}

class _DangNhapWidgetState extends State<DangNhapWidget> {
  late DangNhapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DangNhapModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.userNameTextController ??= TextEditingController();
    _model.userNameFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.companyCodeTextController ??=
        TextEditingController(text: FFAppState().companyCode);
    _model.companyCodeFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!(isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible))
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 140.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'assets/images/Frame_4_(1).png',
                            ).image,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                      ),
                    ),
                  ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Text(
                              'Chào mừng bạn đến với Lumos Erp. Vui lòng đăng nhập:',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Be Vietnam Pro',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: SizedBox(
                                width: 370.0,
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 16.0),
                                        child: SizedBox(
                                          width: 370.0,
                                          child: TextFormField(
                                            controller:
                                                _model.userNameTextController,
                                            focusNode: _model.userNameFocusNode,
                                            autofocus: true,
                                            autofillHints: const [
                                              AutofillHints.username
                                            ],
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Tên tài khoản',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Be Vietnam Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .userNameTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: SizedBox(
                                          width: 370.0,
                                          child: TextFormField(
                                            controller:
                                                _model.passwordTextController,
                                            focusNode: _model.passwordFocusNode,
                                            autofocus: true,
                                            autofillHints: const [
                                              AutofillHints.password
                                            ],
                                            obscureText:
                                                !_model.passwordVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Mật khẩu',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => _model
                                                          .passwordVisibility =
                                                      !_model
                                                          .passwordVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  _model.passwordVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Be Vietnam Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .passwordTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: SizedBox(
                                          width: 370.0,
                                          child: TextFormField(
                                            controller: _model
                                                .companyCodeTextController,
                                            focusNode:
                                                _model.companyCodeFocusNode,
                                            autofocus: true,
                                            autofillHints: const [
                                              AutofillHints.password
                                            ],
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Mã công ty',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Be Vietnam Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Be Vietnam Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                            minLines: 1,
                                            validator: _model
                                                .companyCodeTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                Function() navigate = () {};
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                _model.authenticationResult =
                                                    await AuthenticationCall
                                                        .call(
                                                  userName: _model
                                                      .userNameTextController
                                                      .text,
                                                  password: _model
                                                      .passwordTextController
                                                      .text,
                                                  companyCode: _model
                                                      .companyCodeTextController
                                                      .text,
                                                );

                                                if ((_model.authenticationResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (AuthenticationCall.token(
                                                        (_model.authenticationResult
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      'null') {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          const Color(0xB2000000),
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                const BottomSheetWidget(
                                                              title:
                                                                  'Thông báo',
                                                              message:
                                                                  'Sai tên tài khoản hoặc mật khẩu!',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
                                                    FFAppState().userName = _model
                                                        .userNameTextController
                                                        .text;
                                                    FFAppState().password = _model
                                                        .passwordTextController
                                                        .text;
                                                    FFAppState().companyCode =
                                                        _model
                                                            .companyCodeTextController
                                                            .text;
                                                    setState(() {});
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    await authManager.signIn(
                                                      authenticationToken:
                                                          AuthenticationCall
                                                              .token(
                                                        (_model.authenticationResult
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      tokenExpiration: functions
                                                          .tokenExpiryTime(),
                                                      authUid:
                                                          FFAppState().userName,
                                                    );
                                                    navigate = () =>
                                                        context.goNamedAuth(
                                                            'ChonNhomQuyen',
                                                            context.mounted);
                                                  }
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        const Color(0xB2000000),
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              const BottomSheetWidget(
                                                            title: 'Thông báo',
                                                            message:
                                                                'Lỗi không xác định!',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }

                                                navigate();

                                                setState(() {});
                                              },
                                              text: 'Đăng nhập',
                                              options: FFButtonOptions(
                                                width: 370.0,
                                                height: 44.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Be Vietnam Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 12.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            disabledIconColor:
                                                const Color(0x4D14181B),
                                            icon: Icon(
                                              FFIcons.ktypetouchId,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 40.0,
                                            ),
                                            onPressed: ((FFAppState().userName ==
                                                            '') ||
                                                    (FFAppState().password ==
                                                            ''))
                                                ? null
                                                : () async {
                                                    var shouldSetState = false;
                                                    Function() navigate =
                                                        () {};
                                                    final localAuth =
                                                        LocalAuthentication();
                                                    bool isBiometricSupported =
                                                        await localAuth
                                                            .isDeviceSupported();

                                                    if (isBiometricSupported) {
                                                      _model.biometric =
                                                          await localAuth
                                                              .authenticate(
                                                                  localizedReason:
                                                                      'Vui lòng xác minh để đăng nhập lại!');
                                                      setState(() {});
                                                    }

                                                    shouldSetState = true;
                                                    if (_model.biometric) {
                                                      _model.biometricAuthenticationResult =
                                                          await AuthenticationCall
                                                              .call(
                                                        userName: FFAppState()
                                                            .userName,
                                                        password: FFAppState()
                                                            .password,
                                                        companyCode:
                                                            FFAppState()
                                                                .companyCode,
                                                      );

                                                      shouldSetState = true;
                                                      if ((_model
                                                              .biometricAuthenticationResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        if (AuthenticationCall
                                                                .token(
                                                              (_model.biometricAuthenticationResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) ==
                                                            'null') {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: const Color(
                                                                0xB2000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      const BottomSheetWidget(
                                                                    title:
                                                                        'Thông báo',
                                                                    message:
                                                                        'Sai tên tài khoản hoặc mật khẩu!',
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        } else {
                                                          FFAppState()
                                                                  .isLoginByBiometric =
                                                              true;
                                                          setState(() {});
                                                          GoRouter.of(context)
                                                              .prepareAuthEvent();
                                                          await authManager
                                                              .signIn(
                                                            authenticationToken:
                                                                AuthenticationCall
                                                                    .token(
                                                              (_model.biometricAuthenticationResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            tokenExpiration:
                                                                functions
                                                                    .tokenExpiryTime(),
                                                            authUid:
                                                                FFAppState()
                                                                    .userName,
                                                          );
                                                          navigate = () =>
                                                              context.goNamedAuth(
                                                                  'ChonNhomQuyen',
                                                                  context
                                                                      .mounted);
                                                        }
                                                      } else {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () =>
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    const BottomSheetWidget(
                                                                  title:
                                                                      'Thông báo',
                                                                  message:
                                                                      'Lỗi không xác định!',
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Thiết bị không hỗ trợ sinh trắc học!',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Be Vietnam Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }

                                                    navigate();
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                  },
                                          ),
                                        ].divide(const SizedBox(width: 30.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 40.0, 12.0, 12.0),
                            child: Text(
                              'https://lumosis.vn',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: const Color(0xFF1C1B24),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ),
                        ),
                      ],
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
