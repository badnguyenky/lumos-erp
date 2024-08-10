// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuStruct extends BaseStruct {
  MenuStruct({
    int? menuId,
    String? module,
    String? menuName,
    String? iconCode,
    String? iconGroup,
  })  : _menuId = menuId,
        _module = module,
        _menuName = menuName,
        _iconCode = iconCode,
        _iconGroup = iconGroup;

  // "menu_id" field.
  int? _menuId;
  int get menuId => _menuId ?? 0;
  set menuId(int? val) => _menuId = val;

  void incrementMenuId(int amount) => menuId = menuId + amount;

  bool hasMenuId() => _menuId != null;

  // "module" field.
  String? _module;
  String get module => _module ?? '';
  set module(String? val) => _module = val;

  bool hasModule() => _module != null;

  // "menu_name" field.
  String? _menuName;
  String get menuName => _menuName ?? '';
  set menuName(String? val) => _menuName = val;

  bool hasMenuName() => _menuName != null;

  // "iconCode" field.
  String? _iconCode;
  String get iconCode => _iconCode ?? '';
  set iconCode(String? val) => _iconCode = val;

  bool hasIconCode() => _iconCode != null;

  // "iconGroup" field.
  String? _iconGroup;
  String get iconGroup => _iconGroup ?? '';
  set iconGroup(String? val) => _iconGroup = val;

  bool hasIconGroup() => _iconGroup != null;

  static MenuStruct fromMap(Map<String, dynamic> data) => MenuStruct(
        menuId: castToType<int>(data['menu_id']),
        module: data['module'] as String?,
        menuName: data['menu_name'] as String?,
        iconCode: data['iconCode'] as String?,
        iconGroup: data['iconGroup'] as String?,
      );

  static MenuStruct? maybeFromMap(dynamic data) =>
      data is Map ? MenuStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'menu_id': _menuId,
        'module': _module,
        'menu_name': _menuName,
        'iconCode': _iconCode,
        'iconGroup': _iconGroup,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'menu_id': serializeParam(
          _menuId,
          ParamType.int,
        ),
        'module': serializeParam(
          _module,
          ParamType.String,
        ),
        'menu_name': serializeParam(
          _menuName,
          ParamType.String,
        ),
        'iconCode': serializeParam(
          _iconCode,
          ParamType.String,
        ),
        'iconGroup': serializeParam(
          _iconGroup,
          ParamType.String,
        ),
      }.withoutNulls;

  static MenuStruct fromSerializableMap(Map<String, dynamic> data) =>
      MenuStruct(
        menuId: deserializeParam(
          data['menu_id'],
          ParamType.int,
          false,
        ),
        module: deserializeParam(
          data['module'],
          ParamType.String,
          false,
        ),
        menuName: deserializeParam(
          data['menu_name'],
          ParamType.String,
          false,
        ),
        iconCode: deserializeParam(
          data['iconCode'],
          ParamType.String,
          false,
        ),
        iconGroup: deserializeParam(
          data['iconGroup'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MenuStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MenuStruct &&
        menuId == other.menuId &&
        module == other.module &&
        menuName == other.menuName &&
        iconCode == other.iconCode &&
        iconGroup == other.iconGroup;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([menuId, module, menuName, iconCode, iconGroup]);
}

MenuStruct createMenuStruct({
  int? menuId,
  String? module,
  String? menuName,
  String? iconCode,
  String? iconGroup,
}) =>
    MenuStruct(
      menuId: menuId,
      module: module,
      menuName: menuName,
      iconCode: iconCode,
      iconGroup: iconGroup,
    );
