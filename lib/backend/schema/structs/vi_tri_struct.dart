// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ViTriStruct extends BaseStruct {
  ViTriStruct({
    int? gusId,
    String? gusName,
    int? ounId,
    String? ounName,
  })  : _gusId = gusId,
        _gusName = gusName,
        _ounId = ounId,
        _ounName = ounName;

  // "gusId" field.
  int? _gusId;
  int get gusId => _gusId ?? 0;
  set gusId(int? val) => _gusId = val;

  void incrementGusId(int amount) => gusId = gusId + amount;

  bool hasGusId() => _gusId != null;

  // "gusName" field.
  String? _gusName;
  String get gusName => _gusName ?? '';
  set gusName(String? val) => _gusName = val;

  bool hasGusName() => _gusName != null;

  // "ounId" field.
  int? _ounId;
  int get ounId => _ounId ?? 0;
  set ounId(int? val) => _ounId = val;

  void incrementOunId(int amount) => ounId = ounId + amount;

  bool hasOunId() => _ounId != null;

  // "ounName" field.
  String? _ounName;
  String get ounName => _ounName ?? '';
  set ounName(String? val) => _ounName = val;

  bool hasOunName() => _ounName != null;

  static ViTriStruct fromMap(Map<String, dynamic> data) => ViTriStruct(
        gusId: castToType<int>(data['gusId']),
        gusName: data['gusName'] as String?,
        ounId: castToType<int>(data['ounId']),
        ounName: data['ounName'] as String?,
      );

  static ViTriStruct? maybeFromMap(dynamic data) =>
      data is Map ? ViTriStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'gusId': _gusId,
        'gusName': _gusName,
        'ounId': _ounId,
        'ounName': _ounName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gusId': serializeParam(
          _gusId,
          ParamType.int,
        ),
        'gusName': serializeParam(
          _gusName,
          ParamType.String,
        ),
        'ounId': serializeParam(
          _ounId,
          ParamType.int,
        ),
        'ounName': serializeParam(
          _ounName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ViTriStruct fromSerializableMap(Map<String, dynamic> data) =>
      ViTriStruct(
        gusId: deserializeParam(
          data['gusId'],
          ParamType.int,
          false,
        ),
        gusName: deserializeParam(
          data['gusName'],
          ParamType.String,
          false,
        ),
        ounId: deserializeParam(
          data['ounId'],
          ParamType.int,
          false,
        ),
        ounName: deserializeParam(
          data['ounName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ViTriStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ViTriStruct &&
        gusId == other.gusId &&
        gusName == other.gusName &&
        ounId == other.ounId &&
        ounName == other.ounName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([gusId, gusName, ounId, ounName]);
}

ViTriStruct createViTriStruct({
  int? gusId,
  String? gusName,
  int? ounId,
  String? ounName,
}) =>
    ViTriStruct(
      gusId: gusId,
      gusName: gusName,
      ounId: ounId,
      ounName: ounName,
    );
