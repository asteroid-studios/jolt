import 'package:flutter/services.dart';

import 'package:flutter_jimtl/flutter_jimtl.dart';
import 'package:ui/ui.dart';

import 'package:example/features/dashboard/translations/dashboard_translations.dart';
import 'package:example/utils/translation/app_translations.dart';
import 'package:example/utils/translation/locales.dart';

///
TranslationsDelegate<dynamic> delegate<T>(
  T Function() translations,
  String prefix,
) {
  return TranslationsDelegate<T>(
    translationsBuilder: translations,
    defaultLocale: supportedLocales.first,
    supportedLocales: supportedLocales,
    onTranslationsUpdated: () {
      print('TX updated, need rebuild');
      // setState(() {});
    },
    dataLoader: (locale, _) async => rootBundle.loadString(
      'assets/arb/${prefix}_translations_${locale.languageCode}.arb',
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

///
class TranslationsMapping {
  ///
  const TranslationsMapping(this.context);

  ///
  final BuildContext context;

  ///
  DashboardTranslations get dashboard => DashboardTranslations.of(context);

  ///
  AppTranslations get app => AppTranslations.of(context);
}
