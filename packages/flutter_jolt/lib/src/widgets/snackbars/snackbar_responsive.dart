// // Copyright 2014 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// const double _singleLineVerticalPadding = 14.0;

// const Duration _snackBarTransitionDuration = Duration(milliseconds: 250);
// const Duration _snackBarDisplayDuration = Duration(milliseconds: 4000);
// const Curve _snackBarHeightCurve = Curves.fastOutSlowIn;
// const Curve _snackBarFadeInCurve =
//     Interval(0.45, 1.0, curve: Curves.fastOutSlowIn);
// const Curve _snackBarFadeOutCurve =
//     Interval(0.72, 1.0, curve: Curves.fastOutSlowIn);

// /// A lightweight message with an optional action which briefly displays at the
// /// bottom of the screen.
// ///
// /// {@youtube 560 315 https://www.youtube.com/watch?v=zpO6n_oZWw0}
// ///
// /// To display a snack bar, call `ScaffoldMessenger.of(context).showSnackBar()`,
// /// passing an instance of [SnackBar] that describes the message.
// ///
// /// To control how long the [SnackBar] remains visible, specify a [duration].
// ///
// /// A SnackBar with an action will not time out when TalkBack or VoiceOver are
// /// enabled. This is controlled by [AccessibilityFeatures.accessibleNavigation].
// ///
// /// {@tool dartpad}
// /// Here is an example of a [SnackBar] with an [action] button implemented using
// /// [SnackBarAction].
// ///
// /// ** See code in examples/api/lib/material/snack_bar/snack_bar.0.dart **
// /// {@end-tool}
// ///
// /// {@tool dartpad}
// /// Here is an example of a customized [SnackBar]. It utilizes
// /// [behavior], [shape], [padding], [width], and [duration] to customize the
// /// location, appearance, and the duration for which the [SnackBar] is visible.
// ///
// /// ** See code in examples/api/lib/material/snack_bar/snack_bar.1.dart **
// /// {@end-tool}
// ///
// /// See also:
// ///
// ///  * [ScaffoldMessenger.of], to obtain the current [ScaffoldMessengerState],
// ///    which manages the display and animation of snack bars.
// ///  * [ScaffoldMessengerState.showSnackBar], which displays a [SnackBar].
// ///  * [ScaffoldMessengerState.removeCurrentSnackBar], which abruptly hides the
// ///    currently displayed snack bar, if any, and allows the next to be displayed.
// ///  * [SnackBarAction], which is used to specify an [action] button to show
// ///    on the snack bar.
// ///  * [SnackBarThemeData], to configure the default property values for
// ///    [SnackBar] widgets.
// ///  * <https://material.io/design/components/snackbars.html>
// class SnackBarResponsive extends StatefulWidget implements SnackBar {
//   /// Creates a snack bar.
//   ///
//   /// The [content] argument must be non-null. The [elevation] must be null or
//   /// non-negative.
//   const SnackBarResponsive({
//     Key? key,
//     required this.content,
//     this.backgroundColor,
//     this.elevation,
//     this.margin,
//     this.padding,
//     this.width,
//     this.shape,
//     this.behavior,
//     this.action,
//     this.duration = _snackBarDisplayDuration,
//     this.animation,
//     this.onVisible,
//     this.dismissDirection = DismissDirection.down,
//     this.clipBehavior = Clip.hardEdge,
//   })  : assert(elevation == null || elevation >= 0.0),
//         assert(
//           width == null || margin == null,
//           'Width and margin can not be used together',
//         ),
//         super(key: key);

//   /// The primary content of the snack bar.
//   ///
//   /// Typically a [Text] widget.
//   @override
//   final Widget content;

//   /// The snack bar's background color. If not specified it will use
//   /// [SnackBarThemeData.backgroundColor] of [ThemeData.snackBarTheme]. If that
//   /// is not specified it will default to a dark variation of
//   /// [ColorScheme.surface] for light themes, or [ColorScheme.onSurface] for
//   /// dark themes.
//   @override
//   final Color? backgroundColor;

//   /// The z-coordinate at which to place the snack bar. This controls the size
//   /// of the shadow below the snack bar.
//   ///
//   /// Defines the card's [Material.elevation].
//   ///
//   /// If this property is null, then [SnackBarThemeData.elevation] of
//   /// [ThemeData.snackBarTheme] is used, if that is also null, the default value
//   /// is 6.0.
//   @override
//   final double? elevation;

//   /// Empty space to surround the snack bar.
//   ///
//   /// This property is only used when [behavior] is [SnackBarBehavior.floating].
//   /// It can not be used if [width] is specified.
//   ///
//   /// If this property is null, then the default is
//   /// `EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0)`.
//   @override
//   final EdgeInsetsGeometry? margin;

