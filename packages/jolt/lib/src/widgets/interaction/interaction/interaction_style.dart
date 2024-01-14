import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolt/jolt.dart';

part 'interaction_style.freezed.dart';

///
@freezed
class InteractionStyle
    with _$InteractionStyle
    implements Style<InteractionStyle> {
  /// Defines the style of an [Interaction] widget
  const factory InteractionStyle({
    bool? canHover,
    bool? canTap,
  }) = _InteractionStyle;

  const InteractionStyle._();

  @override
  InteractionStyle merge(InteractionStyle? style) {
    return copyWith(
      canHover: canHover ?? style?.canHover,
      canTap: canTap ?? style?.canTap,
    );
  }
}
