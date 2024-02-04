// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button.style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ButtonStyle {
  /// The style of the button surface
  SurfaceStyle? get surfaceStyle => throw _privateConstructorUsedError;

  /// The style of the button text
  ///
  /// Also determines the size icons
  TextStyle? get textStyle => throw _privateConstructorUsedError;

  /// The spacing between a button icon and label
  double? get spacing => throw _privateConstructorUsedError;

  /// The indicator widget to show when the button is busy
  Widget? get indicator => throw _privateConstructorUsedError;

  /// Whether the buttons with no label should be square
  bool? get squareIconButton => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ButtonStyleCopyWith<ButtonStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonStyleCopyWith<$Res> {
  factory $ButtonStyleCopyWith(
          ButtonStyle value, $Res Function(ButtonStyle) then) =
      _$ButtonStyleCopyWithImpl<$Res, ButtonStyle>;
  @useResult
  $Res call(
      {SurfaceStyle? surfaceStyle,
      TextStyle? textStyle,
      double? spacing,
      Widget? indicator,
      bool? squareIconButton});

  $SurfaceStyleCopyWith<$Res>? get surfaceStyle;
}

/// @nodoc
class _$ButtonStyleCopyWithImpl<$Res, $Val extends ButtonStyle>
    implements $ButtonStyleCopyWith<$Res> {
  _$ButtonStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surfaceStyle = freezed,
    Object? textStyle = freezed,
    Object? spacing = freezed,
    Object? indicator = freezed,
    Object? squareIconButton = freezed,
  }) {
    return _then(_value.copyWith(
      surfaceStyle: freezed == surfaceStyle
          ? _value.surfaceStyle
          : surfaceStyle // ignore: cast_nullable_to_non_nullable
              as SurfaceStyle?,
      textStyle: freezed == textStyle
          ? _value.textStyle
          : textStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle?,
      spacing: freezed == spacing
          ? _value.spacing
          : spacing // ignore: cast_nullable_to_non_nullable
              as double?,
      indicator: freezed == indicator
          ? _value.indicator
          : indicator // ignore: cast_nullable_to_non_nullable
              as Widget?,
      squareIconButton: freezed == squareIconButton
          ? _value.squareIconButton
          : squareIconButton // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SurfaceStyleCopyWith<$Res>? get surfaceStyle {
    if (_value.surfaceStyle == null) {
      return null;
    }

    return $SurfaceStyleCopyWith<$Res>(_value.surfaceStyle!, (value) {
      return _then(_value.copyWith(surfaceStyle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ButtonStyleImplCopyWith<$Res>
    implements $ButtonStyleCopyWith<$Res> {
  factory _$$ButtonStyleImplCopyWith(
          _$ButtonStyleImpl value, $Res Function(_$ButtonStyleImpl) then) =
      __$$ButtonStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SurfaceStyle? surfaceStyle,
      TextStyle? textStyle,
      double? spacing,
      Widget? indicator,
      bool? squareIconButton});

  @override
  $SurfaceStyleCopyWith<$Res>? get surfaceStyle;
}

/// @nodoc
class __$$ButtonStyleImplCopyWithImpl<$Res>
    extends _$ButtonStyleCopyWithImpl<$Res, _$ButtonStyleImpl>
    implements _$$ButtonStyleImplCopyWith<$Res> {
  __$$ButtonStyleImplCopyWithImpl(
      _$ButtonStyleImpl _value, $Res Function(_$ButtonStyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surfaceStyle = freezed,
    Object? textStyle = freezed,
    Object? spacing = freezed,
    Object? indicator = freezed,
    Object? squareIconButton = freezed,
  }) {
    return _then(_$ButtonStyleImpl(
      surfaceStyle: freezed == surfaceStyle
          ? _value.surfaceStyle
          : surfaceStyle // ignore: cast_nullable_to_non_nullable
              as SurfaceStyle?,
      textStyle: freezed == textStyle
          ? _value.textStyle
          : textStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle?,
      spacing: freezed == spacing
          ? _value.spacing
          : spacing // ignore: cast_nullable_to_non_nullable
              as double?,
      indicator: freezed == indicator
          ? _value.indicator
          : indicator // ignore: cast_nullable_to_non_nullable
              as Widget?,
      squareIconButton: freezed == squareIconButton
          ? _value.squareIconButton
          : squareIconButton // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ButtonStyleImpl extends _ButtonStyle {
  const _$ButtonStyleImpl(
      {this.surfaceStyle,
      this.textStyle,
      this.spacing,
      this.indicator,
      this.squareIconButton})
      : super._();

  /// The style of the button surface
  @override
  final SurfaceStyle? surfaceStyle;

  /// The style of the button text
  ///
  /// Also determines the size icons
  @override
  final TextStyle? textStyle;

  /// The spacing between a button icon and label
  @override
  final double? spacing;

  /// The indicator widget to show when the button is busy
  @override
  final Widget? indicator;

  /// Whether the buttons with no label should be square
  @override
  final bool? squareIconButton;

  @override
  String toString() {
    return 'ButtonStyle(surfaceStyle: $surfaceStyle, textStyle: $textStyle, spacing: $spacing, indicator: $indicator, squareIconButton: $squareIconButton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonStyleImpl &&
            (identical(other.surfaceStyle, surfaceStyle) ||
                other.surfaceStyle == surfaceStyle) &&
            (identical(other.textStyle, textStyle) ||
                other.textStyle == textStyle) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.indicator, indicator) ||
                other.indicator == indicator) &&
            (identical(other.squareIconButton, squareIconButton) ||
                other.squareIconButton == squareIconButton));
  }

  @override
  int get hashCode => Object.hash(runtimeType, surfaceStyle, textStyle, spacing,
      indicator, squareIconButton);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonStyleImplCopyWith<_$ButtonStyleImpl> get copyWith =>
      __$$ButtonStyleImplCopyWithImpl<_$ButtonStyleImpl>(this, _$identity);
}

abstract class _ButtonStyle extends ButtonStyle {
  const factory _ButtonStyle(
      {final SurfaceStyle? surfaceStyle,
      final TextStyle? textStyle,
      final double? spacing,
      final Widget? indicator,
      final bool? squareIconButton}) = _$ButtonStyleImpl;
  const _ButtonStyle._() : super._();

  @override

  /// The style of the button surface
  SurfaceStyle? get surfaceStyle;
  @override

  /// The style of the button text
  ///
  /// Also determines the size icons
  TextStyle? get textStyle;
  @override

  /// The spacing between a button icon and label
  double? get spacing;
  @override

  /// The indicator widget to show when the button is busy
  Widget? get indicator;
  @override

  /// Whether the buttons with no label should be square
  bool? get squareIconButton;
  @override
  @JsonKey(ignore: true)
  _$$ButtonStyleImplCopyWith<_$ButtonStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
