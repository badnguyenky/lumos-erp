// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<SanPhamStruct>?> searchSanPham(
    dynamic jsonString, String? searchText) async {
  if (jsonString == null) return null;
  List<SanPhamStruct> result = [];
  List<Map<String, dynamic>> jsonList = List.from(jsonString);
  for (var jsonItem in jsonList) {
    SanPhamStruct sp = SanPhamStruct(
      maSP: jsonItem['iit_code'],
      tenSP: jsonItem['iit_name'],
      maLot: jsonItem['ilo_number'],
      dvt: jsonItem['uom_name'],
      slChungTu: jsonItem['doc_quantity'],
      slKiemKe: jsonItem['inventory_quantity'],
      diff: jsonItem['diff'],
      viTri: jsonItem['sar_name'],
    );
    result.add(sp);
  }
  if (searchText == null) return result;

  return result
      .where((element) =>
          (element.maSP.toLowerCase().contains(searchText.toLowerCase()) ||
              element.tenSP.toLowerCase().contains(searchText.toLowerCase())))
      .toList();
  // Add your function code here!
}