//   /// The amount of padding to apply to the snack bar's content and optional
//   /// action.
//   ///
//   /// If this property is null, the default padding values for:
//   ///
//   /// * [content]
//   ///     * Top and bottom paddings are 14.
//   ///     * Left padding is 24 if [behavior] is [SnackBarBehavior.fixed],
//   ///       16 if [behavior] is [SnackBarBehavior.floating]
//   ///     * Right padding is same as start padding if there is no [action], otherwise 0.
//   /// * [action]
//   ///     * Top and bottom paddings are 14
//   ///     * Left and right paddings are half of [content]'s left padding.
//   ///
//   /// If this property is not null, the padding assignment for:
//   ///
//   /// * [content]
//   ///     * Left, top and bottom paddings are assigned normally.
//   ///     * Right padding is assigned normally if there is no [action], otherwise 0.
//   /// * [action]
//   ///     * Left padding is replaced with half value of right padding.
//   ///     * Top and bottom paddings are assigned normally.
//   ///     * Right padding has an additional half value of right padding.
//   ///       ```dart
//   ///       right + (right / 2)
//   ///       ```
//   @override
//   final EdgeInsetsGeometry? padding;

//   /// The width of the snack bar.
//   ///
//   /// If width is specified, the snack bar will be centered horizontally in the
//   /// available space. This property is only used when [behavior] is
//   /// [SnackBarBehavior.floating]. It can not be used if [margin] is specified.
//   ///
//   /// If this property is null, then the snack bar will take up the full device
//   /// width less the margin.
//   @override
//   final double? width;

//   /// The shape of the snack bar's [Material].
//   ///
//   /// Defines the snack bar's [Material.shape].
//   ///
//   /// If this property is null then [SnackBarThemeData.shape] of
//   /// [ThemeData.snackBarTheme] is used. If that's null then the shape will
//   /// depend on the [SnackBarBehavior]. For [SnackBarBehavior.fixed], no
//   /// overriding shape is specified, so the [SnackBar] is rectangular. For
//   /// [SnackBarBehavior.floating], it uses a [RoundedRectangleBorder] with a
//   /// circular corner radius of 4.0.
//   @override
//   final ShapeBorder? shape;

//   /// This defines the behavior and location of the snack bar.
//   ///
//   /// Defines where a [SnackBar] should appear within a [Scaffold] and how its
//   /// location should be adjusted when the scaffold also includes a
//   /// [FloatingActionButton] or a [BottomNavigationBar]
//   ///
//   /// If this property is null, then [SnackBarThemeData.behavior] of
//   /// [ThemeData.snackBarTheme] is used. If that is null, then the default is
//   /// [SnackBarBehavior.fixed].
//   @override
//   final SnackBarBehavior? behavior;

//   /// (optional) An action that the user can take based on the snack bar.
//   ///
//   /// For example, the snack bar might let the user undo the operation that
//   /// prompted the snackbar. Snack bars can have at most one action.
//   ///
//   /// The action should not be "dismiss" or "cancel".
//   @override
//   final SnackBarAction? action;

//   /// The amount of time the snack bar should be displayed.
//   ///
//   /// Defaults to 4.0s.
//   ///
//   /// See also:
//   ///
//   ///  * [ScaffoldMessengerState.removeCurrentSnackBar], which abruptly hides the
//   ///    currently displayed snack bar, if any, and allows the next to be
//   ///    displayed.
//   ///  * <https://material.io/design/components/snackbars.html>
//   @override
//   final Duration duration;

//   /// The animation driving the entrance and exit of the snack bar.
//   @override
//   final Animation<double>? animation;

//   /// Called the first time that the snackbar is visible within a [Scaffold].
//   @override
//   final VoidCallback? onVisible;

//   /// The direction in which the SnackBar can be dismissed.
//   ///
//   /// Cannot be null, defaults to [DismissDirection.down].
//   @override
//   final DismissDirection dismissDirection;

//   /// {@macro flutter.material.Material.clipBehavior}
//   ///
//   /// Defaults to [Clip.hardEdge], and must not be null.
//   @override
//   final Clip clipBehavior;

//   // API for ScaffoldMessengerState.showSnackBar():

//   /// Creates an animation controller useful for driving a snack bar's entrance and exit animation.
//   static AnimationController createAnimationController(
//       {required TickerProvider vsync}) {
//     return AnimationController(
//       duration: _snackBarTransitionDuration,
//       debugLabel: 'SnackBarResponsive',
//       vsync: vsync,
//     );
//   }

