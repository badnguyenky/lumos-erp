import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_model.dart';
export 'empty_list_model.dart';

class EmptyListWidget extends StatefulWidget {
  const EmptyListWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<EmptyListWidget> createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget> {
  late EmptyListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title!,
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Be Vietnam Pro',
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        Icon(
          FFIcons.kempty,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
      ].divide(const SizedBox(width: 8.0)),
    );
  }
}
