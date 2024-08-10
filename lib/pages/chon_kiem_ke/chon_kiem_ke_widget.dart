import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/kiem_ke/kiem_ke_widget.dart';
import '/components/token_expire/token_expire_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'chon_kiem_ke_model.dart';
export 'chon_kiem_ke_model.dart';

class ChonKiemKeWidget extends StatefulWidget {
  const ChonKiemKeWidget({
    super.key,
    required this.gusId,
    required this.ounId,
  });

  final int? gusId;
  final int? ounId;

  @override
  State<ChonKiemKeWidget> createState() => _ChonKiemKeWidgetState();
}

class _ChonKiemKeWidgetState extends State<ChonKiemKeWidget>
    with TickerProviderStateMixin {
  late ChonKiemKeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChonKiemKeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentAuthTokenExpiration! <= getCurrentTimestamp) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: const Color(0xB2000000),
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
      }
    });

    animationsMap.addAll({
      'kiemKeOnPageLoadAnimation': AnimationInfo(
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Chọn kiểm kê',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Be Vietnam Pro',
                  color: FlutterFlowTheme.of(context).primaryText,
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
          child: FutureBuilder<ApiCallResponse>(
            future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                  ..complete(PihListCall.call(
                    token: currentAuthenticationToken,
                    gusId: widget.gusId,
                    ounId: widget.ounId,
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
              final listViewPihListResponse = snapshot.data!;

              return Builder(
                builder: (context) {
                  final listKiemKe = functions
                          .pihToList(listViewPihListResponse.jsonBody)
                          ?.toList() ??
                      [];
                  if (listKiemKe.isEmpty) {
                    return const EmptyListWidget(
                      title: 'Thông báo',
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() => _model.apiRequestCompleter = null);
                      await _model.waitForApiRequestCompleted();
                    },
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        16.0,
                        0,
                        16.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: listKiemKe.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                      itemBuilder: (context, listKiemKeIndex) {
                        final listKiemKeItem = listKiemKe[listKiemKeIndex];
                        return Builder(
                          builder: (context) {
                            if ((String var1) {
                              return var1 == "null";
                            }((listKiemKeItem.toMap()).toString())) {
                              return TokenExpireWidget(
                                key: Key(
                                    'Keyq3s_${listKiemKeIndex}_of_${listKiemKe.length}'),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'ChiTietKiemKe',
                                      queryParameters: {
                                        'stoName': serializeParam(
                                          listKiemKeItem.stoName,
                                          ParamType.String,
                                        ),
                                        'inventoryDate': serializeParam(
                                          listKiemKeItem.inventoryDate,
                                          ParamType.String,
                                        ),
                                        'description': serializeParam(
                                          listKiemKeItem.description,
                                          ParamType.String,
                                        ),
                                        'gusId': serializeParam(
                                          widget.gusId,
                                          ParamType.int,
                                        ),
                                        'ounId': serializeParam(
                                          widget.ounId,
                                          ParamType.int,
                                        ),
                                        'pihId': serializeParam(
                                          listKiemKeItem.pihId,
                                          ParamType.int,
                                        ),
                                        'pihNumber': serializeParam(
                                          listKiemKeItem.pihNumber,
                                          ParamType.String,
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
                                  child: Hero(
                                    tag: 'kiemKe',
                                    transitionOnUserGestures: true,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: KiemKeWidget(
                                        key: Key(
                                            'Keygbl_${listKiemKeIndex}_of_${listKiemKe.length}'),
                                        kiemKe: listKiemKeItem,
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(
                                  animationsMap['kiemKeOnPageLoadAnimation']!,
                                  effects: [
                                    FadeEffect(
                                      curve: Curves.easeInOut,
                                      delay: 0.0.ms,
                                      duration: 400.0.ms,
                                      begin: 0.0,
                                      end: 1.0,
                                    ),
                                    MoveEffect(
                                      curve: Curves.easeInOut,
                                      delay: 0.0.ms,
                                      duration: 400.0.ms,
                                      begin: const Offset(-10.0, 0.0),
                                      end: const Offset(0.0, 0.0),
                                    ),
                                  ],
                                ),
                              );
                            }
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
    );
  }
}
