// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash.style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashStyle {
  SplashFactory? get splashFactory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashStyleCopyWith<SplashStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStyleCopyWith<$Res> {
  factory $SplashStyleCopyWith(
          SplashStyle value, $Res Function(SplashStyle) then) =
      _$SplashStyleCopyWithImpl<$Res, SplashStyle>;
  @useResult
  $Res call({SplashFactory? splashFactory});
}

/// @nodoc
class _$SplashStyleCopyWithImpl<$Res, $Val extends SplashStyle>
    implements $SplashStyleCopyWith<$Res> {
  _$SplashStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashFactory = freezed,
  }) {
    return _then(_value.copyWith(
      splashFactory: freezed == splashFactory
          ? _value.splashFactory
          : splashFactory // ignore: cast_nullable_to_non_nullable
              as SplashFactory?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashStyleImplCopyWith<$Res>
    implements $SplashStyleCopyWith<$Res> {
  factory _$$SplashStyleImplCopyWith(
          _$SplashStyleImpl value, $Res Function(_$SplashStyleImpl) then) =
      __$$SplashStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SplashFactory? splashFactory});
}

/// @nodoc
class __$$SplashStyleImplCopyWithImpl<$Res>
    extends _$SplashStyleCopyWithImpl<$Res, _$SplashStyleImpl>
    implements _$$SplashStyleImplCopyWith<$Res> {
  __$$SplashStyleImplCopyWithImpl(
      _$SplashStyleImpl _value, $Res Function(_$SplashStyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashFactory = freezed,
  }) {
    return _then(_$SplashStyleImpl(
      splashFactory: freezed == splashFactory
          ? _value.splashFactory
          : splashFactory // ignore: cast_nullable_to_non_nullable
              as SplashFactory?,
    ));
  }
}

/// @nodoc

class _$SplashStyleImpl extends _SplashStyle {
  const _$SplashStyleImpl({this.splashFactory}) : super._();

  @override
  final SplashFactory? splashFactory;

  @override
  String toString() {
    return 'SplashStyle(splashFactory: $splashFactory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashStyleImpl &&
            (identical(other.splashFactory, splashFactory) ||
                other.splashFactory == splashFactory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, splashFactory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashStyleImplCopyWith<_$SplashStyleImpl> get copyWith =>
      __$$SplashStyleImplCopyWithImpl<_$SplashStyleImpl>(this, _$identity);
}

abstract class _SplashStyle extends SplashStyle {
  const factory _SplashStyle({final SplashFactory? splashFactory}) =
      _$SplashStyleImpl;
  const _SplashStyle._() : super._();

  @override
  SplashFactory? get splashFactory;
  @override
  @JsonKey(ignore: true)
  _$$SplashStyleImplCopyWith<_$SplashStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
