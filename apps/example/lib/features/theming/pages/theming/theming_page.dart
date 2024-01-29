import 'package:ui/styles.dart';
import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
@RoutePage()
class ThemingPage extends StatelessWidget {
  ///
  const ThemingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final surface = Colors.slate.toJoltColor(Shade.white);
    // final surfaceDark = Colors.slate.toJoltColor(
    //   Shade.s700,
    //   foregroundLight: Shade.s400,
    // );
    // final violet = Colors.violet.toJoltColor(Shade.s50);
    // final violetDark = Colors.violet.toJoltColor(
    //   Shade.s700,
    //   foregroundLight: Shade.s400,
    // );
    // final emerald = Colors.emerald.toJoltColor(Shade.s50);
    // final emeraldDark = Colors.emerald.toJoltColor(
    //   Shade.s700,
    //   foregroundLight: Shade.s400,
    // );

    Widget cardFromColor(JoltColor color) {
      return Surface(
        style: (context) => SurfaceStyle(
          padding: EdgeInsets.all(context.spacing.xl),
          color: color,
        ),
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
                  onPressed: () {},
                  label: 'Test',
                ).withBackground(color.s500),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold.scrollView(
      windowTitle: 'Theming',
      children: [
        Padding(
          padding: EdgeInsets.all(
            context.responsive(desktop: context.spacing.section) ??
                context.spacing.md,
          ),
          child: Wrap(
            spacing: context.spacing.sm,
            runSpacing: context.spacing.lg,
            children: [
              // cardFromColor(surfaceDark),
              // cardFromColor(surface),
              // cardFromColor(violet),
              // cardFromColor(violetDark),
              // cardFromColor(emerald),
              // cardFromColor(emeraldDark),
              // 'Test'.asDisplay(),
              // Icons.hourglassMedium.asIconDisplay(),
              // ResponsiveHeading('Responsive Heading'),
              Button(
                label: 'Light',
                icon: IconsBold.sun,
                onPressed: () => context.jolt.setTheme(ThemeMode.light),
                color: Colors.white,
                // color: Colors.black,
              ),
              Button(
                label: 'Dark',
                icon: IconsBold.moon,
                onPressed: () {
                  context.jolt.setTheme(ThemeMode.dark);
                },
                color: Colors.black,
              ),
              Button(
                label: 'Store',
                icon: Icons.appStoreLogo,
                onPressed: () {},
              ).withBackgroundPrimary(),
              Button(
                label: 'Save to clipboard',
                icon: IconsBold.copy,
                onPressed: () {},
              ).withBackgroundTertiary(),
              Button(
                label: 'Home',
                icon: Icons.house,
                onPressed: () {},
                // border: BorderColor(
                //   context.color.surface.as.foreground(context),
                // ),
              ).withBackgroundTransparent(),
              Button(
                label: 'Home',
                icon: Icons.house,
                onPressed: () {},
              ).withBackgroundTransparent().withStyleDisplay(),
              Button(
                label: 'House',
                icon: Icons.house,
                onPressed: () {},
                color: context.color.primary.withOpacity(0.3),
                // color: context.color.primary.s950,
              ),
              Button(
                label: 'Save',
                // background: Colors.transparent(context),
                color: context.color.surface,
                // icon: Icons.checkCircle,
                icon: IconsDuotone.checkCircle,
                onPressed: () {},
              ).withBackgroundSuccess(),
              Button(
                label: 'Delete',
                icon: Icons.trash,
                onPressed: () {},
              ).withBackgroundError(),
              Button(
                label: 'User',
                color: context.color.primary.s50,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s100,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s200,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s300,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s400,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s500,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s600,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s700,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s800,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s900,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: context.color.primary.s950,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: Colors.violet,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: Colors.violet,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                icon: Icons.userCircle,
                color: Colors.violet,
                onPressed: () {},
              ),
              Button(
                icon: Icons.airplane,
                // label: 'C',
                color: Colors.violet,
                onPressed: () {},
              ),
              Button(
                color: Colors.amber,
                onPressed: () {},
              ),
              Button(
                icon: Icons.userCircle,
                axis: Axis.vertical,
                // label: 'User',
                color: Colors.violet,
                onPressed: () {},
              ),
              Button(
                icon: Icons.userCircle,
                axis: Axis.vertical,
                label: 'User',
                color: Colors.violet,
                onPressed: () {},
              ),
              Wrap(
                children: Colors.violet.shades
                    .map(
                      (s) => Button(
                        color: s,
                        label: 'Test',
                        onPressed: () {},
                      ),
                    )
                    .toList(),
              ),
              Button(
                label: 'User',
                color: Color.fromARGB(255, 147, 145, 154).as.joltColor().s900,
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Button(
                label: 'User',
                color: Color(0xFF8b5cf6),
                icon: Icons.userCircle,
                onPressed: () {},
              ),
              Wrap(
                children: Color(0xFFf43f5e)
                    .as
                    .joltColor()
                    .shades
                    .map(
                      (s) => Button(
                        color: s,
                        label: 'Test',
                        onPressed: () {},
                      ),
                    )
                    .toList(),
              ),
              Button(
                label: 'Test',
                icon: IconsDuotone.checkCircle,

                // TODO issue, widget doesn't update style when onpressed changes ie enable/disable
                onPressed: () {},
              ).withBackgroundSurface(),
              Button(
                label: 'Test',
                onPressed: () {},
                icon: IconsDuotone.checkCircle,
              ).withBackgroundSurfaceInverse(),
              Button(
                style: outlineButton,
                label: 'Test',
                onPressed: () {},
                icon: IconsDuotone.checkCircle,
              ),
              Container(
                color: Colors.white,
                width: 100,
                height: 200,
              ),
              Surface(
                style: (context) => SurfaceStyle(
                  // width: 400,
                  // height: 150,
                  // color: Colors.amber,
                  color: Colors.white,
                ),
                child: Text('Test'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Test'.asDisplay().withColorForeground(),
                  ' Test'.asHeadingSmall().withColorForegroundLight(),
                ],
              ),
              // Form(
              //   builder: (context, state) {
              //     return Column(
              //       children: [
              //         Button(
              //           label: 'Submit',
              //           onPressed: () {
              //             final valid = state.save();
              //             state.validate().then();
              //             if (valid) {
              //               print(state
              //                   .value); // returns {'firstName' : value of firstNames}
              //             }
              //           },
              //         ),
              //       ],
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ],
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
