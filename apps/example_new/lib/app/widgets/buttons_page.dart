import 'package:go_router/go_router.dart';
import 'package:ui/ui.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Buttons',
          style: Fonts.heading,
        ),
        const Gap.sm(),
        Button(
          label: 'back'.text,
          onTap: () => context.pop(),
        ),
      ],
    );
  }
}
