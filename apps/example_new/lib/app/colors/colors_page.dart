import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      content: ScrollArea(
        children: [
          Section(
            color: Colors.surface,
            verticalPadding: Spacing.lg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tailwind Colors',
                  style: Fonts.heading,
                ),
                const Gap.md(),
                Wrap(
                  spacing: Spacing.md,
                  runSpacing: Spacing.md,
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.tailwind.amber,
                        borderRadius: BorderRadius.circular(Spacing.xs),
                      ),
                      padding: EdgeInsets.all(Spacing.md),
                      child: Text(
                        'Amber',
                        style: Fonts.body.lg
                            .colored(Colors.tailwind.amber.as.foreground),
                      ),
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.tailwind.rose,
                        borderRadius: BorderRadius.circular(Spacing.xs),
                      ),
                      padding: EdgeInsets.all(Spacing.md),
                      child: Text(
                        'Rose',
                        style: Fonts.body.lg
                            .colored(Colors.tailwind.rose.as.foreground),
                      ),
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.tailwind.emerald,
                        borderRadius: BorderRadius.circular(Spacing.xs),
                      ),
                      padding: EdgeInsets.all(Spacing.md),
                      child: Text(
                        'Emerald',
                        style: Fonts.body.lg
                            .colored(Colors.tailwind.emerald.as.foreground),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 1000,
          ),
        ],
      ),
    );
  }
}
