import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ui/ui.dart';

/// Regular Phosphor Icons
typedef Icons = PhosphorIconsRegular;

/// Bold Phosphor Icons
typedef IconsBold = PhosphorIconsBold;

/// Duotone Phosphor Icons
typedef IconsDuotone = PhosphorIconsDuotone;

/// Filled Phosphor Icons
typedef IconsFill = PhosphorIconsFill;

/// Thin Phosphor Icons
typedef IconsThin = PhosphorIconsThin;

/// Light Phosphor Icons
typedef IconsLight = PhosphorIconsLight;

///
extension IconsX on IconData {
  ///
  Icon get icon => Icon(this);
}
