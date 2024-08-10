import '/components/menu/menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chon_chuc_nang_widget.dart' show ChonChucNangWidget;
import 'package:flutter/material.dart';

class ChonChucNangModel extends FlutterFlowModel<ChonChucNangWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Menu component.
  late MenuModel menuModel1;
  // Model for Menu component.
  late MenuModel menuModel2;
  // Model for Menu component.
  late MenuModel menuModel3;
  // Model for Menu component.
  late MenuModel menuModel4;

  @override
  void initState(BuildContext context) {
    menuModel1 = createModel(context, () => MenuModel());
    menuModel2 = createModel(context, () => MenuModel());
    menuModel3 = createModel(context, () => MenuModel());
    menuModel4 = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    menuModel1.dispose();
    menuModel2.dispose();
    menuModel3.dispose();
    menuModel4.dispose();
  }
}
