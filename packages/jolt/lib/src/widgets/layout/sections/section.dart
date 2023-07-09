import 'dart:ui';

import 'package:persistent_header_adaptive/adaptive_height_sliver_persistent_header.dart';

import 'package:jolt/jolt.dart';

///
class Section extends StatelessWidget {
  ///
  const Section({
    required this.child,
    this.pinned = false,
    this.floating = false,
    this.fullWidth = false,
    this.blurredBackground = false,
    this.background,
    this.verticalPadding,
    super.key,
  });

  /// Make the section take up the full available width.
  final bool fullWidth;

  /// Make the section pinned.
  final bool pinned;

  /// Make the section floating.
  final bool floating;

  /// Whether to blur the background.
  final bool blurredBackground;

  /// Provide a background color for the section.
  final JoltColor? background;

  /// Set the vertical padding for the section
  final double? verticalPadding;

  /// Provide
  // final String? id;

  /// The child widget to display in the section.
  final Widget child;

  bool get _pinnedOrFloating => pinned || floating;

  @override
  Widget build(BuildContext context) {
    // TODO account for if section is flush with top of screen, account for safe area.
    Widget section = Surface(
      setDefaultStyleForChildren: background != null,
      background: background,
      fallbackStyle: SurfaceStyle(
        background: context.color.background,
        borderRadius: BorderRadius.zero,
        borderWidth: 0,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? context.spacing.lg,
          horizontal: context.spacing.lg,
        ),
      ),
      child: Center(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: fullWidth ? double.infinity : 900,
          ),
          child: child,
        ),
      ),
    );

    if (blurredBackground) {
      section = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: section,
        ),
      );
    }

    if (_pinnedOrFloating) {
      // TODO right not pinned headers don't update on theme change or spacing changes.
      return AdaptiveHeightSliverPersistentHeader(
        pinned: pinned,
        floating: floating,
        child: section,
      );
    }
    return section;
  }
}
