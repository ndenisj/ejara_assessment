import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class EjaraLocalizations {
  EjaraLocalizations(this.locale);

  final Locale locale;

  static EjaraLocalizations? of(BuildContext context) =>
      Localizations.of<EjaraLocalizations>(context, EjaraLocalizations);

  static List<String> languages() => ['en', 'fr'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String frText = '',
  }) =>
      [enText, frText][languageIndex];
}

class EjaraLocalizationsDelegate
    extends LocalizationsDelegate<EjaraLocalizations> {
  const EjaraLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      EjaraLocalizations.languages().contains(locale.languageCode);

  @override
  Future<EjaraLocalizations> load(Locale locale) =>
      SynchronousFuture<EjaraLocalizations>(EjaraLocalizations(locale));

  @override
  bool shouldReload(EjaraLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // {
  //   'form_phone_number': {
  //     'en': 'Phone number',
  //     'fr': 'Numéro de téléphone',
  //   },
  //   'form_password': {
  //     'en': 'Password',
  //     'fr': 'Mot de passe',
  //   },
  // },
  // Language View
  {
    'en_lang': {
      'en': 'English',
      'fr': 'Anglaise',
    },
    'fr_lang': {
      'en': 'French',
      'fr': 'Français',
    },
    'langview_appbar_title': {
      'en': 'Select your language',
      'fr': 'choisissez votre langue',
    },
    'continue': {
      'en': 'Continue',
      'fr': 'Continuez',
    },
  },

  // Register View
  // {
  //   'register_create_account': {
  //     'en': 'Create an new account',
  //     'fr': "Créer un nouveau compte",
  //   },
  //   'register_register': {
  //     'en': 'Register',
  //     'fr': "S'inscrire",
  //   },
  // },
].reduce((a, b) => a..addAll(b));
