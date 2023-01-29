// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../presentations/resources/color_manager.dart';

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
  Color? iconColor;
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
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w300,
        fontSize: 12,
      );
}

class LightModeTheme extends EjaraTheme {
  Color? primaryColor = const Color(0xFF11155D);
  Color? secondaryColor = const Color(0xFF6F77E5);
  Color? iconColor = const Color(0xFF525AE1);
  Color? tertiaryColor = const Color(0xFFEE8B60);
  Color? alternate = const Color(0xFFFD956B);
  Color? primaryBackground = const Color(0xFFF9F9FB);
  Color? secondaryBackground = const Color(0xFFFFFFFF);
  Color? primaryText = const Color(0xFF57636C);
  // Color? primaryText = const Color(0xFF101213);
  Color? secondaryText = const Color(0xFF4C4D84);

  Color? primaryBtnText = const Color(0xFFFFFFFF);
  Color? ghostWhite = const Color(0xFFFAFAFF);
  Color? white = const Color(0xFFFFFFFF);
}

class DarkModeTheme extends EjaraTheme {
  Color? primaryColor = const Color(0xFF13005A);
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

//
ThemeData buildLightTheme(BuildContext context) {
  return ThemeData(brightness: Brightness.light).copyWith(
    iconTheme: IconThemeData(color: EjaraTheme.of(context).iconColor),
    primaryColor: EjaraTheme.of(context).primaryColor,
    dividerTheme: DividerThemeData(
      color: EjaraTheme.of(context).primaryColor!.withOpacity(0.1),
    ),
    inputDecorationTheme: _buildLightInputDecorationTheme(context),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: EjaraTheme.of(context).primaryBackground,
      iconTheme: IconThemeData(
        color: EjaraTheme.of(context).primaryText,
      ),
    ),
  );
}

ThemeData buildDarkTheme(BuildContext context) {
  return ThemeData(brightness: Brightness.dark).copyWith(
    scaffoldBackgroundColor: ColorManager.white,
    iconTheme: IconThemeData(color: EjaraTheme.of(context).primaryColor),
    primaryColor: EjaraTheme.of(context).primaryColor,
    inputDecorationTheme: _buildDarkInputDecorationTheme(context),
  );
}

InputDecorationTheme _buildLightInputDecorationTheme(BuildContext context) {
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    errorMaxLines: 1,
    hintStyle: EjaraTheme.of(context).bodyText2,
    labelStyle: EjaraTheme.of(context).bodyText1,
    errorStyle:
        EjaraTheme.of(context).bodyText1.copyWith(color: ColorManager.error),
    // borders
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: ColorManager.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: ColorManager.grey,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: ColorManager.error,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: ColorManager.error,
      ),
    ),
    // prefix
    prefixIconColor: EjaraTheme.of(context).primaryColor!,
    prefixStyle: EjaraTheme.of(context).bodyText1.copyWith(
          fontSize: 18,
        ),
    // surfix
    suffixIconColor: EjaraTheme.of(context).primaryColor!,
  );
}

InputDecorationTheme _buildDarkInputDecorationTheme(BuildContext context) {
  return InputDecorationTheme(
    hintStyle: EjaraTheme.of(context).bodyText1,
    labelStyle: EjaraTheme.of(context).bodyText1,
    errorStyle:
        EjaraTheme.of(context).bodyText1.copyWith(color: ColorManager.error),
    errorMaxLines: 1,
    // borders
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: EjaraTheme.of(context).primaryColor!,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: EjaraTheme.of(context).primaryColor!,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: ColorManager.error,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: ColorManager.error,
      ),
    ),
    // prefix
    prefixIconColor: EjaraTheme.of(context).primaryColor!,
    prefixStyle: EjaraTheme.of(context).bodyText1.copyWith(
          fontSize: 18,
          color: EjaraTheme.of(context).ghostWhite,
        ),
    // surfix
    suffixIconColor: EjaraTheme.of(context).primaryColor!,
  );
}
