import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    required this.menuName,
    required this.icon,
  });

  final String? menuName;
  final Widget? icon;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late MenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.icon!,
              AutoSizeText(
                widget.menuName!,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Be Vietnam Pro',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ].divide(const SizedBox(width: 16.0)),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
