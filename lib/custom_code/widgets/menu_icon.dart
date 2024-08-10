// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class MenuIcon extends StatefulWidget {
  const MenuIcon({
    Key? key,
    this.width,
    this.height,
    this.iconCodePoint,
    this.iconFontFamily,
    this.iconSize,
    required this.iconType,
    required this.iconColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? iconCodePoint;
  final String? iconFontFamily;
  final double? iconSize;
  final Widget iconType;
  final Color iconColor;
  String get safeIconCodePoint => iconCodePoint ?? "";
  @override
  _MenuIconState createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> {
  @override
  Widget build(BuildContext context) {
    Widget iconUse = widget.iconType;

    String safeIconFontFamily = widget.iconFontFamily ?? 'MaterialIcons';
    if (safeIconFontFamily.trim().length == 0) {
      safeIconFontFamily = 'MaterialIcons';
    }
    print(widget.iconFontFamily);

    double safeIconSize = widget.iconSize ?? 30;

    if (widget.safeIconCodePoint != "") {
      int codIcon = int.parse(widget.safeIconCodePoint);
      print(codIcon);

      IconData tmpIconData = IconData(codIcon, fontFamily: safeIconFontFamily);
      iconUse =
          new Icon(tmpIconData, size: safeIconSize, color: widget.iconColor);
    }

    return iconUse;
  }
}
