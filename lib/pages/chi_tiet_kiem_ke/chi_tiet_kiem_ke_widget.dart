import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/chi_tiet_k_k/chi_tiet_k_k_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/san_pham/san_pham_widget.dart';
import '/components/token_expire/token_expire_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'chi_tiet_kiem_ke_model.dart';
export 'chi_tiet_kiem_ke_model.dart';

class ChiTietKiemKeWidget extends StatefulWidget {
  const ChiTietKiemKeWidget({
    super.key,
    required this.stoName,
    required this.inventoryDate,
    required this.description,
    required this.gusId,
    required this.ounId,
    required this.pihId,
    required this.pihNumber,
  });

  final String? stoName;
  final String? inventoryDate;
  final String? description;
  final int? gusId;
  final int? ounId;
  final int? pihId;
  final String? pihNumber;

  @override
  State<ChiTietKiemKeWidget> createState() => _ChiTietKiemKeWidgetState();
}

class _ChiTietKiemKeWidgetState extends State<ChiTietKiemKeWidget>
    with TickerProviderStateMixin {
  late ChiTietKiemKeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChiTietKiemKeModel());

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
      } else {
        _model.response = await CheckKkCall.call(
          token: currentAuthenticationToken,
          gusId: widget.gusId,
          ounId: widget.ounId,
          pihId: widget.pihId,
        );

        _model.spList = functions
            .spToList((_model.response?.jsonBody ?? ''))!
            .toList()
            .cast<SanPhamStruct>();
        _model.loading = false;
        setState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'sanPhamOnPageLoadAnimation': AnimationInfo(
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
            'Chi tiết kiểm kê',
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: wrapWithModel(
                        model: _model.chiTietKKModel,
                        updateCallback: () => setState(() {}),
                        child: Hero(
                          tag: 'kiemKe',
                          transitionOnUserGestures: true,
                          child: Material(
                            color: Colors.transparent,
                            child: ChiTietKKWidget(
                              kiemKe: KiemKeStruct(
                                pihId: widget.pihId,
                                pihNumber: widget.pihNumber,
                                inventoryDate: widget.inventoryDate,
                                stoName: widget.stoName,
                                description: widget.description,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sản phẩm',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Be Vietnam Pro',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFE9EBED),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            const Duration(milliseconds: 200),
                                            () async {
                                              _model.searchList =
                                                  await actions.searchSanPham(
                                                (_model.response?.jsonBody ??
                                                    ''),
                                                _model.textController.text,
                                              );
                                              _model.spList = _model.searchList!
                                                  .toList()
                                                  .cast<SanPhamStruct>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Be Vietnam Pro',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Icon(
                                        FFIcons.ksearch,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ]
                                        .divide(const SizedBox(width: 8.0))
                                        .addToStart(const SizedBox(width: 16.0))
                                        .addToEnd(const SizedBox(width: 16.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      if (!_model.loading) {
                                        return Builder(
                                          builder: (context) {
                                            final listSanPham =
                                                _model.spList.toList();
                                            if (listSanPham.isEmpty) {
                                              return const Center(
                                                child: EmptyListWidget(
                                                  title:
                                                      'Không tìm thấy sản phẩm nào',
                                                ),
                                              );
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listSanPham.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 16.0),
                                              itemBuilder:
                                                  (context, listSanPhamIndex) {
                                                final listSanPhamItem =
                                                    listSanPham[
                                                        listSanPhamIndex];
                                                return Builder(
                                                  builder: (context) {
                                                    return SanPhamWidget(
                                                      key: Key(
                                                          'Keya2e_${listSanPhamIndex}_of_${listSanPham.length}'),
                                                      sanPham:
                                                          listSanPhamItem,
                                                    ).animateOnPageLoad(
                                                      animationsMap[
                                                          'sanPhamOnPageLoadAnimation']!,
                                                      effects: [
                                                        FadeEffect(
                                                          curve: Curves
                                                              .easeInOut,
                                                          delay: 0.0.ms,
                                                          duration: 400.0.ms,
                                                          begin: 0.0,
                                                          end: 1.0,
                                                        ),
                                                        MoveEffect(
                                                          curve: Curves
                                                              .easeInOut,
                                                          delay: 0.0.ms,
                                                          duration: 400.0.ms,
                                                          begin: const Offset(
                                                              -10.0, 0.0),
                                                          end: const Offset(
                                                              0.0, 0.0),
                                                        ),
                                                      ],
                                                    );
                                                                                                    },
                                                );
                                              },
                                            );
                                          },
                                        );
                                      } else {
                                        return const SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: custom_widgets.CircleLoading(
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ].divide(const SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'ScanQR',
                        queryParameters: {
                          'gusId': serializeParam(
                            widget.gusId,
                            ParamType.int,
                          ),
                          'ounId': serializeParam(
                            widget.ounId,
                            ParamType.int,
                          ),
                          'pihId': serializeParam(
                            widget.pihId,
                            ParamType.int,
                          ),
                          'stoName': serializeParam(
                            widget.stoName,
                            ParamType.String,
                          ),
                          'description': serializeParam(
                            widget.description,
                            ParamType.String,
                          ),
                          'inventoryDate': serializeParam(
                            widget.inventoryDate,
                            ParamType.String,
                          ),
                          'pihNumber': serializeParam(
                            widget.pihNumber,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primary,
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          FFIcons.kscanqr,
                          color: FlutterFlowTheme.of(context).info,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
