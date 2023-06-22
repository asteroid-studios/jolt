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
          'Test'.heroLarge(),
          // TODO need to fix this so button defaults to defaultTextStyle
          // Feels like there is a conflict between the heirarchy
          // for example:
          // - DefaultTextStyle (potentially containing color)
          // - ButtonTheme from WidgetTheme
          // - Passed style or color

          //
          Button(label: 'Test').heroLarge(),
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
