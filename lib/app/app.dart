import 'package:ejara_assessment/presentations/login/controller/login.controller.dart';
import 'package:ejara_assessment/presentations/login/views/login.view.dart';
import 'package:ejara_assessment/services/network_service.dart';
import 'package:ejara_assessment/shared/controllers/user.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
            create: (_) => LoginController(NetworkService())),
        ChangeNotifierProvider<UserController>(create: (_) => UserController()),
      ],
      builder: (context, child) => MaterialApp(
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
        theme: buildLightTheme(context),
        darkTheme: buildDarkTheme(context),
        themeMode: ThemeMode.light,
        title: 'Ejara',
        home: const LoginView(),
      ),
    );
  }
}
