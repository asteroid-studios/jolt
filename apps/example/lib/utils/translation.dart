import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_jimtl/flutter_jimtl.dart';
import 'package:jolt/jolt.dart';

import 'package:example/features/dashboard/translations/dashboard_translations.dart';

///
extension TranslationsExtensions on BuildContext {
  ///
  TranslationsMapping get translations => TranslationsMapping(this);
}

///
class TranslationsMapping {
  ///
  const TranslationsMapping(this.context);

  ///
  final BuildContext context;

  ///
  DashboardTranslations get dashboard => DashboardTranslations.of(context);
}

///
const locales = [Locale('en'), Locale('fr')];

///
TranslationsDelegate<dynamic> getTranslations<T>(
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
final translations = [
  getTranslations<DashboardTranslations>(
    DashboardTranslations.new,
    'dashboard',
  ),
];
