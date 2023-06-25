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
        margin: EdgeInsets.all(context.sizing.xl),
        padding: EdgeInsets.all(context.sizing.xl),
        background: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Heading',
              style: context.style.heading,
              color: color.foreground,
            ),
            Text(
              'SubHeading',
              // style: context.style.labelLarge,
              color: color.foregroundLight,
            ),
            Spacing.xs(),
            Text(
              'Flat cartoony illustrations with vivid unblended colors.',
              color: color.foreground,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      title: 'Theming',
      content: Wrap(
        spacing: context.sizing.md,
        children: [
          cardFromColor(surfaceDark),
          cardFromColor(surface),
          cardFromColor(violet),
          cardFromColor(violetDark),
          cardFromColor(emerald),
          cardFromColor(emeraldDark),
          // 'Test'.asHeroLarge(),
          // TODO need to fix this so button defaults to defaultTextStyle
          // Feels like there is a conflict between the heirarchy
          // for example:
          // - DefaultTextStyle (potentially containing color)
          // - ButtonTheme from WidgetTheme
          // - Passed style or color
          // ResponsiveHeading('Responsive Heading'),
          // Button(label: 'Test').styleHeading(),
          // Button(label: 'Test').styleLabel(),
          // Button(
          //   icon: Icons.airTrafficControl,
          //   label: 'a disabled button',
          //   // labelStyle: context.style.label,
          // ).styleHeading().colorPrimary(),
          Button(
            label: 'Home',
            icon: Icons.house,
            // background: context.color.transparent,
            // borderColor: context.color.primary,
            // background: context.color.surface.withOpacity(0),
            onTap: () {},
          ),
          Button(
            label: 'Home',
            icon: Icons.house,
            // background: context.color.transparent,
            // borderColor: context.color.primary,
            // background: context.color.surface.withOpacity(0),
            onTap: () {},
          ).backgroundPrimary(),
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
          //     .background(context.color.surface.foreground)
          //     .color(context.color.surface.foreground)
          // Button(
          //   onTap: () => context.navigateTo(const BreakpointsRoute()),
          //   label: 'Breakpoints',
          //   icon: Icons.gridFour,
          //   verticalButton: true,
          //   padding: EdgeInsets.all(context.sizing.xl),
          //   labelStyle: context.style.displaySmall,
          // ).hero(),
          // Button(
          //   onTap: () => context.navigateTo(const TypographyRoute()),
          //   label: 'Typography',
          //   icon: Icons.textAUnderline,
          //   verticalButton: true,
          //   padding: EdgeInsets.all(context.sizing.xl),
          //   labelStyle: context.style.displaySmall,
          // ),
        ],
      ),
    );
  }
}

class ResponsiveHeading extends StatelessWidget {
  const ResponsiveHeading(this.data, {super.key});

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
