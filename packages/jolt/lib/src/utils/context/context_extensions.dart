import 'package:jolt/jolt.dart';

///
extension ContextX on BuildContext {
  /// Return the inherited objects from the current context
  ContextInherited get inherited => ContextInherited(this);
}

///
class ContextInherited {
  ///
  const ContextInherited(this._context);

  final BuildContext _context;

  /// Return the closest SurfaceStyle from the currentContext
  SurfaceStyle get surfaceStyle => DefaultSurfaceStyle.of(_context);

  /// Return the closest SurfaceColor from the currentContext
  SurfaceColor get surfaceColor =>
      (surfaceStyle.background ?? _context.color.background)
          .asJoltColor
          .surface(state: interactionState);

  /// Return the closest WidgetTheme from the currentContext
  WidgetTheme get widgetTheme => DefaultWidgetTheme.of(_context);

  /// Return the closest InteractionState from the currentContext
  InteractionState? get interactionState => Interaction.maybeOf(_context);

  /// Return the closest DefaultTextStyle from the currentContext
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(_context);
}
