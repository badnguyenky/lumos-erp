import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/chi_tiet_k_k/chi_tiet_k_k_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chi_tiet_kiem_ke_widget.dart' show ChiTietKiemKeWidget;
import 'package:flutter/material.dart';

class ChiTietKiemKeModel extends FlutterFlowModel<ChiTietKiemKeWidget> {
  ///  Local state fields for this page.

  List<SanPhamStruct> spList = [];
  void addToSpList(SanPhamStruct item) => spList.add(item);
  void removeFromSpList(SanPhamStruct item) => spList.remove(item);
  void removeAtIndexFromSpList(int index) => spList.removeAt(index);
  void insertAtIndexInSpList(int index, SanPhamStruct item) =>
      spList.insert(index, item);
  void updateSpListAtIndex(int index, Function(SanPhamStruct) updateFn) =>
      spList[index] = updateFn(spList[index]);

  bool loading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CHECK KK)] action in ChiTietKiemKe widget.
  ApiCallResponse? response;
  // Model for ChiTietKK component.
  late ChiTietKKModel chiTietKKModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchSanPham] action in TextField widget.
  List<SanPhamStruct>? searchList;

  @override
  void initState(BuildContext context) {
    chiTietKKModel = createModel(context, () => ChiTietKKModel());
  }

  @override
  void dispose() {
    chiTietKKModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
