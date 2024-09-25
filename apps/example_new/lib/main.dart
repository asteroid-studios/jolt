import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:example_new/components/app.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:ui/ui.dart';
// import 'package:ui/ui.dart';

void main() {
  usePathUrlStrategy();

  runApp(const App());
  if (Platform.isDesktop) {
    // doWhenWindowReady(() {
    const initialSize = Size(350, 450);
    appWindow.minSize = initialSize;
    // appWindow.size = initialSize;
    // appWindow.alignment = Alignment.center;
    appWindow.show();
    // });
  }
}

// final test = mat.ExpansionTile();

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>  {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       color: color.background,
//       child: Center(
//         child: SingleChildScrollView(
//           child: Wrap(
//             children: [
//               // Text(
//               //   'Testing',
//               //   style: text.hero.lg.bold.colored(
//               //     color.primary.swatch.shade600,
//               //     dark: color.primary.swatch.shade400,
//               //   ),
//               // ),
//               const NormalColorSpread(
//                   foreground: Colors.emerald, name: 'Emerald'),
//               NormalColorSpread(
//                 foreground: Color(Colors.emerald.shade600.value),
//                 name: 'SkyEmerald',
//               ),
//               const SizedBox(width: 100),
//               const NormalColorSpread(foreground: Colors.sky, name: 'Sky'),
//               NormalColorSpread(
//                 foreground: Color(Colors.sky.shade600.value),
//                 name: 'Sky',
//               ),
//               const SizedBox(width: 100),
//               const NormalColorSpread(
//                   foreground: Colors.violet, name: 'Violet'),
//               NormalColorSpread(
//                 foreground: Color(Colors.violet.shade600.value),
//                 name: 'Violet',
//               ),
//               const SizedBox(width: 100),
//               const NormalColorSpread(foreground: Colors.rose, name: 'Rose'),
//               NormalColorSpread(
//                 foreground: Color(Colors.rose.shade600.value),
//                 name: 'Rose',
//               ),
//               const SizedBox(width: 100),
//               const NormalColorSpread(foreground: Colors.slate, name: 'Amber'),
//               NormalColorSpread(
//                 foreground: Color(Colors.slate.value),
//                 name: 'Amber',
//               ),
//               const SizedBox(width: 100),
//               const NormalColorSpread(foreground: Colors.black, name: 'Black'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NormalColorSpread extends StatelessWidget  {
//   const NormalColorSpread(
//       {required this.foreground, required this.name, super.key});

//   final Color foreground;
//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       Text(
//         name,
//         style: text.heading.copyWith(color: foreground),
//       ),
//       Text(
//         'H: ${foreground.as.hsl.hue.toStringAsFixed(2)}',
//         style: text.heading.copyWith(color: foreground),
//       ),
//       Text(
//         'S: ${foreground.as.hsl.saturation.toStringAsFixed(2)}',
//         style: text.heading.copyWith(color: foreground),
//       ),
//       Text(
//         'L: ${foreground.as.hsl.lightness.toStringAsFixed(2)}',
//         style: text.heading.copyWith(color: foreground),
//       ),
//       ...(foreground is ColorSwatch
//               ? (foreground as ColorSwatch).shades
//               : foreground.shades)
//           .mapIndexed((i, c) {
//         final hex = c.value.toRadixString(16).characters.skip(2).toString();
//         return Area(c, hex);
//       }),
//     ]);
//   }
// }

// class Area extends StatefulWidget {
//   const Area(this.background, this.hex, {super.key});

//   final Color background;
//   final String hex;

//   @override
//   State<Area> createState() => _AreaState();
// }

// class _AreaState extends State<Area> {
//   bool isHovering = false;

//   @override
//   Widget build(BuildContext context) {
//     final background =
//         isHovering ? widget.background.as.active : widget.background;

//     return GestureDetector(
//       onTap: () async {
//         ThemeProvider.of(context)?.toggleTheme();
//         final delete = await context.show<bool>(
//               // TotallyCustomDialog(),
//               // BottomSheet(),
//               // Drawer(),
//               Dialog(
//                 title: 'Delete Jolt',
//                 content: 'Are you sure you want to delete this jolt?',
//                 onCancel: () => false,
//                 onConfirm: () {
//                   context.show(Drawer(
//                     title: 'Test',
//                   ));
//                   return true;
//                 },
//               ),
//             ) ??
//             false;
//         // print(delete);
//       },
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         onEnter: (_) => setState(() => isHovering = true),
//         onExit: (_) => setState(() => isHovering = false),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           decoration: BoxDecoration(
//             color: background,
//             border: Border.all(color: widget.background, width: 5),
//           ),
//           width: 174,
//           height: 80,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(width: 16),
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: background.weaken(),
//                 ),
//                 width: 20,
//                 height: 20,
//               ),
//               const SizedBox(width: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '#${widget.hex}',
//                     style: context.text.body.bold.colored(
//                       widget.background.as.foreground,
//                     ),
//                   ),
//                   Text(
//                     widget.hex,
//                     style: context.text.label.colored(
//                       widget.background.as.foregroundLight,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TextPage extends StatelessWidget  {
//   const TextPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final background = Colors.grey.shade50;

//     return ColoredBox(
//       color: background,
//       child: DefaultTextStyle(
//         style: TextStyle(color: background.as.foreground),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () => Navigator.of(context).pop(),
//                 child: Text(
//                   'Back',
//                   style: text.heading.colored(Colors.rose),
//                 ),
//               ),
//               Text(
//                 'Hero large',
//                 style: text.hero.lg.withColorForegroundLight(context),
//               ),
//               Text(
//                 'Jolt',
//                 style: text.hero.colored(color.primary),
//               ),
//               Text(
//                 'Hero small',
//                 style: text.hero.sm,
//               ),
//               Text(
//                 'Display large',
//                 style: text.display.lg,
//               ),
//               Text(
//                 'Display',
//                 style: text.display.colored(color.primary),
//               ),
//               Text(
//                 'Display small',
//                 style: text.display.sm,
//               ),
//               Text(
//                 'Heading large',
//                 style: text.heading.lg,
//               ),
//               Text(
//                 'Heading',
//                 style: text.heading.colored(color.primary),
//               ),
//               Text(
//                 'Heading small',
//                 style: text.heading.sm,
//               ),
//               Text(
//                 'Body large',
//                 style: text.body.lg,
//               ),
//               Text(
//                 'Body',
//                 style: text.body.colored(color.primary),
//               ),
//               Text(
//                 'Body small',
//                 style: text.body.sm,
//               ),
//               Text(
//                 'Label large',
//                 style: text.label.lg,
//               ),
//               Text(
//                 'Label',
//                 style: text.label.colored(color.primary),
//               ),
//               Text(
//                 'Label small',
//                 style: text.label.sm,
//               ),
//               const SizedBox(height: 60),
//               Text(
//                 'Heading',
//                 style: text.heading,
//               ),
//               Text(
//                 'Some body text',
//                 style: text.body.colored(background.as.foregroundLight),
//               ),
//               Container(
//                 height: 2,
//                 margin: const EdgeInsets.symmetric(vertical: 16),
//                 width: 80,
//                 color: background.shade200,
//               ),
//               Text(
//                 'A sentence here about something Im not sure what',
//                 style: context.text.body,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ///
// class TotallyCustomDialog extends StatelessWidget
//     , BottomSheetRoute {
//   ///
//   const TotallyCustomDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => context.show(Dialog(
//         title: 'Test',
//       )),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         color: color.surface,
//         child: Text(
//           'Test',
//           style: text.heading.colored(color.tertiary),
//         ),
//       ),
//     );
//   }

//   // @override
//   // DrawerAlignment get alignment => DrawerAlignment.bottom;

//   // @override
//   // double? get crossAxisSize => 400;
// }
