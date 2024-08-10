import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/token_expire/token_expire_widget.dart';
import '/components/vi_tri/vi_tri_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'chon_nhom_quyen_model.dart';
export 'chon_nhom_quyen_model.dart';

class ChonNhomQuyenWidget extends StatefulWidget {
  const ChonNhomQuyenWidget({super.key});

  @override
  State<ChonNhomQuyenWidget> createState() => _ChonNhomQuyenWidgetState();
}

class _ChonNhomQuyenWidgetState extends State<ChonNhomQuyenWidget>
    with TickerProviderStateMixin {
  late ChonNhomQuyenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChonNhomQuyenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() navigate = () {};
      if (currentAuthTokenExpiration! <= getCurrentTimestamp) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: const Color(0x000000B2),
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const TokenExpireWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        return;
      } else {
        if (FFAppState().isLoginByBiometric) {
          FFAppState().isLoginByBiometric = false;
          setState(() {});
          return;
        } else {
          final localAuth = LocalAuthentication();
          bool isBiometricSupported = await localAuth.isDeviceSupported();

          if (isBiometricSupported) {
            _model.biometric = await localAuth.authenticate(
                localizedReason:
                    'Vui lòng xác minh để tiếp tục sử dụng ứng dụng!');
            setState(() {});
          }

          if (_model.biometric) {
            if (_model.isCancelBiometric) {
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();

              navigate =
                  () => context.goNamedAuth('DangNhap', context.mounted);

              navigate();
              return;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Xác minh  thành công!',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Be Vietnam Pro',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                  ),
                  duration: const Duration(milliseconds: 2000),
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                ),
              );
              return;
            }
          } else {
            _model.isCancelBiometric = true;
            setState(() {});
            return;
          }
        }
      }

      navigate();
    });

    animationsMap.addAll({
      'viTriOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Chọn nhóm quyền',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<ApiCallResponse>(
              future:
                  (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(GusListCall.call(
                          token: currentAuthenticationToken,
                        )))
                      .future,
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final listViewGusListResponse = snapshot.data!;

                return Builder(
                  builder: (context) {
                    final listViTri = functions
                            .gusToList(listViewGusListResponse.jsonBody)
                            ?.toList() ??
                        [];
                    if (listViTri.isEmpty) {
                      return const TokenExpireWidget();
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      },
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViTri.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                        itemBuilder: (context, listViTriIndex) {
                          final listViTriItem = listViTri[listViTriIndex];
                          return Builder(
                            builder: (context) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'ChonChucNang',
                                    queryParameters: {
                                      'gusId': serializeParam(
                                        listViTriItem.gusId,
                                        ParamType.int,
                                      ),
                                      'ounId': serializeParam(
                                        listViTriItem.ounId,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: ViTriWidget(
                                  key: Key(
                                      'Key8r6_${listViTriIndex}_of_${listViTri.length}'),
                                  gusName: listViTriItem.gusName,
                                  ounName: listViTriItem.ounName,
                                ),
                              ).animateOnPageLoad(
                                animationsMap['viTriOnPageLoadAnimation']!,
                                effects: [
                                  MoveEffect(
                                    curve: Curves.easeInOut,
                                    delay: 0.0.ms,
                                    duration: 600.0.ms,
                                    begin: const Offset(0.0, 0.0),
                                    end: const Offset(0.0, 0.0),
                                  ),
                                  FadeEffect(
                                    curve: Curves.easeInOut,
                                    delay: 0.0.ms,
                                    duration: 600.0.ms,
                                    begin: 0.0,
                                    end: 1.0,
                                  ),
                                ],
                              );
                                                        },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
