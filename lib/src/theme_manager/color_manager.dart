import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#0A97B0');
  static Color teal = HexColor.fromHex('#46B5A7');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color black = HexColor.fromHex('#333333');
  static Color black2 = HexColor.fromHex('#4F4F4F');
  static Color gray = HexColor.fromHex('#828282');
  static Color gray2 = HexColor.fromHex('#E0E0E0');
  static Color gray3 = HexColor.fromHex('#BDBDBD');
  static Color yellow = HexColor.fromHex('#F2C94C');
  static Color blue = HexColor.fromHex('#2F80ED');
  static Color blue2 = HexColor.fromHex('#2D9CDB');
  static Color blue3 = HexColor.fromHex('#56CCF2');
  static Color orange = HexColor.fromHex('#F2994A');
  static Color red = HexColor.fromHex('#EB5757');
  static Color purple = HexColor.fromHex('#9B51E0');
  static Color purple2 = HexColor.fromHex('#BB6BD9');
  static Color green = HexColor.fromHex('#27AE60');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
