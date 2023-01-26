// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class EjaraTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static EjaraTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  static Future<void> saveEmail(String email) async {
    var x = await _prefs?.setString('loginEmail', email);
    if (x != null) {
      print('saved');
    }
  }

  static String get getEmail {
    final loginEmail = _prefs?.getString('loginEmail');
    return loginEmail == null ? '' : loginEmail;
  }

  Color? primaryColor;
  Color? secondaryColor;
  Color? tertiaryColor;
  Color? alternate;
  Color? primaryBackground;
  Color? secondaryBackground;
  Color? primaryText;
  Color? secondaryText;

  Color? primaryBtnText;
  Color? lineColor;
  Color? internationalOrangeAerospace;
  Color? internationalOrangeEngineering;
  Color? raisinBlack;
  Color? ghostWhite;

  TextStyle get title1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 28,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      );
}

class LightModeTheme extends EjaraTheme {
  Color? primaryColor = const Color(0xFF0E6134);
  Color? secondaryColor = const Color(0xFFFC682B);
  Color? tertiaryColor = const Color(0xFFEE8B60);
  Color? alternate = const Color(0xFFFD956B);
  Color? primaryBackground = const Color(0xFFF3F7F5);
  Color? secondaryBackground = const Color(0xFFFFFFFF);
  Color? primaryText = const Color(0xFF101213);
  Color? secondaryText = const Color(0xFF57636C);

  Color? primaryBtnText = const Color(0xFFFFFFFF);
  Color? ghostWhite = const Color(0xFFFAFAFF);
  Color? white = const Color(0xFFFFFFFF);
}

class DarkModeTheme extends EjaraTheme {
  Color? primaryColor = const Color(0xFF0E6134);
  Color? secondaryColor = const Color(0xFFFC682B);
  Color? tertiaryColor = const Color(0xFFEE8B60);
  Color? alternate = const Color(0xFFFD956B);
  Color? primaryBackground = const Color(0xFF1A1F24);
  Color? secondaryBackground = const Color(0xFF101213);
  Color? primaryText = const Color(0xFFFFFFFF);
  Color? secondaryText = const Color(0xFF95A1AC);

  Color? primaryBtnText = const Color(0xFFFFFFFF);
  Color? ghostWhite = const Color(0xFFFAFAFF);
  Color? white = const Color(0xFFFFFFFF);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool? useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts!
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
