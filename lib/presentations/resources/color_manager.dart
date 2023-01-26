import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#0E6134");
  static Color transparent = Colors.transparent;
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#FC2417");
  static Color grey = Colors.grey;
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', "");

    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
