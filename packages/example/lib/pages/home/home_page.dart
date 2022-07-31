import 'package:adaptive_components/adaptive_components.dart';
import 'package:example/app/router/routes.dart';
import 'package:example/app/util/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText('Jolt'),
        elevation: 10,
      ),
      bottomNavigationBar: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        },
        child: context.responsive.isMobile
            ? NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                destinations: [
                  NavigationDestination(
                    label: 'Home',
                    tooltip: '',
                    icon: Icon(
                      Icons.home,
                    ),
                  ),
                  NavigationDestination(
                    label: 'Profile',
                    tooltip: '',
                    icon: Icon(
                      Icons.account_circle_outlined,
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: AdaptiveColumn(
              // gutter: 200,
              children: [
                AdaptiveContainer(
                  columnSpan: 12,
                  child: ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   onPrimary: Theme.of(context).colorScheme.onPrimary,
                    //   primary: Theme.of(context).colorScheme.primary,
                    // ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    onPressed: () {
                      context.go(accountRoute);
                    },
                    child: JoltText(
                      'Account',
                      selectable: false,
                      color: context.color.primary,
                    ),
                  ),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: StreamBuilder(
                      stream: flagsmithClient.stream(Feature.snackbars.name),
                      builder: (context, AsyncSnapshot<Flag> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (!(snapshot.data?.enabled ?? false)) {
                          return Container();
                        }
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: context.color.onPrimaryContainer,
                            primary: context.color.primaryContainer,
                          ).copyWith(
                              elevation: ButtonStyleButton.allOrNull(0.0)),
                          onPressed: () {
                            final messenger = context.scaffoldMessenger;
                            messenger.showSnackBar(
                              message: 'Something normal happened, try again',
                              icon: Icons.cabin,
                            );
                            messenger.showSnackBarSuccess(
                                message: 'Something was successful');
                            messenger.showSnackBarInfo(
                                message: 'Something exists here');
                            messenger.showSnackBarWarning(
                                message: 'Something could go wrong');
                            messenger.showSnackBarError(
                                message: 'Something went wrong');
                          },
                          child: JoltText(
                            'Test',
                            selectable: false,
                          ),
                        );
                      }),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Container(
                    height: 20,
                  ),
                ),
                // AdaptiveContainer(
                //   columnSpan: 12,
                //   child: SelectableText(
                //     "Mobile: ${context.responsive.isMobile}",
                //     style: context.textStyle.title,
                //   ),
                // ),
                // AdaptiveContainer(
                //   columnSpan: 12,
                //   child: SelectableText(
                //     "Tablet: ${context.responsive.isTablet}",
                //     style: context.textStyle.title,
                //   ),
                // ),
                // AdaptiveContainer(
                //   columnSpan: 12,
                //   child: SelectableText(
                //     "Laptop: ${context.responsive.isLaptop}",
                //     style: context.textStyle.title,
                //   ),
                // ),
                // AdaptiveContainer(
                //   columnSpan: 12,
                //   child: SelectableText(
                //     "Desktop: ${context.responsive.isDesktop}",
                //     style: context.textStyle.title,
                //   ),
                // ),
                // AdaptiveContainer(
                //   columnSpan: 12,
                //   child: SelectableText(
                //     "Desktop Large: ${context.responsive.isDesktopLarge}",
                //     style: context.textStyle.title,
                //   ),
                // ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText(
                    "Display Large",
                    style: context.textStyle.displayLarge,
                  ),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Display Medium",
                      style: context.textStyle.display),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Display Small",
                      style: context.textStyle.displaySmall),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Headline Large",
                      style: context.textStyle.headlineLarge),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Headline Medium",
                      style: context.textStyle.headline),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Headline Small",
                      style: context.textStyle.headlineSmall),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Title Large",
                      style: context.textStyle.titleLarge),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Title Medium",
                      style: context.textStyle.title),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Title Small",
                      style: context.textStyle.titleSmall),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Label Large",
                      style: context.textStyle.labelLarge),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Label Medium",
                      style: context.textStyle.label),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Label Small",
                      style: context.textStyle.labelSmall),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Body Large",
                      style: context.textStyle.bodyLarge),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Body Medium",
                      style: context.textStyle.body),
                ),
                AdaptiveContainer(
                  columnSpan: 4,
                  child: SelectableText("Body Small",
                      style: context.textStyle.bodySmall),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
