// ignore_for_file: library_private_types_in_public_api

import 'package:jolt/jolt.dart';

///
extension SizeReportingWidgetExtensions on Widget {
  /// Wrap this widget with a [SizeReportingWidget] to get notified when the
  /// widget's size changes.
  Widget reportSize({
    required ValueChanged<Size> onSizeChange,
  }) =>
      SizeReportingWidget(
        onSizeChange: onSizeChange,
        child: this,
      );
}

///
class SizeReportingWidget extends StatefulWidget {
  ///
  const SizeReportingWidget({
    required this.child,
    required this.onSizeChange,
    super.key,
  });

  ///
  final Widget child;

  ///
  final ValueChanged<Size> onSizeChange;

  @override
  _SizeReportingWidgetState createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  final _widgetKey = GlobalKey();
  Size? _oldSize;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: Container(
          key: _widgetKey,
          child: widget.child,
        ),
      ),
    );
  }

  void _notifySize() {
    final box = _widgetKey.currentContext?.findRenderObject();
    if (box is RenderBox) {
      final size = box.size;
      if (_oldSize != size) {
        _oldSize = size;
        widget.onSizeChange(size);
      }
    }
  }
}
