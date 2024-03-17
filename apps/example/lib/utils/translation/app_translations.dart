import 'package:flutter_jimtl/flutter_jimtl.dart';
import 'package:intl/intl.dart';
import 'package:ui_copy/ui.dart';

import 'package:example/utils/translation/delegates.dart';

///
extension TranslationsExtensions on BuildContext {
  ///
  TranslationsMapping get translations => TranslationsMapping(this);
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
        name: 'AppTranslations_title',
      );

  ///
  String get dashboard => Intl.message(
        'Dashboard',
        name: 'AppTranslations_dashboard',
      );

  ///
  String get users => Intl.message(
        'Users',
        name: 'AppTranslations_users',
      );
}
