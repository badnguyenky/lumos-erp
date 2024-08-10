import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'vi_tri_model.dart';
export 'vi_tri_model.dart';

class ViTriWidget extends StatefulWidget {
  const ViTriWidget({
    super.key,
    required this.gusName,
    required this.ounName,
  });

  final String? gusName;
  final String? ounName;

  @override
  State<ViTriWidget> createState() => _ViTriWidgetState();
}

class _ViTriWidgetState extends State<ViTriWidget>
    with TickerProviderStateMixin {
  late ViTriModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViTriModel());

    animationsMap.addAll({
      'cardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  widget.gusName!,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Be Vietnam Pro',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Công ty',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Be Vietnam Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.ounName!,
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Be Vietnam Pro',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 1.0,
              thickness: 1.0,
              color: Color(0xFFE9EBED),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Chi nhánh',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Be Vietnam Pro',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    ' ',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Be Vietnam Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ].divide(const SizedBox(height: 12.0)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation']!);
  }
}
