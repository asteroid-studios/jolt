import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/settings')
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings',
        style: Fonts.heading,
      ),
    );
  }
}
