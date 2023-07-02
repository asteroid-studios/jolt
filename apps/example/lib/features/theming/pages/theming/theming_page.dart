import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
@RoutePage()
class ThemingPage extends StatelessWidget {
  ///
  const ThemingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final surface = Colors.slate.toJoltColor(Shade.white);
    final surfaceDark = Colors.slate.toJoltColor(
      Shade.s700,
      foregroundLight: Shade.s400,
    );
    final violet = Colors.violet.toJoltColor(Shade.s50);
    final violetDark = Colors.violet.toJoltColor(
      Shade.s700,
      foregroundLight: Shade.s400,
    );
    final emerald = Colors.emerald.toJoltColor(Shade.s50);
    final emeraldDark = Colors.emerald.toJoltColor(
      Shade.s700,
      foregroundLight: Shade.s400,
    );

    Widget cardFromColor(JoltColor color) {
      return Surface(
        padding: EdgeInsets.all(context.spacing.xl),
        background: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Heading').withStyleHeading(),
            const Text('SubHeading').withColorForegroundLight(),
            const Spacing.xs(),
            const Text(
              'Flat cartoony illustrations with vivid un-blended colors.',
            ),
            const Spacing.sm(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Button(
                  onTap: () {},
                  label: 'Test',
                ).withBackground(color.s500),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      title: 'Theming',
      content: Padding(
        padding: EdgeInsets.all(
          context.responsive(desktop: context.spacing.section) ??
              context.spacing.md,
        ),
        child: Wrap(
          spacing: context.spacing.lg,
          runSpacing: context.spacing.lg,
          children: [
            cardFromColor(surfaceDark),
            cardFromColor(surface),
            cardFromColor(violet),
            cardFromColor(violetDark),
            cardFromColor(emerald),
            cardFromColor(emeraldDark),
            'Test'.asBody(),
            Icons.playPause.asIconDisplay(),
            // ResponsiveHeading('Responsive Heading'),
            Button(
              label: 'Light',
              icon: IconsBold.gear,
              onTap: () {
                context.jolt.setTheme(ThemeMode.system);
              },
              background: Colors.white,
            ),
            Button(
              label: 'Dark',
              icon: IconsBold.moon,
              onTap: () {
                context.jolt.setTheme(ThemeMode.dark);
              },
              background: Colors.black,
            ),
            Button(
              label: 'Store',
              icon: Icons.appStoreLogo,
              onTap: () {},
            ).withBackgroundPrimary(),
            Button(
              label: 'Save to clipboard',
              icon: Icons.copy,
              onTap: () {},
            ).withBackgroundTertiary(),
            Button(
              label: 'Home',
              icon: Icons.house,
              onTap: () {},
              borderColor: context.color.surface.foregroundLight,
            ).withBackgroundTransparent(),
            Button(
              label: 'Home',
              icon: Icons.house,
              onTap: () {},
            ).withBackgroundTransparent().withStyleDisplay().withColorError(),
            Button(
              label: 'House',
              icon: Icons.house,
              onTap: () {},
              background: context.color.primary.withOpacity(0.2),
              color: context.color.primary.s950,
              colorDark: context.color.primary.s200,
            ),
            Button(
              label: 'Save',
              icon: Icons.checkCircle,
              onTap: () {},
            ).withBackgroundSuccess(),
            Button(
              label: 'Delete',
              icon: Icons.trash,
              onTap: () {},
            ).withBackgroundError(),
            Button(
              label: 'User',
              background: context.color.primary.s50,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s100,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s200,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s300,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s400,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s500,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s600,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s700,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s800,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s900,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Button(
              label: 'User',
              background: context.color.primary.s950,
              icon: Icons.userCircle,
              onTap: () {},
            ),
            Form(
              builder: (context, state) {
                return Column(
                  children: [
                    Button(
                      label: 'Submit',
                      onTap: () {
                        final valid = state.save();
                        state.validate().then();
                        if (valid) {
                          print(state
                              .value); // returns {'firstName' : value of firstNames}
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

///
class ResponsiveHeading extends StatelessWidget {
  ///
  const ResponsiveHeading(this.data, {super.key});

  ///
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.responsive(
            desktop: context.style.hero,
          ) ??
          context.style.heading, // Default to heading
    );
  }
}
