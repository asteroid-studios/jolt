// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InteractionStyle {
  bool? get canHover => throw _privateConstructorUsedError;
  bool? get canTap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InteractionStyleCopyWith<InteractionStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractionStyleCopyWith<$Res> {
  factory $InteractionStyleCopyWith(
          InteractionStyle value, $Res Function(InteractionStyle) then) =
      _$InteractionStyleCopyWithImpl<$Res, InteractionStyle>;
  @useResult
  $Res call({bool? canHover, bool? canTap});
}

/// @nodoc
class _$InteractionStyleCopyWithImpl<$Res, $Val extends InteractionStyle>
    implements $InteractionStyleCopyWith<$Res> {
  _$InteractionStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canHover = freezed,
    Object? canTap = freezed,
  }) {
    return _then(_value.copyWith(
      canHover: freezed == canHover
          ? _value.canHover
          : canHover // ignore: cast_nullable_to_non_nullable
              as bool?,
      canTap: freezed == canTap
          ? _value.canTap
          : canTap // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InteractionStyleImplCopyWith<$Res>
    implements $InteractionStyleCopyWith<$Res> {
  factory _$$InteractionStyleImplCopyWith(_$InteractionStyleImpl value,
          $Res Function(_$InteractionStyleImpl) then) =
      __$$InteractionStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? canHover, bool? canTap});
}

/// @nodoc
class __$$InteractionStyleImplCopyWithImpl<$Res>
    extends _$InteractionStyleCopyWithImpl<$Res, _$InteractionStyleImpl>
    implements _$$InteractionStyleImplCopyWith<$Res> {
  __$$InteractionStyleImplCopyWithImpl(_$InteractionStyleImpl _value,
      $Res Function(_$InteractionStyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canHover = freezed,
    Object? canTap = freezed,
  }) {
    return _then(_$InteractionStyleImpl(
      canHover: freezed == canHover
          ? _value.canHover
          : canHover // ignore: cast_nullable_to_non_nullable
              as bool?,
      canTap: freezed == canTap
          ? _value.canTap
          : canTap // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$InteractionStyleImpl extends _InteractionStyle {
  const _$InteractionStyleImpl({this.canHover, this.canTap}) : super._();

  @override
  final bool? canHover;
  @override
  final bool? canTap;

  @override
  String toString() {
    return 'InteractionStyle(canHover: $canHover, canTap: $canTap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionStyleImpl &&
            (identical(other.canHover, canHover) ||
                other.canHover == canHover) &&
            (identical(other.canTap, canTap) || other.canTap == canTap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, canHover, canTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionStyleImplCopyWith<_$InteractionStyleImpl> get copyWith =>
      __$$InteractionStyleImplCopyWithImpl<_$InteractionStyleImpl>(
          this, _$identity);
}

abstract class _InteractionStyle extends InteractionStyle {
  const factory _InteractionStyle({final bool? canHover, final bool? canTap}) =
      _$InteractionStyleImpl;
  const _InteractionStyle._() : super._();

  @override
  bool? get canHover;
  @override
  bool? get canTap;
  @override
  @JsonKey(ignore: true)
  _$$InteractionStyleImplCopyWith<_$InteractionStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
