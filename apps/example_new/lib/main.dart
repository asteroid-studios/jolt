import 'package:collection/collection.dart';
import 'package:ui/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Color(0xff0000FF),
      title: 'Flutter Demo',
      builder: (context, child) {
        return const MyHomePage(title: 'Flutter Demo Home Page');
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return const ColoredBox(
      color: Color.fromARGB(255, 12, 12, 15),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalColorSpread(color: Color(0xff10b981), name: 'Random'),
            SizedBox(width: 100),
            NormalColorSpread(color: Color(0xff0ea5e9), name: 'Random'),
            SizedBox(width: 100),
            NormalColorSpread(color: Color(0xff8b5cf6), name: 'Random'),
            SizedBox(width: 100),
            NormalColorSpread(color: Color(0xffec4899), name: 'Random'),
            SizedBox(width: 100),
            NormalColorSpread(color: Color(0xfff59e0b), name: 'Random'),
            SizedBox(width: 100),
            NormalColorSpread(color: Color(0xffef4444), name: 'Random'),
            SizedBox(width: 100),
            NormalColorSpread(color: Colors.black, name: 'Black'),
            SizedBox(width: 100),
            NormalColorSpread(color: Color(0xffcbd5e1), name: 'Random'),
          ],
        ),
      ),
    );
  }
}

class ColorSpread extends StatelessWidget {
  const ColorSpread({required this.color, super.key});

  final ColorSwatch color;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        color.name,
        style: context.text.heading.copyWith(color: color),
      ),
      Text(
        'H: ${color.as.hsl.hue.toStringAsFixed(2)}',
        style: context.text.heading.copyWith(color: color),
      ),
      Text(
        'S: ${color.as.hsl.saturation.toStringAsFixed(2)}',
        style: context.text.heading.copyWith(color: color),
      ),
      Text(
        'L: ${color.as.hsl.lightness.toStringAsFixed(2)}',
        style: context.text.heading.copyWith(color: color),
      ),
      ...color.shades.mapIndexed((i, c) {
        final hex = c.value.toRadixString(16).characters.skip(2).toString();
        return Row(
          children: [
            Text(
              hex.characters.take(3).toString(),
              style: context.text.display.copyWith(
                color: c,
              ),
            ),
            Text(
              hex.characters.skip(3).toString(),
              style: context.text.display.copyWith(
                color: Color(color.value).shades[i],
              ),
            ),
          ],
        );
      }),
    ]);
  }
}

class NormalColorSpread extends StatelessWidget {
  const NormalColorSpread({required this.color, required this.name, super.key});

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        name,
        style: context.text.heading.copyWith(color: color),
      ),
      Text(
        'H: ${color.as.hsl.hue.toStringAsFixed(2)}',
        style: context.text.heading.copyWith(color: color),
      ),
      Text(
        'S: ${color.as.hsl.saturation.toStringAsFixed(2)}',
        style: context.text.heading.copyWith(color: color),
      ),
      Text(
        'L: ${color.as.hsl.lightness.toStringAsFixed(2)}',
        style: context.text.heading.copyWith(color: color),
      ),
      ...color.shades.mapIndexed((i, c) {
        final hex = c.value.toRadixString(16).characters.skip(2).toString();
        return Container(
          color: c.as.foreground,
          width: 200,
          height: 80,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hex,
                  style: context.text.heading.sm.copyWith(
                    color: c.as.foreground.as.foreground,
                  ),
                ),
                Text(
                  hex,
                  style: context.text.label.lg.w600.copyWith(
                    color: c.as.foregroundLight,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ]);
  }
}
