// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SanPhamStruct extends BaseStruct {
  SanPhamStruct({
    String? maSP,
    String? tenSP,
    String? maLot,
    String? dvt,
    int? slChungTu,
    int? slKiemKe,
    int? diff,
    String? viTri,
  })  : _maSP = maSP,
        _tenSP = tenSP,
        _maLot = maLot,
        _dvt = dvt,
        _slChungTu = slChungTu,
        _slKiemKe = slKiemKe,
        _diff = diff,
        _viTri = viTri;

  // "maSP" field.
  String? _maSP;
  String get maSP => _maSP ?? '';
  set maSP(String? val) => _maSP = val;

  bool hasMaSP() => _maSP != null;

  // "tenSP" field.
  String? _tenSP;
  String get tenSP => _tenSP ?? '';
  set tenSP(String? val) => _tenSP = val;

  bool hasTenSP() => _tenSP != null;

  // "maLot" field.
  String? _maLot;
  String get maLot => _maLot ?? '';
  set maLot(String? val) => _maLot = val;

  bool hasMaLot() => _maLot != null;

  // "DVT" field.
  String? _dvt;
  String get dvt => _dvt ?? '';
  set dvt(String? val) => _dvt = val;

  bool hasDvt() => _dvt != null;

  // "slChungTu" field.
  int? _slChungTu;
  int get slChungTu => _slChungTu ?? 0;
  set slChungTu(int? val) => _slChungTu = val;

  void incrementSlChungTu(int amount) => slChungTu = slChungTu + amount;

  bool hasSlChungTu() => _slChungTu != null;

  // "slKiemKe" field.
  int? _slKiemKe;
  int get slKiemKe => _slKiemKe ?? 0;
  set slKiemKe(int? val) => _slKiemKe = val;

  void incrementSlKiemKe(int amount) => slKiemKe = slKiemKe + amount;

  bool hasSlKiemKe() => _slKiemKe != null;

  // "diff" field.
  int? _diff;
  int get diff => _diff ?? 0;
  set diff(int? val) => _diff = val;

  void incrementDiff(int amount) => diff = diff + amount;

  bool hasDiff() => _diff != null;

  // "viTri" field.
  String? _viTri;
  String get viTri => _viTri ?? '';
  set viTri(String? val) => _viTri = val;

  bool hasViTri() => _viTri != null;

  static SanPhamStruct fromMap(Map<String, dynamic> data) => SanPhamStruct(
        maSP: data['maSP'] as String?,
        tenSP: data['tenSP'] as String?,
        maLot: data['maLot'] as String?,
        dvt: data['DVT'] as String?,
        slChungTu: castToType<int>(data['slChungTu']),
        slKiemKe: castToType<int>(data['slKiemKe']),
        diff: castToType<int>(data['diff']),
        viTri: data['viTri'] as String?,
      );

  static SanPhamStruct? maybeFromMap(dynamic data) =>
      data is Map ? SanPhamStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'maSP': _maSP,
        'tenSP': _tenSP,
        'maLot': _maLot,
        'DVT': _dvt,
        'slChungTu': _slChungTu,
        'slKiemKe': _slKiemKe,
        'diff': _diff,
        'viTri': _viTri,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'maSP': serializeParam(
          _maSP,
          ParamType.String,
        ),
        'tenSP': serializeParam(
          _tenSP,
          ParamType.String,
        ),
        'maLot': serializeParam(
          _maLot,
          ParamType.String,
        ),
        'DVT': serializeParam(
          _dvt,
          ParamType.String,
        ),
        'slChungTu': serializeParam(
          _slChungTu,
          ParamType.int,
        ),
        'slKiemKe': serializeParam(
          _slKiemKe,
          ParamType.int,
        ),
        'diff': serializeParam(
          _diff,
          ParamType.int,
        ),
        'viTri': serializeParam(
          _viTri,
          ParamType.String,
        ),
      }.withoutNulls;

  static SanPhamStruct fromSerializableMap(Map<String, dynamic> data) =>
      SanPhamStruct(
        maSP: deserializeParam(
          data['maSP'],
          ParamType.String,
          false,
        ),
        tenSP: deserializeParam(
          data['tenSP'],
          ParamType.String,
          false,
        ),
        maLot: deserializeParam(
          data['maLot'],
          ParamType.String,
          false,
        ),
        dvt: deserializeParam(
          data['DVT'],
          ParamType.String,
          false,
        ),
        slChungTu: deserializeParam(
          data['slChungTu'],
          ParamType.int,
          false,
        ),
        slKiemKe: deserializeParam(
          data['slKiemKe'],
          ParamType.int,
          false,
        ),
        diff: deserializeParam(
          data['diff'],
          ParamType.int,
          false,
        ),
        viTri: deserializeParam(
          data['viTri'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SanPhamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SanPhamStruct &&
        maSP == other.maSP &&
        tenSP == other.tenSP &&
        maLot == other.maLot &&
        dvt == other.dvt &&
        slChungTu == other.slChungTu &&
        slKiemKe == other.slKiemKe &&
        diff == other.diff &&
        viTri == other.viTri;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([maSP, tenSP, maLot, dvt, slChungTu, slKiemKe, diff, viTri]);
}

SanPhamStruct createSanPhamStruct({
  String? maSP,
  String? tenSP,
  String? maLot,
  String? dvt,
  int? slChungTu,
  int? slKiemKe,
  int? diff,
  String? viTri,
}) =>
    SanPhamStruct(
      maSP: maSP,
      tenSP: tenSP,
      maLot: maLot,
      dvt: dvt,
      slChungTu: slChungTu,
      slKiemKe: slKiemKe,
      diff: diff,
      viTri: viTri,
    );
