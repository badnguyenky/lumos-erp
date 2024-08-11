import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _biometricFamily = 'Biometric';
  static const String _userFamily = 'User';
  static const String _chucnangFamily = 'Chucnang';
  static const String _searchFamily = 'Search';
  static const String _emptyFamily = 'Empty';
  static const String _navbarFamily = 'Navbar';

  // biometric
  static const IconData ktypefaceId =
      IconData(0xe900, fontFamily: _biometricFamily);
  static const IconData ktypetouchId =
      IconData(0xe901, fontFamily: _biometricFamily);

  // user
  static const IconData kuser = IconData(0xe900, fontFamily: _userFamily);

  // chucnang
  static const IconData kpheduyet =
      IconData(0xe900, fontFamily: _chucnangFamily);
  static const IconData kchamcong =
      IconData(0xe901, fontFamily: _chucnangFamily);
  static const IconData kscanqr = IconData(0xe902, fontFamily: _chucnangFamily);
  static const IconData kstorage =
      IconData(0xe903, fontFamily: _chucnangFamily);

  // search
  static const IconData ksearch = IconData(0xe900, fontFamily: _searchFamily);

  // empty
  static const IconData kempty = IconData(0xe900, fontFamily: _emptyFamily);

  // navbar
  static const IconData khome = IconData(0xe900, fontFamily: _navbarFamily);
}
