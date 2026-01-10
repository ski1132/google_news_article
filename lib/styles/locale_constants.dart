import 'package:flutter/material.dart';

enum LocaleConstants {
  enUs(enLanguageCode, usCountryCode, enUsLocale),
  thTh(thLanguageCode, thCountryCode, thThLocale);

  const LocaleConstants(this.language, this.country, this.locale);

  final String language;
  final String country;
  final Locale locale;

  static const String path = 'assets/translations';
  static const String enLanguageCode = 'en';
  static const String thLanguageCode = 'th';
  static const String usCountryCode = 'US';
  static const String thCountryCode = 'TH';
  static const Locale enUsLocale = Locale(enLanguageCode, usCountryCode);
  static const Locale thThLocale = Locale(thLanguageCode, thCountryCode);
  static const List<Locale> supportedLocales = [enUsLocale, thThLocale];
  static const String timezone = 'Asia/Bangkok';
}