//   /// Creates a copy of this snack bar but with the animation replaced with the given animation.
//   ///
//   /// If the original snack bar lacks a key, the newly created snack bar will
//   /// use the given fallback key.
//   @override
//   SnackBarResponsive withAnimation(Animation<double> newAnimation,
//       {Key? fallbackKey}) {
//     return SnackBarResponsive(
//       key: key ?? fallbackKey,
//       content: content,
//       backgroundColor: backgroundColor,
//       elevation: elevation,
//       margin: margin,
//       padding: padding,
//       width: width,
//       shape: shape,
//       behavior: behavior,
//       action: action,
//       duration: duration,
//       animation: newAnimation,
//       onVisible: onVisible,
//       dismissDirection: dismissDirection,
//       clipBehavior: clipBehavior,
//     );
//   }

//   @override
//   State<SnackBarResponsive> createState() => _SnackBarState();
// }

// class _SnackBarState extends State<SnackBarResponsive> {
//   bool _wasVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     widget.animation!.addStatusListener(_onAnimationStatusChanged);
//   }

//   @override
//   void didUpdateWidget(SnackBarResponsive oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.animation != oldWidget.animation) {
//       oldWidget.animation!.removeStatusListener(_onAnimationStatusChanged);
//       widget.animation!.addStatusListener(_onAnimationStatusChanged);
//     }
//   }

//   @override
//   void dispose() {
//     widget.animation!.removeStatusListener(_onAnimationStatusChanged);
//     super.dispose();
//   }

//   void _onAnimationStatusChanged(AnimationStatus animationStatus) {
//     switch (animationStatus) {
//       case AnimationStatus.dismissed:
//       case AnimationStatus.forward:
//       case AnimationStatus.reverse:
//         break;
//       case AnimationStatus.completed:
//         if (widget.onVisible != null && !_wasVisible) {
//           widget.onVisible!();
//         }
//         _wasVisible = true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     assert(debugCheckHasMediaQuery(context));
//     final MediaQueryData mediaQueryData = MediaQuery.of(context);
//     assert(widget.animation != null);
//     final ThemeData theme = Theme.of(context);
//     final ColorScheme colorScheme = theme.colorScheme;
//     final SnackBarThemeData snackBarTheme = theme.snackBarTheme;
//     final bool isThemeDark = theme.brightness == Brightness.dark;
//     final Color buttonColor =
//         isThemeDark ? colorScheme.primary : colorScheme.secondary;

//     // SnackBar uses a theme that is the opposite brightness from
//     // the surrounding theme.
//     final Brightness brightness =
//         isThemeDark ? Brightness.light : Brightness.dark;
//     final Color themeBackgroundColor = isThemeDark
//         ? colorScheme.onSurface
//         : Color.alphaBlend(
//             colorScheme.onSurface.withOpacity(0.80), colorScheme.surface);
//     final ThemeData inverseTheme = theme.copyWith(
//       colorScheme: ColorScheme(
//         primary: colorScheme.onPrimary,
//         secondary: buttonColor,
//         surface: colorScheme.onSurface,
//         background: themeBackgroundColor,
//         error: colorScheme.onError,
//         onPrimary: colorScheme.primary,
//         onSecondary: colorScheme.secondary,
//         onSurface: colorScheme.surface,
//         onBackground: colorScheme.background,
//         onError: colorScheme.error,
//         brightness: brightness,
//       ),
//     );

//     final TextStyle? contentTextStyle = snackBarTheme.contentTextStyle ??
//         ThemeData(brightness: brightness).textTheme.subtitle1;
//     final SnackBarBehavior snackBarBehavior =
//         widget.behavior ?? snackBarTheme.behavior ?? SnackBarBehavior.fixed;
//     assert(() {
//       // Whether the behavior is set through the constructor or the theme,
//       // assert that our other properties are configured properly.
//       if (snackBarBehavior != SnackBarBehavior.floating) {
//         String message(String parameter) {
//           final String prefix =
//               '$parameter can only be used with floating behavior.';
//           if (widget.behavior != null) {
//             return '$prefix SnackBarBehavior.fixed was set in the SnackBar constructor.';
//           } else if (snackBarTheme.behavior != null) {
//             return '$prefix SnackBarBehavior.fixed was set by the inherited SnackBarThemeData.';
//           } else {
//             return '$prefix SnackBarBehavior.fixed was set by default.';
//           }
//         }

//         assert(widget.margin == null, message('Margin'));
//         assert(widget.width == null, message('Width'));
//       }
//       return true;
//     }());

//     final bool isFloatingSnackBar =
//         snackBarBehavior == SnackBarBehavior.floating;
//     final double horizontalPadding = isFloatingSnackBar ? 16.0 : 24.0;
//     final EdgeInsetsGeometry padding = widget.padding ??
//         EdgeInsetsDirectional.only(
//             start: horizontalPadding,
//             end: widget.action != null ? 0 : horizontalPadding);

