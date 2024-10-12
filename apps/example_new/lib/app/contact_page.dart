import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/contact')
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      topBar: TempAppBar(title: 'Contact', showBack: false),
      builder: (context) => ScrollArea.fill(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                icon: IconsBold.discordLogo.icon,
                onTap: () {},
              ),
              Button(
                icon: IconsBold.githubLogo.icon,
                onTap: () {},
              ),
              Button(
                icon: IconsBold.code.icon,
                onTap: () {},
              ),
            ].withSeparator(Gap.sm()),
          ),
        ),
      ),
    );
  }
}
