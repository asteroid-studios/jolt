import 'package:example_new/app/widgets/buttons_page.dart';
import 'package:example_new/app/widgets/toggle_page.dart';
import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/')
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      topBar: const TempAppBar(title: 'Widgets', showBack: false),
      builder: (context) {
        return ScrollArea.fill(
          // TODO make this cleaner
          child: Padding(
            padding: EdgeInsets.only(
              left: Spacing.md,
              right: Spacing.md,
              bottom: Spacing.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeCard(
                  title: 'Button',
                  category: 'Interaction',
                  onTap: () => ButtonsPage.go(context),
                  color: Colors.primary,
                ),
                HomeCard(
                  title: 'Form',
                  category: 'Forms',
                  onTap: () => ButtonsPage.go(context),
                  color: Colors.tailwind.sky,
                ),
                HomeCard(
                  title: 'Card',
                  category: 'Display',
                  onTap: () => ButtonsPage.go(context),
                  color: Colors.tailwind.emerald,
                ),
                HomeCard(
                  title: 'Toggle',
                  category: 'Interaction',
                  onTap: () => TogglePage.go(context),
                  color: Colors.tailwind.amber,
                ),
              ].withSeparator(
                Surface(
                  width: double.infinity,
                  height: 1,
                  color: Colors.outline,
                  margin: EdgeInsets.symmetric(vertical: Spacing.lg),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    required this.title,
    required this.category,
    required this.onTap,
    required this.color,
    super.key,
  });

  final String title;
  final String category;
  final void Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(title, style: Fonts.heading.sm)),
                Button.filled(
                  color: Colors.secondary.withOpacity(0.1),
                  label: Text(
                    '# $category',
                    style: Fonts.body.sm.copyWith(color: Colors.surface.foregroundLight),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: Spacing.md, vertical: Spacing.xxs),
                  onTap: () {},
                ),
              ],
            ),
            const Gap.sm(),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    color.weaken(),
                    color,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
