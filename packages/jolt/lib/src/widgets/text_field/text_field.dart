// import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

// import 'package:flutter/cupertino.dart'
//     show cupertinoDesktopTextSelectionControls, cupertinoTextSelectionControls;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart'
//     show
//         AdaptiveTextSelectionToolbar,
//         Feedback,
//         TextMagnifier,
//         debugCheckHasMaterialLocalizations,
//         desktopTextSelectionControls,
//         iOSHorizontalOffset,
//         materialTextSelectionControls;
// import 'package:flutter/services.dart';

// import 'package:jolt/jolt.dart';
// export 'package:flutter/services.dart'
//     show
//         SmartDashesType,
//         SmartQuotesType,
//         TextCapitalization,
//         TextInputAction,
//         TextInputType;

// /// A Jolt text field.
// class TextField extends StatefulWidget {
//   /// Creates a Jolt text field.
//   const TextField({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.focusNode,
//     TextInputType? keyboardType,
//     this.textInputAction,
//     this.textCapitalization = TextCapitalization.none,
//     this.style,
//     this.strutStyle,
//     this.textAlign = TextAlign.start,
//     this.textAlignVertical,
//     this.textDirection,
//     this.readOnly = false,
//     this.showCursor,
//     this.autofocus = false,
//     this.obscuringCharacter = '•',
//     this.obscureText = false,
//     this.autocorrect = true,
//     SmartDashesType? smartDashesType,
//     SmartQuotesType? smartQuotesType,
//     this.enableSuggestions = true,
//     this.maxLines = 1,
//     this.minLines,
//     this.expands = false,
//     this.maxLength,
//     this.maxLengthEnforcement,
//     this.onChanged,
//     this.onEditingComplete,
//     this.onSubmitted,
//     this.onAppPrivateCommand,
//     this.inputFormatters,
//     this.enabled = true,
//     this.cursorWidth = 2.0,
//     this.cursorHeight,
//     this.cursorRadius,
//     this.cursorColor,
//     this.selectionHeightStyle = ui.BoxHeightStyle.tight,
//     this.selectionWidthStyle = ui.BoxWidthStyle.tight,
//     this.keyboardAppearance,
//     this.scrollPadding = const EdgeInsets.all(20),
//     this.dragStartBehavior = DragStartBehavior.start,
//     bool? enableInteractiveSelection,
//     this.selectionControls,
//     this.onTap,
//     this.onTapOutside,
//     this.mouseCursor,
//     this.scrollController,
//     this.scrollPhysics,
//     this.autofillHints = const <String>[],
//     this.clipBehavior = Clip.hardEdge,
//     this.restorationId,
//     this.scribbleEnabled = true,
//     this.enableIMEPersonalizedLearning = true,
//     this.contextMenuBuilder = _defaultContextMenuBuilder,
//     this.spellCheckConfiguration,
//     this.magnifierConfiguration,
//   })  : assert(
//           obscuringCharacter.length == 1,
//           'Obscuring character length must be 1.',
//         ),
//         assert(
//           maxLines == null || maxLines > 0,
//           'maxLines must be null or greater than zero.',
//         ),
//         assert(
//           minLines == null || minLines > 0,
//           'minLines must be null or greater than zero.',
//         ),
//         assert(
//           (maxLines == null) || (minLines == null) || (maxLines >= minLines),
//           "minLines can't be greater than maxLines",
//         ),
//         assert(
//           !expands || (maxLines == null && minLines == null),
//           'minLines and maxLines must be null when expands is true.',
//         ),
//         assert(
//           !obscureText || maxLines == 1,
//           'Obscured fields cannot be multiline.',
//         ),
//         assert(
//           maxLength == null ||
//               maxLength == TextField.noMaxLength ||
//               maxLength > 0,
//           'maxLength must be null, -1 or greater than zero.',
//         ),
//         // Assert the following instead of setting it directly to avoid
//         // surprising the user by silently changing the value they set.
//         assert(
//           !identical(textInputAction, TextInputAction.newline) ||
//               maxLines == 1 ||
//               !identical(keyboardType, TextInputType.text),
//           // ignore: lines_longer_than_80_chars
//           'Use keyboardType TextInputType.multiline when using TextInputAction.newline on a multiline TextField.',
//         ),
//         smartDashesType = smartDashesType ??
//             (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
//         smartQuotesType = smartQuotesType ??
//             (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
//         keyboardType = keyboardType ??
//             (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
//         enableInteractiveSelection =
//             enableInteractiveSelection ?? (!readOnly || !obscureText);

//   /// {@macro flutter.widgets.magnifier.TextMagnifierConfiguration.intro}
//   /// {@macro flutter.widgets.magnifier.intro}
//   /// {@macro flutter.widgets.magnifier.TextMagnifierConfiguration.details}
//   final TextMagnifierConfiguration? magnifierConfiguration;

