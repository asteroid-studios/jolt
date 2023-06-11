// Flutter exports
import 'package:hive_flutter/hive_flutter.dart';

export 'package:flutter/widgets.dart'
    hide Column, Form, FormField, FormFieldState, FormState, Icon, Row, Text;
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

// Basics exports
export 'src/widgets/basics/column/column.dart';
export 'src/widgets/basics/row/row.dart';
export 'src/widgets/basics/surface/surface.dart';
export 'src/widgets/basics/text/text.dart';
export 'src/widgets/basics/interaction/interaction.dart';
export 'src/widgets/basics/icon/icon.dart';
export 'src/widgets/basics/size_reporting_widget/size_reporting_widget.dart';
export 'src/widgets/basics/spacing/spacing.dart';
export 'src/widgets/basics/pop_over/pop_over.dart';

// Widget exports
export 'src/widgets/button/button.dart';
export 'src/widgets/progress_indicator/circular_progress_indicator.dart';
export 'src/widgets/progress_indicator/linear_progress_indicator.dart';
export 'src/widgets/overlay/overlay_stack.dart';
export 'src/layouts/scaffold/scaffold.dart';
export 'src/layouts/shell/shell.dart' hide InheritedShell;
export 'src/widgets/tooltip/tooltip.dart';
export 'src/widgets/text_field/text_field.dart';

// Utils exports
export 'src/utils/duration/durations.dart';
export 'src/utils/icons/icons.dart';
export 'src/utils/overlay/overlay.dart';
export 'src/utils/responsive/responsive.dart';
export 'src/utils/theme/theme_extensions.dart';
export 'src/utils/theme/widget_theme.dart';
export 'src/utils/platform/platform.dart';

///
class Jolt {
  /// The Hive key for storing Jolt preferences.
  static const storageKey = 'joltPreferences';

  /// Initializes Jolt.
  static Future<void> initJolt({bool initializeHive = true}) async {
    if (initializeHive) await Hive.initFlutter();
    await Hive.openBox<dynamic>(Jolt.storageKey);
  }
}
