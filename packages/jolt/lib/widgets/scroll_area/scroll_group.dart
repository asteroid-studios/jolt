import 'package:jolt/jolt.dart';

///
class ScrollGroup extends StatelessWidget {
  /// Similar to SliverMainAxisGroup, but takes any kind of widget, sliver or not.
  ///
  /// Useful if you want pinned headers to
  /// only be pinned within a certain group of widgets.
  const ScrollGroup({required this.children, super.key});

  ///
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: children.map((child) => JoltSliver(child: child)).toList(),
    );
  }
}
