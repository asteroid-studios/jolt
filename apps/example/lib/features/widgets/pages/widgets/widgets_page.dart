import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
@RoutePage()
class WidgetsPage extends StatelessWidget {
  ///
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget labelButton() {
      const code = '''
Button(
  onPressed: () {},
  label: 'Label',
),''';
      return WidgetRender(
        title: 'Button with label',
        code: code,
        child: Button(
          onPressed: () {},
          label: 'Label',
        ),
      );
    }

    Widget iconButton() {
      const code = '''
Button(
  onPressed: () {},
  icon: Icons.house,
),''';
      return WidgetRender(
        title: 'Button with icon',
        code: code,
        child: Button(
          onPressed: () {},
          icon: Icons.house,
        ),
      );
    }

    Widget comboButton() {
      const code = '''
Button(
  onPressed: () {},
  label: 'Home',
  icon: Icons.house,
),''';
      return WidgetRender(
        title: 'Button with icon',
        code: code,
        child: Button(
          onPressed: () {},
          label: 'Home',
          icon: Icons.house,
        ),
      );
    }

    Widget disabledButton() {
      const code = '''
Button(
  onPressed: null,
  label: 'Home',
  icon: Icons.house,
),''';
      return WidgetRender(
        title: 'Button disabled',
        height: context.responsive(desktop: 300) ?? 500,
        code: code,
        child: Button(
          label: 'Home',
          icon: Icons.house,
        ),
      );
    }

    final children = [
      labelButton(),
      iconButton(),
      comboButton(),
      disabledButton(),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = context.responsive<int>(desktop: 2) ?? 1;
        final itemWidth = constraints.maxWidth / crossAxisCount;
        return SafeArea(
          child: Scaffold.scrollView(
            windowTitle: 'Widgets',
            children: [
              Button(
                label: 'Layouts',
                onPressed: () {
                  context.navigateTo(LayoutsRoute());
                },
              ),
              Padding(
                padding: EdgeInsets.all(context.spacing.md),
                child: context.view.isTabletOrLarger
                    ? Container(
                        height: context.mediaQuery.size.height - 300,
                        // TODO convert to a sliverList

                        child: GridView.count(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: context.spacing.md,
                          childAspectRatio: itemWidth / 300,
                          children: children,
                        ),
                      )
                    : Column(children: children),
              ),
            ],
          ),
        );
      },
    );
  }
}