//     final double actionHorizontalMargin =
//         (widget.padding?.resolve(TextDirection.ltr).right ??
//                 horizontalPadding) /
//             2;

//     final CurvedAnimation heightAnimation =
//         CurvedAnimation(parent: widget.animation!, curve: _snackBarHeightCurve);
//     final CurvedAnimation fadeInAnimation =
//         CurvedAnimation(parent: widget.animation!, curve: _snackBarFadeInCurve);
//     final CurvedAnimation fadeOutAnimation = CurvedAnimation(
//       parent: widget.animation!,
//       curve: _snackBarFadeOutCurve,
//       reverseCurve: const Threshold(0.0),
//     );

//     Widget snackBar = Padding(
//       padding: padding,
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               padding: widget.padding == null
//                   ? const EdgeInsets.symmetric(
//                       vertical: _singleLineVerticalPadding)
//                   : null,
//               child: DefaultTextStyle(
//                 style: contentTextStyle!,
//                 child: widget.content,
//               ),
//             ),
//           ),
//           if (widget.action != null)
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: actionHorizontalMargin),
//               child: TextButtonTheme(
//                 data: TextButtonThemeData(
//                   style: TextButton.styleFrom(
//                     primary: buttonColor,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: horizontalPadding),
//                   ),
//                 ),
//                 child: widget.action!,
//               ),
//             ),
//         ],
//       ),
//     );

//     if (!isFloatingSnackBar) {
//       snackBar = SafeArea(
//         top: false,
//         child: snackBar,
//       );
//     }

//     final double elevation = widget.elevation ?? snackBarTheme.elevation ?? 6.0;
//     final Color backgroundColor = widget.backgroundColor ??
//         snackBarTheme.backgroundColor ??
//         inverseTheme.colorScheme.background;
//     final ShapeBorder? shape = widget.shape ??
//         snackBarTheme.shape ??
//         (isFloatingSnackBar
//             ? const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(4.0)))
//             : null);

//     snackBar = Material(
//       shape: shape,
//       elevation: elevation,
//       color: backgroundColor,
//       child: Theme(
//         data: inverseTheme,
//         child: mediaQueryData.accessibleNavigation
//             ? snackBar
//             : FadeTransition(
//                 opacity: fadeOutAnimation,
//                 child: snackBar,
//               ),
//       ),
//     );

//     if (isFloatingSnackBar) {
//       const double topMargin = 5.0;
//       const double bottomMargin = 10.0;
//       // If width is provided, do not include horizontal margins.
//       if (widget.width != null) {
//         snackBar = Container(
//           margin: const EdgeInsets.only(top: topMargin, bottom: bottomMargin),
//           width: widget.width,
//           child: snackBar,
//         );
//       } else {
//         const double horizontalMargin = 15.0;
//         snackBar = Padding(
//           padding: widget.margin ??
//               const EdgeInsets.fromLTRB(
//                 horizontalMargin,
//                 topMargin,
//                 horizontalMargin,
//                 bottomMargin,
//               ),
//           child: snackBar,
//         );
//       }
//       snackBar = SafeArea(
//         top: false,
//         bottom: false,
//         child: snackBar,
//       );
//     }

//     snackBar = Semantics(
//       container: true,
//       liveRegion: true,
//       onDismiss: () {
//         ScaffoldMessenger.of(context)
//             .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
//       },
//       child: Dismissible(
//         key: const Key('dismissible'),
//         direction: widget.dismissDirection,
//         resizeDuration: null,
//         onDismissed: (DismissDirection direction) {
//           ScaffoldMessenger.of(context)
//               .removeCurrentSnackBar(reason: SnackBarClosedReason.swipe);
//         },
//         child: snackBar,
//       ),
//     );

//     final Widget snackBarTransition;
//     if (mediaQueryData.accessibleNavigation) {
//       snackBarTransition = snackBar;
//     } else if (isFloatingSnackBar) {
//       snackBarTransition = FadeTransition(
//         opacity: fadeInAnimation,
//         child: snackBar,
//       );
//     } else {
//       snackBarTransition = AnimatedBuilder(
//         animation: heightAnimation,
//         builder: (BuildContext context, Widget? child) {
//           return Align(
//             alignment: AlignmentDirectional.topStart,
//             heightFactor: heightAnimation.value,
//             child: child,
//           );
//         },
//         child: snackBar,
//       );
//     }

//     return Hero(
//       tag: '<SnackBarResponsive Hero tag - ${widget.content}>',
//       child: ClipRect(
//         clipBehavior: widget.clipBehavior,
//         child: snackBarTransition,
//       ),
//     );
//   }
// }
