// Flutter exports
export 'package:flutter/widgets.dart' hide Icon, Text;
export 'package:flutter/material.dart' show Scrollbar, SelectionArea;

// Package exports
export 'package:tinycolor2/tinycolor2.dart';

// Export the JoltApp widget
export 'src/app/app.dart';
export 'src/app/app_controller.dart';

// Theming exports
export 'src/theme/color/jolt_color.dart';
export 'src/theme/color_scheme/color_scheme.dart';
export 'src/theme/colors/colors.dart';
export 'src/theme/dimensions/dimensions.dart';
export 'src/theme/themes/themes.dart';
export 'src/theme/scaling/scaling.dart';
export 'src/theme/theme_data/theme_data.dart';
export 'src/theme/typography/typography.dart';

// Widget export
export 'src/widgets/button/button.dart';
export 'src/widgets/control_builder/control_builder.dart';
export 'src/widgets/icon/icon.dart';
export 'src/widgets/overlay/overlay_stack.dart';
export 'src/widgets/spacing/spacing.dart';
export 'src/widgets/surface/surface.dart';
export 'src/widgets/text/text.dart';
export 'src/widgets/scaffold/scaffold.dart';
export 'src/widgets/shell/shell.dart' hide InheritedShell;
export 'src/widgets/tooltip/tooltip.dart';

// Utils exports
export 'src/utils/icons/icons.dart';
export 'src/utils/overlay/overlay.dart';
export 'src/utils/responsive/bounds.dart';
export 'src/utils/responsive/edge_insets.dart';
export 'src/utils/theme/theme_extensions.dart';
export 'src/utils/theme/widget_theme.dart';
export 'src/utils/platform/platform.dart';
