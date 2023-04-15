import 'package:jolt/jolt.dart';

/// A widget that displays text.
class JoltText extends StatelessWidget {
  /// A widget that displays text.
  const JoltText(
    String this.data, {
    this.style,
    this.color,
    this.weight,
    super.key,
  });

  ///
  final String? data;

  ///
  final TextStyle? style;

  ///
  final Color? color;

  ///
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = style ?? context.textStyle.body;
    return Baseline(
      baseline: (defaultTextStyle.fontSize ?? 16) + 2,
      baselineType: TextBaseline.alphabetic,
      child: Text(
        data ?? '',
        style: defaultTextStyle.copyWith(
          color: color,
          fontWeight: weight,
        ),
      ),
    );
  }
}
