import 'package:go_router/go_router.dart';
import 'package:ui/ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Home',
          style: Fonts.heading,
        ),
        const Gap.sm(),
        Button(
          label: 'Buttons'.text,
          onTap: () => context.go('/buttons'),
        ),
      ],
    );
  }
}
