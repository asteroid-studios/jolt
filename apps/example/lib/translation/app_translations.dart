import 'package:flutter_jimtl/flutter_jimtl.dart';
import 'package:intl/intl.dart';
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

  ///
  AppTranslations get app => AppTranslations.of(context);
}

///
@GenerateArb(suppressLastModified: true, dir: 'assets/arb')
class AppTranslations {
  ///
  static AppTranslations of(BuildContext context) =>
      Localizations.of<AppTranslations>(context, AppTranslations)!;

  ///
  String get title => Intl.message(
        'Jolt',
        name: 'title',
      );

  ///
  String get dashboard => Intl.message(
        'Dashboard',
        name: 'dashboard',
      );

  ///
  String get users => Intl.message(
        'Users',
        name: 'users',
      );
}
