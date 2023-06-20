import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';

///
@RoutePage()
class BreakpointsPage extends StatelessWidget {
  ///
  const BreakpointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      title: 'Breakpoints',
      content: Center(
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
              'Max-width: ${context.view.breakpoint.maxWidth}',
            ),
          ],
        ),
      ),
    );
  }
}
