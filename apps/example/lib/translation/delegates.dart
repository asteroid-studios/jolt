import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_jimtl/flutter_jimtl.dart';

import 'package:example/features/dashboard/translations/dashboard_translations.dart';
import 'package:example/translation/app_translations.dart';
import 'package:example/translation/locales.dart';

///
TranslationsDelegate<dynamic> delegate<T>(
    T Function() translations, String prefix) {
  return TranslationsDelegate<T>(
    translationsBuilder: translations,
    defaultLocale: locales.first,
    supportedLocales: locales,
    onTranslationsUpdated: () {
      print('TX updated, need rebuild');
      // setState(() {});
    },
    dataLoader: (locale, _) async => rootBundle.loadString(
      'assets/arb/${prefix}_translations_$locale.arb',
    ),
  );
}

///
final translationDelegates = [
  delegate<DashboardTranslations>(
    DashboardTranslations.new,
    'dashboard',
  ),
  delegate<AppTranslations>(
    AppTranslations.new,
    'app',
  ),
];
