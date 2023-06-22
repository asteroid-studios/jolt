import 'package:jolt/jolt.dart';

extension InteractionX on InteractionState? {
  bool get isMaybeHovered => this?.isHovered ?? false;
}
