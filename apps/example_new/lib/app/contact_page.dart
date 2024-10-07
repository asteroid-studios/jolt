import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/contact')
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Contact',
        style: Fonts.heading,
      ),
    );
  }
}
