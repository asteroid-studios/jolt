import 'package:flutter_jimtl/flutter_jimtl.dart';
import 'package:intl/intl.dart';
import 'package:ui/ui.dart';

///
@GenerateArb(suppressLastModified: true, dir: 'assets/arb')
class DashboardTranslations {
  ///
  static DashboardTranslations of(BuildContext context) =>
      Localizations.of<DashboardTranslations>(context, DashboardTranslations)!;

  ///
  String get title => Intl.message(
        'Dashboard title edited',
        name: 'DashboardTranslations_title',
      );

  ///
  String get hero => Intl.message(
        'Build your next idea even faster.',
        name: 'DashboardTranslations_hero',
      );
}
