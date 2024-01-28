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
    return Scaffold.scrollView(
      windowTitle: 'Layouts',
      children: [
        Center(
          child: Button(
            background: Colors.violet,
            // onPressed: () {},
          ),
        ),
        Center(
          child: Button(
            background: Colors.violet,
            // border: BorderColor(Colors.amber),
            onPressed: () {},
          ),
        ),
        Section(
          blurredBackground: true,
          pinned: true,
          verticalPadding: context.spacing.sm,
          background: context.color.primary.s950.withOpacity(0.8),
          child: Row(
            children: [
              Expanded(
                child: 'Layouts'.asHeading(),
              ),
              Button(
                padding: switch (context.mediaQuery.size.width) {
                  < 600 => EdgeInsets.zero,
                  _ => EdgeInsets.symmetric(
                      horizontal: context.spacing.md,
                      vertical: context.spacing.sm,
                    ),
                },
                label: context.responsive(
                  mobile: 'Hello',
                  tablet: 'Table',
                ),
                icon: Icons.user,
                onPressed: () {},
                // border: BorderColor(context.color.primary.s500),
                tooltip: 'User profile',
              ),
              const Spacing.sm(),
              Button(
                icon: Icons.chat,
                onPressed: () {},
                // border: BorderColor(context.color.primary.s500),
                tooltip: 'Chat',
              ),
            ],
          ),
        ),
        Section(
          height: 200,
          background: context.color.secondary,
          child: 'Test'.asHeading(),
        ),
        Section(
          verticalPadding: context.spacing.section,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Faker().lorem.word().capitalize().asDisplay(),
              const Spacing.md(),
              ...Faker().lorem.sentences(10).map(
                    (s) => s.asText().withColorForegroundLight(),
                  ),
            ],
          ),
        ),
        Section(
          pinned: true,
          blurredBackground: true,
          fullWidth: true,
          background: context.color.primary.withOpacity(0.8),
          child: Wrap(
            spacing: context.spacing.md,
            runSpacing: context.spacing.md,
            children: [
              ...context.color.primary.shades.map(
                (c) => Button(
                  background: c,
                  label: 'Login',
                  icon: Icons.signIn,
                  // border: BorderColor(c.weaken()),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Section(
          verticalPadding: context.spacing.section,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Faker().lorem.word().capitalize().asDisplay(),
              const Spacing.md(),
              ...Faker().lorem.sentences(60).map(
                    (s) => s.asText().withColorForegroundLight(),
                  ),
            ],
          ),
        ),
        Section(
          pinned: true,
          blurredBackground: true,
          background: context.color.primary.withOpacity(0.8),
          child: Wrap(
            spacing: context.spacing.md,
            runSpacing: context.spacing.md,
            children: [
              ...context.color.primary.shades.map(
                (c) => Button(
                  background: c,
                  label: 'Login',
                  icon: Icons.signIn,
                  // border: BorderColor(c.weaken()),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Section(
          verticalPadding: context.spacing.section,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Faker().lorem.word().capitalize().asDisplay(),
              const Spacing.md(),
              ...Faker().lorem.sentences(60).map(
                    (s) => s.asText().withColorForegroundLight(),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}

extension StringX on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
