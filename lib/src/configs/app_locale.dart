import 'package:flutter/material.dart';

class AppLocale {
  AppLocale._();

  static const String path = 'assets/langs';

  static const indonesian = Locale('id', 'ID');
  static const englishUS = Locale('en', 'US');

  static const List<Locale> supportedLocaleList = <Locale>[
    indonesian,
    englishUS,
  ];

  static const Locale startLocale = indonesian;
  static const Locale fallbackLocale = englishUS;
}
