import 'package:persistent_header_adaptive/adaptive_height_sliver_persistent_header.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:jolt/jolt.dart';

///
class Scaffold extends StatelessWidget {
  ///
  const Scaffold({
    required this.title,
    required Widget this.content,
    this.sidebarLeft,
    this.sidebarRight,
    this.footer,
    super.key,
  });

  ///
  final String title;

  ///
  final Widget? content;

  ///
  final Widget? sidebarLeft;

  ///
  final Widget? sidebarRight;

  ///
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    if (content == null) return const SizedBox.shrink();

    return Title(
      title: title,
      color: context.color.primary,
      child: content!,
      // child: SelectionArea(
      //   child: CustomScrollView(
      //     slivers: [
      //       AdaptiveHeightSliverPersistentHeader(
      //         pinned: true,
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: Text(title),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SliverFillRemaining(
      //         child: content,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
