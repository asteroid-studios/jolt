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
        margin: EdgeInsets.all(context.spacing.xl),
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
      content: Wrap(
        spacing: context.spacing.md,
        children: [
          cardFromColor(surfaceDark),
          cardFromColor(surface),
          cardFromColor(violet),
          cardFromColor(violetDark),
          cardFromColor(emerald),
          cardFromColor(emeraldDark),
          // ResponsiveHeading('Responsive Heading'),
          Button(
            label: 'Home',
            icon: Icons.house,
            onTap: () {},
            // labelStyle: context.style.label,
            // background: context.color.primary,
            // color: context.color.error,
          ),
          Button(
            label: 'House',
            icon: Icons.house,
            onTap: () {},
            background: context.color.primary,
          ),
          Button(
            label: 'Home',
            icon: Icons.house,
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
            background: context.color.surface.withOpacity(0),
          ),
          Button(
            label: 'House',
            icon: Icons.house,
            onTap: () {},
            background: context.color.primary.withOpacity(0.2),
            color: context.color.primary.s950,
          ),
          Button(
            label: 'Home',
            icon: Icons.house,
            onTap: () {},
          ),
          Button(
            label: 'Home',
            icon: Icons.house,
            onTap: () {},
          ).withBackgroundTertiary().withStyleLabel(),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s50,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s100,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s200,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s300,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s400,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s500,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s600,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s700,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s800,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s900,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: context.color.surface.s950,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   icon: Icons.airplane,
          //   background: Colors.emerald,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s50,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s100,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s200,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s300,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s400,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s500,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s600,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s700,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s800,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s900,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          // Button(
          //   label: 'Test',
          //   background: Colors.emerald.s950,
          //   icon: Icons.airplane,
          //   onTap: () {},
          // ),
          //     .withBackground(context.color.surface.foreground)
          //     .color(context.color.surface.foreground)
          // Button(
          //   onTap: () => context.navigateTo(const BreakpointsRoute()),
          //   label: 'Breakpoints',
          //   icon: Icons.gridFour,
          //   verticalButton: true,
          //   padding: EdgeInsets.all(context.spacing.xl),
          //   labelStyle: context.withStyle.displaySmall,
          // ).hero(),
          // Button(
          //   onTap: () => context.navigateTo(const TypographyRoute()),
          //   label: 'Typography',
          //   icon: Icons.textAUnderline,
          //   verticalButton: true,
          //   padding: EdgeInsets.all(context.spacing.xl),
          //   labelStyle: context.withStyle.displaySmall,
          // ),
        ],
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
