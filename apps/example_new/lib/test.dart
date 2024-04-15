import 'package:ui/ui.dart';

// extension Test on TextStyle Function(BuildContext) {
//   TextStyle colored(Color color) => this.copyWith(color: color);
// }

class Fonts {
  static TextStyle heading = ThemeProvider.theme.typography.heading;
}

// class Colors {
//   static Color primary = ThemeProvider.theme.colorScheme.primary;
// }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  String get label => 'Test';

  @override
  Widget build(BuildContext context) {
    return context.responsive(
      Column(
        children: [
          Text(label, style: Fonts.heading),
          Text(
            label,
            style: Fonts.heading.colored(
              Colors.rose.dark(Colors.rose.shade100),
            ),
          ),
          Button(label: label.responsive(desktop: 'Woo'), color: Colors.rose),
        ],
      ),
      desktop: const Text('Test'),
    );
  }
}