//   /// Controls the text being edited.
//   ///
//   /// If null, this widget will create its own [TextEditingController].
//   final TextEditingController? controller;

//   /// The focus node for the text field
//   final FocusNode? focusNode;

//   /// {@macro flutter.widgets.editableText.keyboardType}
//   final TextInputType keyboardType;

//   /// The type of action button to use for the keyboard.
//   ///
//   /// Defaults to [TextInputAction.newline] if [keyboardType] is
//   /// [TextInputType.multiline] and [TextInputAction.done] otherwise.
//   final TextInputAction? textInputAction;

//   /// {@macro flutter.widgets.editableText.textCapitalization}
//   final TextCapitalization textCapitalization;

//   /// The text style for the text being edited.
//   final TextStyle? style;

//   /// {@macro flutter.widgets.editableText.strutStyle}
//   final StrutStyle? strutStyle;

//   /// {@macro flutter.widgets.editableText.textAlign}
//   final TextAlign textAlign;

//   /// {@macro flutter.material.InputDecorator.textAlignVertical}
//   final TextAlignVertical? textAlignVertical;

//   /// {@macro flutter.widgets.editableText.textDirection}
//   final TextDirection? textDirection;

//   /// {@macro flutter.widgets.editableText.autofocus}
//   final bool autofocus;

//   /// {@macro flutter.widgets.editableText.obscuringCharacter}
//   final String obscuringCharacter;

//   /// {@macro flutter.widgets.editableText.obscureText}
//   final bool obscureText;

//   /// {@macro flutter.widgets.editableText.autocorrect}
//   final bool autocorrect;

//   /// {@macro flutter.services.TextInputConfiguration.smartDashesType}
//   final SmartDashesType smartDashesType;

//   /// {@macro flutter.services.TextInputConfiguration.smartQuotesType}
//   final SmartQuotesType smartQuotesType;

//   /// {@macro flutter.services.TextInputConfiguration.enableSuggestions}
//   final bool enableSuggestions;

//   /// {@macro flutter.widgets.editableText.maxLines}
//   ///  * [expands], which determines whether the field should fill the height of
//   ///    its parent.
//   final int? maxLines;

//   /// {@macro flutter.widgets.editableText.minLines}
//   ///  * [expands], which determines whether the field should fill the height of
//   ///    its parent.
//   final int? minLines;

//   /// {@macro flutter.widgets.editableText.expands}
//   final bool expands;

//   /// {@macro flutter.widgets.editableText.readOnly}
//   final bool readOnly;

//   /// {@macro flutter.widgets.editableText.showCursor}
//   final bool? showCursor;

//   /// If [maxLength] is set to this value, only the "current input length"
//   /// part of the character counter is shown.
//   static const int noMaxLength = -1;

//   /// The max length of the text field.
//   final int? maxLength;

//   /// Determines how the [maxLength] limit should be enforced.
//   ///
//   /// {@macro flutter.services.textFormatter.effectiveMaxLengthEnforcement}
//   ///
//   /// {@macro flutter.services.textFormatter.maxLengthEnforcement}
//   final MaxLengthEnforcement? maxLengthEnforcement;

//   /// {@macro flutter.widgets.editableText.onChanged}
//   ///
//   /// See also:
//   ///
//   ///  * [inputFormatters], which are called before [onChanged]
//   ///    runs and can validate and change ("format") the input value.
//   ///  * [onEditingComplete], [onSubmitted]:
//   ///    which are more specialized input change notifications.
//   final ValueChanged<String>? onChanged;

//   /// {@macro flutter.widgets.editableText.onEditingComplete}
//   final VoidCallback? onEditingComplete;

//   /// {@macro flutter.widgets.editableText.onSubmitted}
//   ///
//   /// See also:
//   ///
//   ///  * [TextInputAction.next] and [TextInputAction.previous], which
//   ///    automatically shift the focus to the next/previous focusable item when
//   ///    the user is done editing.
//   final ValueChanged<String>? onSubmitted;

//   /// {@macro flutter.widgets.editableText.onAppPrivateCommand}
//   final AppPrivateCommandCallback? onAppPrivateCommand;

//   /// {@macro flutter.widgets.editableText.inputFormatters}
//   final List<TextInputFormatter>? inputFormatters;

//   /// If false the text field is "disabled": it ignores taps and
//   /// is rendered in grey.
//   ///
//   final bool enabled;

//   /// {@macro flutter.widgets.editableText.cursorWidth}
//   final double cursorWidth;

//   /// {@macro flutter.widgets.editableText.cursorHeight}
//   final double? cursorHeight;

//   /// {@macro flutter.widgets.editableText.cursorRadius}
//   final Radius? cursorRadius;

//   /// The color of the cursor
//   final Color? cursorColor;

