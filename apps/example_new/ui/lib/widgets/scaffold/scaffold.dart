import 'package:ui/ui.dart';

///
class Scaffold extends StatelessWidget with ThemeValues {
  ///
  const Scaffold({
    required this.content,
    this.appBar,
    super.key,
  });

  ///
  final Widget? appBar;

  ///
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.background,
      child: Column(
        children: [
          if (appBar != null) appBar!,
          Expanded(child: content),
        ],
      ),
    );
  }
}
