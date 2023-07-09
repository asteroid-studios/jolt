import 'package:faker/faker.dart';
import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
@RoutePage()
class LayoutsPage extends StatelessWidget {
  ///
  const LayoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      windowTitle: 'Layouts',
      content: [
        Section(
          blurredBackground: true,
          pinned: true,
          verticalPadding: context.spacing.sm,
          background: context.color.primary.s950.withOpacity(0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Title').withStyleHeading(),
              Button(
                icon: Icons.plus,
                onTap: () {},
                borderColor: context.color.primary.s500,
              ),
            ],
          ),
        ),
        Section(
          verticalPadding: context.spacing.section,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Heading'.asHeading(),
              const Spacing.md(),
              ...Faker().lorem.sentences(20).map((s) => s.asText()),
            ],
          ),
        ),
        Section(
          verticalPadding: context.spacing.xxl,
          background: context.color.primary,
          child: Wrap(
            spacing: context.spacing.md,
            runSpacing: context.spacing.md,
            children: [
              ...context.color.primary.shades.map(
                (c) => Button(
                  background: c,
                  label: 'Login',
                  icon: Icons.signIn,
                  borderColor: c.weaken(),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
