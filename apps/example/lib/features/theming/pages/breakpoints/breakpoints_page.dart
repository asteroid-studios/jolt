import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
@RoutePage()
class BreakpointsPage extends StatelessWidget {
  ///
  const BreakpointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold.scrollView(
      windowTitle: 'Breakpoints',
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current',
              ),
              Text(
                context.view.breakpoint.name,
                style: context.style.display,
              ),
              Text(
                'Max-width: ${context.view.breakpoint.maxWidth}px',
              ),
              Text(
                'Current-width: ${context.mediaQuery.size.width}px',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
