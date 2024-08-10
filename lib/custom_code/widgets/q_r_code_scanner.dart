// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({
    Key? key,
    this.width,
    this.height,
    required this.onQrScanned,
    required this.canScan,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() onQrScanned;
  final bool canScan;
  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  MobileScannerController controller = new MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
  );
  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      onDetect: (BarcodeCapture capture) {
        final String? scannedValue = capture.barcodes.first.rawValue;
        if (widget.canScan == true) {
          setState(() {
            FFAppState().code = scannedValue!;
          });
          widget.onQrScanned();
        }
      },
      onDispose: () {
        debugPrint("Barcode scanner disposed!");
      },
      controller: controller,
    );
  }
}
