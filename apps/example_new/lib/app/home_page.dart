import 'package:example_new/app/widgets/widgets.dart';
import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/home')
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      topBar: TempAppBar(
        title: 'Widgets',
        showBack: false,
        trailing: Button.ghost(
          icon: HeroiconsOutline.magnifyingGlass.icon,
          onTap: () {},
        ),
      ),
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
                  onTap: () => ButtonPage.go(context),
                  color: Colors.primary,
                ),
                HomeCard(
                  title: 'Form',
                  category: 'Forms',
                  onTap: () => FormPage.go(context),
                  color: Colors.tailwind.sky,
                ),
                HomeCard(
                  title: 'Input',
                  category: 'Forms',
                  onTap: () => InputPage.go(context),
                  color: Colors.tailwind.emerald,
                ),
                HomeCard(
                  title: 'Card',
                  category: 'Display',
                  onTap: () => CardPage.go(context),
                  color: Colors.tailwind.rose,
                ),
                HomeCard(
                  title: 'Toggle',
                  category: 'Interaction',
                  onTap: () => TogglePage.go(context),
                  color: Colors.tailwind.amber,
                ),
                HomeCard(
                  title: 'Divider',
                  category: 'Display',
                  onTap: () => DividerPage.go(context),
                  color: Colors.tailwind.slate,
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
    // TODO trade for a card?
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
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
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
