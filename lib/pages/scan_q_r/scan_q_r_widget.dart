import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/bottom_sheet/bottom_sheet_widget.dart';
import '/components/token_expire/token_expire_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'scan_q_r_model.dart';
export 'scan_q_r_model.dart';

class ScanQRWidget extends StatefulWidget {
  const ScanQRWidget({
    super.key,
    required this.gusId,
    required this.ounId,
    required this.pihId,
    required this.stoName,
    required this.description,
    required this.inventoryDate,
    required this.pihNumber,
  });

  final int? gusId;
  final int? ounId;
  final int? pihId;
  final String? stoName;
  final String? description;
  final String? inventoryDate;
  final String? pihNumber;

  @override
  State<ScanQRWidget> createState() => _ScanQRWidgetState();
}

class _ScanQRWidgetState extends State<ScanQRWidget> {
  late ScanQRModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanQRModel());

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
            'Scan QR',
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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.QRCodeScanner(
              width: double.infinity,
              height: double.infinity,
              canScan: _model.canScan,
              onQrScanned: () async {
                var shouldSetState = false;
                _model.canScan = false;
                setState(() {});
                _model.soundPlayer ??= AudioPlayer();
                if (_model.soundPlayer!.playing) {
                  await _model.soundPlayer!.stop();
                }
                _model.soundPlayer!.setVolume(1.0);
                _model.soundPlayer!
                    .setAsset('assets/audios/scanner-beep.wav')
                    .then((_) => _model.soundPlayer!.play());

                _model.message = await ScanCall.call(
                  token: currentAuthenticationToken,
                  gusId: widget.gusId,
                  ounId: widget.ounId,
                  pihId: widget.pihId,
                  scanCode: FFAppState().code,
                );

                shouldSetState = true;
                if ((_model.message?.succeeded ?? true)) {
                  if (ScanCall.message(
                        (_model.message?.jsonBody ?? ''),
                      ) !=
                      null) {
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
                            child: BottomSheetWidget(
                              title: 'Kết quả scan',
                              message: ScanCall.message(
                                (_model.message?.jsonBody ?? ''),
                              ).toString(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  } else {
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

                    if (shouldSetState) setState(() {});
                    return;
                  }
                } else {
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
                          child: BottomSheetWidget(
                            title: 'Lỗi',
                            message:
                                'Code: ${(_model.message?.statusCode ?? 200).toString()}',
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                }

                _model.canScan = true;
                setState(() {});
                if (shouldSetState) setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
