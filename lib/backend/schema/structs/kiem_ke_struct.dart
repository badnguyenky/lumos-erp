// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KiemKeStruct extends BaseStruct {
  KiemKeStruct({
    int? pihId,
    String? createDate,
    String? createdBy,
    String? pihNumber,
    String? inventoryDate,
    String? stoName,
    String? description,
  })  : _pihId = pihId,
        _createDate = createDate,
        _createdBy = createdBy,
        _pihNumber = pihNumber,
        _inventoryDate = inventoryDate,
        _stoName = stoName,
        _description = description;

  // "pihId" field.
  int? _pihId;
  int get pihId => _pihId ?? 0;
  set pihId(int? val) => _pihId = val;

  void incrementPihId(int amount) => pihId = pihId + amount;

  bool hasPihId() => _pihId != null;

  // "createDate" field.
  String? _createDate;
  String get createDate => _createDate ?? '';
  set createDate(String? val) => _createDate = val;

  bool hasCreateDate() => _createDate != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "pihNumber" field.
  String? _pihNumber;
  String get pihNumber => _pihNumber ?? '';
  set pihNumber(String? val) => _pihNumber = val;

  bool hasPihNumber() => _pihNumber != null;

  // "inventoryDate" field.
  String? _inventoryDate;
  String get inventoryDate => _inventoryDate ?? '';
  set inventoryDate(String? val) => _inventoryDate = val;

  bool hasInventoryDate() => _inventoryDate != null;

  // "stoName" field.
  String? _stoName;
  String get stoName => _stoName ?? '';
  set stoName(String? val) => _stoName = val;

  bool hasStoName() => _stoName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static KiemKeStruct fromMap(Map<String, dynamic> data) => KiemKeStruct(
        pihId: castToType<int>(data['pihId']),
        createDate: data['createDate'] as String?,
        createdBy: data['createdBy'] as String?,
        pihNumber: data['pihNumber'] as String?,
        inventoryDate: data['inventoryDate'] as String?,
        stoName: data['stoName'] as String?,
        description: data['description'] as String?,
      );

  static KiemKeStruct? maybeFromMap(dynamic data) =>
      data is Map ? KiemKeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pihId': _pihId,
        'createDate': _createDate,
        'createdBy': _createdBy,
        'pihNumber': _pihNumber,
        'inventoryDate': _inventoryDate,
        'stoName': _stoName,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pihId': serializeParam(
          _pihId,
          ParamType.int,
        ),
        'createDate': serializeParam(
          _createDate,
          ParamType.String,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'pihNumber': serializeParam(
          _pihNumber,
          ParamType.String,
        ),
        'inventoryDate': serializeParam(
          _inventoryDate,
          ParamType.String,
        ),
        'stoName': serializeParam(
          _stoName,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static KiemKeStruct fromSerializableMap(Map<String, dynamic> data) =>
      KiemKeStruct(
        pihId: deserializeParam(
          data['pihId'],
          ParamType.int,
          false,
        ),
        createDate: deserializeParam(
          data['createDate'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.String,
          false,
        ),
        pihNumber: deserializeParam(
          data['pihNumber'],
          ParamType.String,
          false,
        ),
        inventoryDate: deserializeParam(
          data['inventoryDate'],
          ParamType.String,
          false,
        ),
        stoName: deserializeParam(
          data['stoName'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'KiemKeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is KiemKeStruct &&
        pihId == other.pihId &&
        createDate == other.createDate &&
        createdBy == other.createdBy &&
        pihNumber == other.pihNumber &&
        inventoryDate == other.inventoryDate &&
        stoName == other.stoName &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([
        pihId,
        createDate,
        createdBy,
        pihNumber,
        inventoryDate,
        stoName,
        description
      ]);
}

KiemKeStruct createKiemKeStruct({
  int? pihId,
  String? createDate,
  String? createdBy,
  String? pihNumber,
  String? inventoryDate,
  String? stoName,
  String? description,
}) =>
    KiemKeStruct(
      pihId: pihId,
      createDate: createDate,
      createdBy: createdBy,
      pihNumber: pihNumber,
      inventoryDate: inventoryDate,
      stoName: stoName,
      description: description,
    );
