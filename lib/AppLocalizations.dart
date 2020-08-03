import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
//import 'l10n/messages_all.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate=_AppLocalizationsDelegate();

  //static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();
  Map<String, String> _localizedStrings;
  Future<bool> load() async
  {
    print('i18n/${locale.languageCode}.json');
    String jsonString = await rootBundle.loadString('i18n/${locale.languageCode}.json');

    Map<String,dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings=jsonMap.map((key, value) {
      return MapEntry(key, value);
    });

    return true;
  }



    String translate(String key)
    {
      return _localizedStrings[key];
    }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  // Override with your list of supported language codes
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''),
      Locale('he', 'IL'),
      Locale('he_IL', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) async{
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}