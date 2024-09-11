import 'dart:ui';
import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

      return Color(
        int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
      );
}

class ColorConstants {
  static Color blackColor = hexToColor('#1e1f1d');
  static Color darkGreyColor = hexToColor('#373737');
  static Color pinkColor = hexToColor('#dd49ab');
  static Color lightGreyColor = hexToColor('#f0f0f0');

  static var white;
}