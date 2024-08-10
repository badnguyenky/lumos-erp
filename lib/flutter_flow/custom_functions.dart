import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

DateTime tokenExpiryTime() {
  DateTime currentTime = DateTime.now();

  // Increase the current time by 12 hours
  DateTime expireTime = currentTime.add(Duration(hours: 12));
  return expireTime;
}

List<MenuStruct> menuToList(dynamic jsonString) {
  List<MenuStruct> result = [];
  List<Map<String, dynamic>> jsonList = List.from(jsonString);
  for (var jsonItem in jsonList) {
    MenuStruct menu = MenuStruct(
      menuId: jsonItem['men_id'],
      module: jsonItem['module'],
      menuName: jsonItem['men_name'],
      iconCode: jsonItem['icon_code'],
      iconGroup: jsonItem['icon_group'],
    );
    result.add(menu);
  }
  return result;
}

List<KiemKeStruct>? pihToList(dynamic jsonString) {
  if (jsonString == null) return null;
  List<KiemKeStruct> result = [];
  if (jsonString == "null") return result;
  List<Map<String, dynamic>> jsonList = List.from(jsonString);
  for (var jsonItem in jsonList) {
    KiemKeStruct kk = KiemKeStruct(
      pihId: jsonItem['pih_id'],
      createDate: jsonItem['create_date'],
      createdBy: jsonItem['created_by'],
      pihNumber: jsonItem['pih_number'],
      inventoryDate: jsonItem['inventory_date'],
      stoName: jsonItem['sto_name'],
      description: jsonItem['description'],
    );
    result.add(kk);
  }
  return result;
}

List<SanPhamStruct>? spToList(dynamic jsonString) {
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
  return result;
}

List<ViTriStruct>? gusToList(dynamic jsonString) {
  if (jsonString == null) return null;
  List<ViTriStruct> result = [];
  List<Map<String, dynamic>> jsonList = List.from(jsonString);
  for (var jsonItem in jsonList) {
    ViTriStruct viTri = ViTriStruct(
      gusId: jsonItem['gus_id'],
      gusName: jsonItem['gus_name'],
      ounId: jsonItem['oun_id'],
      ounName: jsonItem['oun_name'],
    );
    result.add(viTri);
  }
  return result;
}

bool checkToken(String? token) {
  if (token == null || token.isEmpty) {
    return false;
  }
  return true;
}