//   /// Controls how tall the selection highlight boxes are computed to be.
//   ///
//   /// See [ui.BoxHeightStyle] for details on available styles.
//   final ui.BoxHeightStyle selectionHeightStyle;

//   /// Controls how wide the selection highlight boxes are computed to be.
//   ///
//   /// See [ui.BoxWidthStyle] for details on available styles.
//   final ui.BoxWidthStyle selectionWidthStyle;

//   /// The appearance of the keyboard.
//   ///
//   /// This setting is only honored on iOS devices.
//   ///
//   /// If unset, defaults to theme brightness.
//   final Brightness? keyboardAppearance;

//   /// {@macro flutter.widgets.editableText.scrollPadding}
//   final EdgeInsets scrollPadding;

//   /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
//   final bool enableInteractiveSelection;

//   /// {@macro flutter.widgets.editableText.selectionControls}
//   final TextSelectionControls? selectionControls;

//   /// {@macro flutter.widgets.scrollable.dragStartBehavior}
//   final DragStartBehavior dragStartBehavior;

//   /// {@macro flutter.widgets.editableText.selectionEnabled}
//   bool get selectionEnabled => enableInteractiveSelection;

//   /// A callback when the text field is tapped
//   final GestureTapCallback? onTap;

//   final TapRegionCallback? onTapOutside;

//   /// The cursor for a mouse pointer when it enters or is hovering over the
//   /// widget.
//   ///
//   /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
//   /// [MaterialStateProperty.resolve] is used for the following [MaterialState]s:
//   ///
//   ///  * [MaterialState.error].
//   ///  * [MaterialState.hovered].
//   ///  * [MaterialState.focused].
//   ///  * [MaterialState.disabled].
//   ///
//   /// If this property is null, [MaterialStateMouseCursor.textable] will be used.
//   ///
//   /// The [mouseCursor] is the only property of [TextField] that controls the
//   /// appearance of the mouse pointer. All other properties related to "cursor"
//   /// stand for the text cursor, which is usually a blinking vertical line at
//   /// the editing position.
//   final MouseCursor? mouseCursor;

//   /// {@macro flutter.widgets.editableText.scrollPhysics}
//   final ScrollPhysics? scrollPhysics;

//   /// {@macro flutter.widgets.editableText.scrollController}
//   final ScrollController? scrollController;

//   final String? hintText;

//   /// {@macro flutter.widgets.editableText.autofillHints}
//   /// {@macro flutter.services.AutofillConfiguration.autofillHints}
//   final Iterable<String>? autofillHints;

//   /// {@macro flutter.material.Material.clipBehavior}
//   ///
//   /// Defaults to [Clip.hardEdge].
//   final Clip clipBehavior;

//   final String? restorationId;

//   /// {@macro flutter.widgets.editableText.scribbleEnabled}
//   final bool scribbleEnabled;

//   /// {@macro flutter.services.TextInputConfiguration.enableIMEPersonalizedLearning}
//   final bool enableIMEPersonalizedLearning;

//   /// {@macro flutter.widgets.EditableText.contextMenuBuilder}
//   ///
//   /// If not provided, will build a default menu based on the platform.
//   ///
//   /// See also:
//   ///
//   ///  * [AdaptiveTextSelectionToolbar], which is built by default.
//   final EditableTextContextMenuBuilder? contextMenuBuilder;

//   static Widget _defaultContextMenuBuilder(
//       BuildContext context, EditableTextState editableTextState) {
//     return AdaptiveTextSelectionToolbar.editableText(
//       editableTextState: editableTextState,
//     );
//   }

//   /// {@macro flutter.widgets.EditableText.spellCheckConfiguration}
//   ///
//   /// If [SpellCheckConfiguration.misspelledTextStyle] is not specified in this
//   /// configuration, then [materialMisspelledTextStyle] is used by default.
//   final SpellCheckConfiguration? spellCheckConfiguration;

//   /// The [TextStyle] used to indicate misspelled words in the Material style.
//   ///
//   /// See also:
//   ///  * [SpellCheckConfiguration.misspelledTextStyle], the style configured to
//   ///    mark misspelled words with.
//   ///  * [CupertinoTextField.cupertinoMisspelledTextStyle], the style configured
//   ///    to mark misspelled words with in the Cupertino style.
//   static const TextStyle materialMisspelledTextStyle = TextStyle(
//     decoration: TextDecoration.underline,
//     decorationColor: Colors.red,
//     decorationStyle: TextDecorationStyle.wavy,
//   );

