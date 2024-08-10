import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_q_r_widget.dart' show ScanQRWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ScanQRModel extends FlutterFlowModel<ScanQRWidget> {
  ///  Local state fields for this page.

  bool canScan = true;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
  // Stores action output result for [Backend Call - API (SCAN)] action in QRCodeScanner widget.
  ApiCallResponse? message;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
