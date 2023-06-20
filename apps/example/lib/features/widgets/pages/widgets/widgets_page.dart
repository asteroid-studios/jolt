import 'package:ui/ui.dart';

import 'package:example/components/widget_render/widget_render.dart';
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
  onTap: () {},
  label: 'Label',
),
''';
      return WidgetRender(
        title: 'Button with label',
        code: code,
        child: Button(
          onTap: () {},
          label: 'Label',
        ),
      );
    }

    Widget iconButton() {
      const code = '''
Button(
  onTap: () {},
  icon: Icons.house,
),
''';
      return WidgetRender(
        title: 'Button with icon',
        code: code,
        child: Button(
          onTap: () {},
          icon: Icons.house,
        ),
      );
    }

    Widget comboButton() {
      const code = '''
Button(
  onTap: () {},
  label: 'Home',
  icon: Icons.house,
),
''';
      return WidgetRender(
        title: 'Button with icon',
        code: code,
        child: Button(
          onTap: () {},
          label: 'Home',
          icon: Icons.house,
        ),
      );
    }

    Widget disabledButton() {
      const code = '''
Button(
  onTap: null,
  label: 'Home',
  icon: Icons.house,
),
''';
      return const WidgetRender(
        title: 'Button disabled',
        code: code,
        child: Button(
          label: 'Home',
          icon: Icons.house,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = context.responsive<int>(desktop: 2, tv: 3) ?? 1;
        final itemWidth = constraints.maxWidth / crossAxisCount;
        return Scaffold(
          title: 'Widgets',
          content: Padding(
            padding: EdgeInsets.all(context.sizing.md),
            child: Container(
              height: context.mediaQuery.size.height - 300,
              // TODO convert to a sliverList
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: context.sizing.md,
                childAspectRatio: itemWidth / 300,
                children: [
                  labelButton(),
                  iconButton(),
                  comboButton(),
                  disabledButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