//   @override
//   State<TextField> createState() => _TextFieldState();

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty<TextEditingController>('controller', controller,
//           defaultValue: null))
//       ..add(
//         DiagnosticsProperty<FocusNode>(
//           'focusNode',
//           focusNode,
//           defaultValue: null,
//         ),
//       )
//       ..add(DiagnosticsProperty<bool>('enabled', enabled, defaultValue: null))
//       ..add(DiagnosticsProperty<TextInputType>('keyboardType', keyboardType,
//           defaultValue: TextInputType.text))
//       ..add(DiagnosticsProperty<TextStyle>('style', style, defaultValue: null))
//       ..add(DiagnosticsProperty<bool>('autofocus', autofocus,
//           defaultValue: false))
//       ..add(DiagnosticsProperty<String>(
//           'obscuringCharacter', obscuringCharacter,
//           defaultValue: '•'))
//       ..add(DiagnosticsProperty<bool>('obscureText', obscureText,
//           defaultValue: false))
//       ..add(DiagnosticsProperty<bool>('autocorrect', autocorrect,
//           defaultValue: true))
//       ..add(EnumProperty<SmartDashesType>('smartDashesType', smartDashesType,
//           defaultValue:
//               obscureText ? SmartDashesType.disabled : SmartDashesType.enabled))
//       ..add(EnumProperty<SmartQuotesType>('smartQuotesType', smartQuotesType,
//           defaultValue:
//               obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled))
//       ..add(DiagnosticsProperty<bool>('enableSuggestions', enableSuggestions,
//           defaultValue: true))
//       ..add(IntProperty('maxLines', maxLines, defaultValue: 1))
//       ..add(IntProperty('minLines', minLines, defaultValue: null))
//       ..add(DiagnosticsProperty<bool>('expands', expands, defaultValue: false))
//       ..add(IntProperty('maxLength', maxLength, defaultValue: null))
//       ..add(EnumProperty<MaxLengthEnforcement>(
//           'maxLengthEnforcement', maxLengthEnforcement,
//           defaultValue: null))
//       ..add(EnumProperty<TextInputAction>('textInputAction', textInputAction,
//           defaultValue: null))
//       ..add(EnumProperty<TextCapitalization>(
//           'textCapitalization', textCapitalization,
//           defaultValue: TextCapitalization.none))
//       ..add(EnumProperty<TextAlign>('textAlign', textAlign,
//           defaultValue: TextAlign.start))
//       ..add(DiagnosticsProperty<TextAlignVertical>(
//           'textAlignVertical', textAlignVertical,
//           defaultValue: null))
//       ..add(EnumProperty<TextDirection>('textDirection', textDirection,
//           defaultValue: null))
//       ..add(DoubleProperty('cursorWidth', cursorWidth, defaultValue: 2.0))
//       ..add(DoubleProperty('cursorHeight', cursorHeight, defaultValue: null))
//       ..add(DiagnosticsProperty<Radius>('cursorRadius', cursorRadius,
//           defaultValue: null))
//       ..add(ColorProperty('cursorColor', cursorColor, defaultValue: null))
//       ..add(DiagnosticsProperty<Brightness>(
//           'keyboardAppearance', keyboardAppearance,
//           defaultValue: null))
//       ..add(DiagnosticsProperty<EdgeInsetsGeometry>(
//           'scrollPadding', scrollPadding,
//           defaultValue: const EdgeInsets.all(20.0)))
//       ..add(FlagProperty('selectionEnabled',
//           value: selectionEnabled,
//           defaultValue: true,
//           ifFalse: 'selection disabled'))
//       ..add(DiagnosticsProperty<TextSelectionControls>(
//           'selectionControls', selectionControls,
//           defaultValue: null))
//       ..add(DiagnosticsProperty<ScrollController>(
//           'scrollController', scrollController,
//           defaultValue: null))
//       ..add(DiagnosticsProperty<ScrollPhysics>('scrollPhysics', scrollPhysics,
//           defaultValue: null))
//       ..add(DiagnosticsProperty<Clip>('clipBehavior', clipBehavior,
//           defaultValue: Clip.hardEdge))
//       ..add(DiagnosticsProperty<bool>('scribbleEnabled', scribbleEnabled,
//           defaultValue: true))
//       ..add(DiagnosticsProperty<bool>(
//           'enableIMEPersonalizedLearning', enableIMEPersonalizedLearning,
//           defaultValue: true))
//       ..add(DiagnosticsProperty<SpellCheckConfiguration>(
//           'spellCheckConfiguration', spellCheckConfiguration,
//           defaultValue: null));
//   }
// }

// class _TextFieldState extends State<TextField>
//     with RestorationMixin
//     implements TextSelectionGestureDetectorBuilderDelegate, AutofillClient {
//   RestorableTextEditingController? _controller;
//   TextEditingController get _effectiveController =>
//       widget.controller ?? _controller!.value;

//   FocusNode? _focusNode;
//   FocusNode get _effectiveFocusNode =>
//       widget.focusNode ?? (_focusNode ??= FocusNode());
//   bool _hasFocus = false;

//   MaxLengthEnforcement get _effectiveMaxLengthEnforcement =>
//       widget.maxLengthEnforcement ??
//       LengthLimitingTextInputFormatter.getDefaultMaxLengthEnforcement(
//         defaultTargetPlatform,
//       );

//   bool _showSelectionHandles = false;

//   late _TextFieldSelectionGestureDetectorBuilder
//       _selectionGestureDetectorBuilder;

//   // API for TextSelectionGestureDetectorBuilderDelegate.
//   @override
//   late bool forcePressEnabled;

//   @override
//   final GlobalKey<EditableTextState> editableTextKey =
//       GlobalKey<EditableTextState>();

//   @override
//   bool get selectionEnabled => widget.selectionEnabled;
//   // End of API for TextSelectionGestureDetectorBuilderDelegate.

//   bool get _isEnabled => widget.enabled ?? true;

//   int get _currentLength => _effectiveController.value.text.characters.length;

//   bool get _hasIntrinsicError =>
//       widget.maxLength != null &&
//       widget.maxLength! > 0 &&
//       _effectiveController.value.text.characters.length > widget.maxLength!;

//   bool get _hasError =>
//       // widget.decoration?.errorText != null ||
//       _hasIntrinsicError;

//   @override
//   void initState() {
//     super.initState();
//     _selectionGestureDetectorBuilder =
//         _TextFieldSelectionGestureDetectorBuilder(state: this);
//     if (widget.controller == null) {
//       _createLocalController();
//     }
//     _effectiveFocusNode.canRequestFocus = _isEnabled;
//     _effectiveFocusNode.addListener(_handleFocusChanged);
//   }

//   bool get _canRequestFocus {
//     final NavigationMode mode = MediaQuery.maybeOf(context)?.navigationMode ??
//         NavigationMode.traditional;
//     switch (mode) {
//       case NavigationMode.traditional:
//         return _isEnabled;
//       case NavigationMode.directional:
//         return true;
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _effectiveFocusNode.canRequestFocus = _canRequestFocus;
//   }

//   @override
//   void didUpdateWidget(TextField oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.controller == null && oldWidget.controller != null) {
//       _createLocalController(oldWidget.controller!.value);
//     } else if (widget.controller != null && oldWidget.controller == null) {
//       unregisterFromRestoration(_controller!);
//       _controller!.dispose();
//       _controller = null;
//     }

//     if (widget.focusNode != oldWidget.focusNode) {
//       (oldWidget.focusNode ?? _focusNode)?.removeListener(_handleFocusChanged);
//       (widget.focusNode ?? _focusNode)?.addListener(_handleFocusChanged);
//     }

//     _effectiveFocusNode.canRequestFocus = _canRequestFocus;

//     if (_effectiveFocusNode.hasFocus &&
//         widget.readOnly != oldWidget.readOnly &&
//         _isEnabled) {
//       if (_effectiveController.selection.isCollapsed) {
//         _showSelectionHandles = !widget.readOnly;
//       }
//     }
//   }

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     if (_controller != null) {
//       _registerController();
//     }
//   }

//   void _registerController() {
//     assert(_controller != null);
//     registerForRestoration(_controller!, 'controller');
//   }

//   void _createLocalController([TextEditingValue? value]) {
//     assert(_controller == null);
//     _controller = value == null
//         ? RestorableTextEditingController()
//         : RestorableTextEditingController.fromValue(value);
//     if (!restorePending) {
//       _registerController();
//     }
//   }

//   @override
//   String? get restorationId => widget.restorationId;

//   @override
//   void dispose() {
//     _effectiveFocusNode.removeListener(_handleFocusChanged);
//     _focusNode?.dispose();
//     _controller?.dispose();
//     super.dispose();
//   }

//   EditableTextState? get _editableText => editableTextKey.currentState;

//   void _requestKeyboard() {
//     _editableText?.requestKeyboard();
//   }

//   bool _shouldShowSelectionHandles(SelectionChangedCause? cause) {
//     // When the text field is activated by something that doesn't trigger the
//     // selection overlay, we shouldn't show the handles either.
//     if (!_selectionGestureDetectorBuilder.shouldShowSelectionToolbar) {
//       return false;
//     }

//     if (cause == SelectionChangedCause.keyboard) {
//       return false;
//     }

//     if (widget.readOnly && _effectiveController.selection.isCollapsed) {
//       return false;
//     }

//     if (!_isEnabled) {
//       return false;
//     }

//     if (cause == SelectionChangedCause.longPress ||
//         cause == SelectionChangedCause.scribble) {
//       return true;
//     }

//     if (_effectiveController.text.isNotEmpty) {
//       return true;
//     }

//     return false;
//   }

//   void _handleFocusChanged() {
//     setState(() {
//       // Rebuild the widget on focus change to show/hide the text selection
//       // highlight.
//       _hasFocus = _effectiveFocusNode.hasFocus;
//     });
//   }

//   void _handleSelectionChanged(
//       TextSelection selection, SelectionChangedCause? cause) {
//     final bool willShowSelectionHandles = _shouldShowSelectionHandles(cause);
//     if (willShowSelectionHandles != _showSelectionHandles) {
//       setState(() {
//         _showSelectionHandles = willShowSelectionHandles;
//       });
//     }

//     switch (Platform.platform) {
//       case TargetPlatform.iOS:
//       case TargetPlatform.macOS:
//       case TargetPlatform.linux:
//       case TargetPlatform.windows:
//       case TargetPlatform.fuchsia:
//       case TargetPlatform.android:
//       case null:
//         if (cause == SelectionChangedCause.longPress ||
//             cause == SelectionChangedCause.drag) {
//           _editableText?.bringIntoView(selection.extent);
//         }
//         break;
//     }

//     switch (Platform.platform) {
//       case TargetPlatform.iOS:
//       case TargetPlatform.fuchsia:
//       case TargetPlatform.android:
//         break;
//       case TargetPlatform.macOS:
//       case TargetPlatform.linux:
//       case TargetPlatform.windows:
//       case null:
//         if (cause == SelectionChangedCause.drag) {
//           _editableText?.hideToolbar();
//         }
//         break;
//     }
//   }

//   /// Toggle the toolbar when a selection handle is tapped.
//   void _handleSelectionHandleTapped() {
//     if (_effectiveController.selection.isCollapsed) {
//       _editableText!.toggleToolbar();
//     }
//   }

//   // AutofillClient implementation start.
//   @override
//   String get autofillId => _editableText!.autofillId;

//   @override
//   void autofill(TextEditingValue newEditingValue) =>
//       _editableText!.autofill(newEditingValue);

//   @override
//   TextInputConfiguration get textInputConfiguration {
//     final List<String>? autofillHints =
//         widget.autofillHints?.toList(growable: false);
//     final AutofillConfiguration autofillConfiguration = autofillHints != null
//         ? AutofillConfiguration(
//             uniqueIdentifier: autofillId,
//             autofillHints: autofillHints,
//             currentEditingValue: _effectiveController.value,
//             hintText: widget.hintText,
//           )
//         : AutofillConfiguration.disabled;

//     return _editableText!.textInputConfiguration
//         .copyWith(autofillConfiguration: autofillConfiguration);
//   }
//   // AutofillClient implementation end.

//   @override
//   Widget build(BuildContext context) {
//     assert(debugCheckHasMaterialLocalizations(context));
//     assert(debugCheckHasDirectionality(context));
//     assert(
//       !(widget.style != null &&
//           widget.style!.inherit == false &&
//           (widget.style!.fontSize == null ||
//               widget.style!.textBaseline == null)),
//       'inherit false style must supply fontSize and textBaseline',
//     );

//     final theme = Theme.of(context);
//     final DefaultSelectionStyle selectionStyle =
//         DefaultSelectionStyle.of(context);

//     final TextStyle style = theme.typography.body.copyWith(
//       color: theme.colorScheme.surface.foreground,
//     );
//     final Brightness keyboardAppearance =
//         widget.keyboardAppearance ?? theme.colorScheme.brightness;
//     final TextEditingController controller = _effectiveController;
//     final FocusNode focusNode = _effectiveFocusNode;
//     final List<TextInputFormatter> formatters = <TextInputFormatter>[
//       ...?widget.inputFormatters,
//       if (widget.maxLength != null)
//         LengthLimitingTextInputFormatter(
//           widget.maxLength,
//           maxLengthEnforcement: _effectiveMaxLengthEnforcement,
//         ),
//     ];

//     // Set configuration as disabled if not otherwise specified. If specified,
//     // ensure that configuration uses Material text style for misspelled words
//     // unless a custom style is specified.
//     final SpellCheckConfiguration spellCheckConfiguration =
//         widget.spellCheckConfiguration != null &&
//                 widget.spellCheckConfiguration !=
//                     const SpellCheckConfiguration.disabled()
//             ? widget.spellCheckConfiguration!.copyWith(
//                 misspelledTextStyle:
//                     widget.spellCheckConfiguration!.misspelledTextStyle ??
//                         TextField.materialMisspelledTextStyle)
//             : const SpellCheckConfiguration.disabled();

//     TextSelectionControls? textSelectionControls = widget.selectionControls;
//     late bool paintCursorAboveText;
//     late bool cursorOpacityAnimates;
//     Offset? cursorOffset;
//     final cursorColor = theme.colorScheme.primary;
//     final selectionColor = theme.colorScheme.primary.withOpacity(0.40);
//     Color? autocorrectionTextRectColor;
//     var cursorRadius = widget.cursorRadius;
//     VoidCallback? handleDidGainAccessibilityFocus;

//     switch (Platform.platform) {
//       case TargetPlatform.iOS:
//         forcePressEnabled = true;
//         textSelectionControls ??= cupertinoTextSelectionControls;
//         paintCursorAboveText = true;
//         cursorOpacityAnimates = true;

//         cursorRadius ??= const Radius.circular(2.0);
//         cursorOffset = Offset(
//             iOSHorizontalOffset / MediaQuery.of(context).devicePixelRatio, 0);
//         autocorrectionTextRectColor = selectionColor;
//         break;

//       case TargetPlatform.macOS:
//         forcePressEnabled = false;
//         textSelectionControls ??= cupertinoDesktopTextSelectionControls;
//         paintCursorAboveText = true;
//         cursorOpacityAnimates = false;

//         cursorRadius ??= const Radius.circular(2.0);
//         cursorOffset = Offset(
//             iOSHorizontalOffset / MediaQuery.of(context).devicePixelRatio, 0);
//         handleDidGainAccessibilityFocus = () {
//           // Automatically activate the TextField when it receives accessibility focus.
//           if (!_effectiveFocusNode.hasFocus &&
//               _effectiveFocusNode.canRequestFocus) {
//             _effectiveFocusNode.requestFocus();
//           }
//         };
//         break;

//       case TargetPlatform.android:
//       case TargetPlatform.fuchsia:
//         forcePressEnabled = false;
//         textSelectionControls ??= materialTextSelectionControls;
//         paintCursorAboveText = false;
//         cursorOpacityAnimates = false;
//         break;

//       case null:
//       case TargetPlatform.linux:
//         forcePressEnabled = false;
//         textSelectionControls ??= desktopTextSelectionControls;
//         paintCursorAboveText = false;
//         cursorOpacityAnimates = false;
//         break;

//       case TargetPlatform.windows:
//         forcePressEnabled = false;
//         textSelectionControls ??= desktopTextSelectionControls;
//         paintCursorAboveText = false;
//         cursorOpacityAnimates = false;

//         handleDidGainAccessibilityFocus = () {
//           // Automatically activate the TextField when it receives accessibility focus.
//           if (!_effectiveFocusNode.hasFocus &&
//               _effectiveFocusNode.canRequestFocus) {
//             _effectiveFocusNode.requestFocus();
//           }
//         };
//         break;
//     }

//     final editableText = RepaintBoundary(
//       child: UnmanagedRestorationScope(
//         bucket: bucket,
//         child: EditableText(
//           key: editableTextKey,
//           readOnly: widget.readOnly || !_isEnabled,
//           showCursor: widget.showCursor,
//           showSelectionHandles: _showSelectionHandles,
//           controller: controller,
//           focusNode: focusNode,
//           keyboardType: widget.keyboardType,
//           textInputAction: widget.textInputAction,
//           textCapitalization: widget.textCapitalization,
//           style: style,
//           strutStyle: widget.strutStyle,
//           textAlign: widget.textAlign,
//           textDirection: widget.textDirection,
//           autofocus: widget.autofocus,
//           obscuringCharacter: widget.obscuringCharacter,
//           obscureText: widget.obscureText,
//           autocorrect: widget.autocorrect,
//           smartDashesType: widget.smartDashesType,
//           smartQuotesType: widget.smartQuotesType,
//           enableSuggestions: widget.enableSuggestions,
//           maxLines: widget.maxLines,
//           minLines: widget.minLines,
//           expands: widget.expands,
//           // Only show the selection highlight when the text field is focused.
//           selectionColor: focusNode.hasFocus ? selectionColor : null,
//           selectionControls:
//               widget.selectionEnabled ? textSelectionControls : null,
//           onChanged: widget.onChanged,
//           onSelectionChanged: _handleSelectionChanged,
//           onEditingComplete: widget.onEditingComplete,
//           onSubmitted: widget.onSubmitted,
//           onAppPrivateCommand: widget.onAppPrivateCommand,
//           onSelectionHandleTapped: _handleSelectionHandleTapped,
//           onTapOutside: widget.onTapOutside,
//           inputFormatters: formatters,
//           rendererIgnoresPointer: true,
//           mouseCursor: MouseCursor.defer, // TextField will handle the cursor
//           cursorWidth: widget.cursorWidth,
//           cursorHeight: widget.cursorHeight,
//           cursorRadius: cursorRadius,
//           cursorColor: cursorColor,
//           selectionHeightStyle: widget.selectionHeightStyle,
//           selectionWidthStyle: widget.selectionWidthStyle,
//           cursorOpacityAnimates: cursorOpacityAnimates,
//           cursorOffset: cursorOffset,
//           paintCursorAboveText: paintCursorAboveText,
//           backgroundCursorColor: Colors.slate.s400,
//           scrollPadding: widget.scrollPadding,
//           keyboardAppearance: keyboardAppearance,
//           enableInteractiveSelection: widget.enableInteractiveSelection,
//           dragStartBehavior: widget.dragStartBehavior,
//           scrollController: widget.scrollController,
//           scrollPhysics: widget.scrollPhysics,
//           autofillClient: this,
//           autocorrectionTextRectColor: autocorrectionTextRectColor,
//           clipBehavior: widget.clipBehavior,
//           restorationId: 'editable',
//           scribbleEnabled: widget.scribbleEnabled,
//           enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
//           contextMenuBuilder: widget.contextMenuBuilder,
//           spellCheckConfiguration: spellCheckConfiguration,
//           magnifierConfiguration: widget.magnifierConfiguration ??
//               TextMagnifier.adaptiveMagnifierConfiguration,
//         ),
//       ),
//     );

//     final int? semanticsMaxValueLength;
//     if (_effectiveMaxLengthEnforcement != MaxLengthEnforcement.none &&
//         widget.maxLength != null &&
//         widget.maxLength! > 0) {
//       semanticsMaxValueLength = widget.maxLength;
//     } else {
//       semanticsMaxValueLength = null;
//     }

//     return Interaction(
//       requestFocusOnPress: false,
//       disableTextSelection: false,
//       focusNodeListenOnly: _effectiveFocusNode,
//       onTap: () => _effectiveFocusNode.requestFocus(),
//       cursor: SystemMouseCursors.text,
//       builder: (context, state) {
//         return Surface(
//           interactionState: state,
//           child: AnimatedBuilder(
//             animation: Listenable.merge(<Listenable>[focusNode, controller]),
//             child: TextFieldTapRegion(
//               child: IgnorePointer(
//                 ignoring: !_isEnabled,
//                 // TODO remove second builder
//                 child: AnimatedBuilder(
//                   animation: controller, // changes the _currentLength
//                   builder: (BuildContext context, Widget? child) {
//                     return Semantics(
//                       maxValueLength: semanticsMaxValueLength,
//                       currentValueLength: _currentLength,
//                       onTap: widget.readOnly
//                           ? null
//                           : () {
//                               if (!_effectiveController.selection.isValid) {
//                                 _effectiveController.selection =
//                                     TextSelection.collapsed(
//                                   offset: _effectiveController.text.length,
//                                 );
//                               }
//                               _requestKeyboard();
//                             },
//                       onDidGainAccessibilityFocus:
//                           handleDidGainAccessibilityFocus,
//                       child: child,
//                     );
//                   },
//                   child: _selectionGestureDetectorBuilder.buildGestureDetector(
//                     behavior: HitTestBehavior.translucent,
//                     child: editableText,
//                   ),
//                 ),
//               ),
//             ),
//             builder: (context, child) {
//               final inheritedSurface =
//                   context.inheritedSurface?.background.asJoltColor ??
//                       context.color.surface;
//               return Stack(
//                 alignment: Alignment.centerLeft,
//                 children: [
//                   child ?? const SizedBox.shrink(),
//                   SelectionContainer.disabled(
//                     child: Text(
//                       // Show the hint if the text is empty
//                       _currentLength == 0 ? widget.hintText ?? '' : '',
//                       color: inheritedSurface.foreground.withOpacity(0.5),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class _TextFieldSelectionGestureDetectorBuilder
//     extends TextSelectionGestureDetectorBuilder {
//   _TextFieldSelectionGestureDetectorBuilder({
//     required _TextFieldState state,
//   })  : _state = state,
//         super(delegate: state);

//   final _TextFieldState _state;

//   @override
//   void onForcePressStart(ForcePressDetails details) {
//     super.onForcePressStart(details);
//     if (delegate.selectionEnabled && shouldShowSelectionToolbar) {
//       editableText.showToolbar();
//     }
//   }

//   @override
//   void onForcePressEnd(ForcePressDetails details) {
//     // Not required.
//   }

//   @override
//   void onSingleTapUp(TapDragUpDetails details) {
//     super.onSingleTapUp(details);
//     _state._requestKeyboard();
//     _state.widget.onTap?.call();
//   }

//   @override
//   void onSingleLongTapStart(LongPressStartDetails details) {
//     super.onSingleLongTapStart(details);
//     if (delegate.selectionEnabled) {
//       switch (Platform.platform) {
//         case TargetPlatform.iOS:
//         case TargetPlatform.macOS:
//           break;
//         case TargetPlatform.android:
//         case TargetPlatform.fuchsia:
//         case TargetPlatform.linux:
//         case TargetPlatform.windows:
//         case null:
//           Feedback.forLongPress(_state.context);
//           break;
//       }
//     }
//   }
// }
