import 'package:ejara_assessment/presentations/login/views/login.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../presentations/resources/color_manager.dart';
import '../utils/ejara_theme.dart';
import '../utils/internationalization.dart';

class EjaraApp extends StatefulWidget {
  const EjaraApp({super.key});

  @override
  State<EjaraApp> createState() => _EjaraAppState();
}

class _EjaraAppState extends State<EjaraApp> {
  Locale? _locale;
  ThemeMode _themeMode = EjaraTheme.themeMode;

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        EjaraTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        EjaraLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],
      theme: ThemeData(brightness: Brightness.light).copyWith(
        // scaffoldBackgroundColor: ColorManager.white,
        iconTheme: IconThemeData(color: EjaraTheme.of(context).primaryColor),
        primaryColor: EjaraTheme.of(context).primaryColor,
        dividerTheme: DividerThemeData(
          color: EjaraTheme.of(context).primaryColor!.withOpacity(0.5),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          errorMaxLines: 1,
          hintStyle: EjaraTheme.of(context).bodyText2,
          labelStyle: EjaraTheme.of(context).bodyText1,
          errorStyle: EjaraTheme.of(context)
              .bodyText1
              .copyWith(color: ColorManager.error),
          // borders
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: EjaraTheme.of(context).secondaryColor!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: EjaraTheme.of(context).secondaryColor!,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorManager.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: EjaraTheme.of(context).primaryBackground,
          iconTheme: IconThemeData(
            color: EjaraTheme.of(context).primaryText,
          ),
        ),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark).copyWith(
        scaffoldBackgroundColor: ColorManager.white,
        iconTheme: IconThemeData(color: EjaraTheme.of(context).primaryColor),
        primaryColor: EjaraTheme.of(context).primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: EjaraTheme.of(context).bodyText1,
          labelStyle: EjaraTheme.of(context).bodyText1,
          errorStyle: EjaraTheme.of(context)
              .bodyText1
              .copyWith(color: ColorManager.error),
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
        ),
      ),
      themeMode: ThemeMode.light,
      title: 'Ejara',
      home: const LoginView(),
    );
  }
}
