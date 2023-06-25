import 'package:ui/ui.dart';

import 'package:example/components/widget_render/widget_render.dart';
import 'package:example/utils/router/router.dart';

///
@RoutePage()
class TypographyPage extends StatelessWidget {
  ///
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = Spacing.sm();
    return Scaffold(
      title: 'Typography',
      content: Padding(
        padding: EdgeInsets.all(
          context.responsive<double>(desktop: context.spacing.section) ??
              context.spacing.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetRender(
              title: 'How to use text styles',
              code: '''Text(
  'Heading',
  // swap out heading for the desired style
  style: context.style.heading,
)''',
              child: Text(
                'Heading',
                style: context.style.heading,
              ),
            ),
            Text(
              'Hero large',
              style: context.style.heroLarge,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Hero ',
              style: context.style.hero,
              color: context.color.surface.foregroundLight,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Hero small',
              style: context.style.heroSmall,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Display large',
              style: context.style.displayLarge,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Display',
              style: context.style.display,
              overflow: TextOverflow.ellipsis,
              color: context.color.surface.foregroundLight,
            ),
            spacer,
            Text(
              'Display small',
              style: context.style.displaySmall,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Heading large',
              style: context.style.headingLarge,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Heading',
              style: context.style.heading,
              overflow: TextOverflow.ellipsis,
              color: context.color.surface.foregroundLight,
            ),
            spacer,
            Text(
              'Heading small',
              style: context.style.headingSmall,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Body large',
              style: context.style.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Body',
              style: context.style.body,
              overflow: TextOverflow.ellipsis,
              color: context.color.surface.foregroundLight,
            ),
            spacer,
            Text(
              'Body small',
              style: context.style.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Label Large',
              style: context.style.labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
            spacer,
            Text(
              'Label',
              style: context.style.label,
              overflow: TextOverflow.ellipsis,
              color: context.color.surface.foregroundLight,
            ),
            spacer,
            Text(
              'Label small',
              style: context.style.labelSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
