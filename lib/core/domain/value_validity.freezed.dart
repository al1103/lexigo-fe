// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_validity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ValueValidity<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) valid,
    required TResult Function(ValueFailure<T> failure) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? valid,
    TResult? Function(ValueFailure<T> failure)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? valid,
    TResult Function(ValueFailure<T> failure)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ValidValue<T> value) valid,
    required TResult Function(InvalidValue<T> value) invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ValidValue<T> value)? valid,
    TResult? Function(InvalidValue<T> value)? invalid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ValidValue<T> value)? valid,
    TResult Function(InvalidValue<T> value)? invalid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueValidityCopyWith<T, $Res> {
  factory $ValueValidityCopyWith(
          ValueValidity<T> value, $Res Function(ValueValidity<T>) then) =
      _$ValueValidityCopyWithImpl<T, $Res, ValueValidity<T>>;
}

/// @nodoc
class _$ValueValidityCopyWithImpl<T, $Res, $Val extends ValueValidity<T>>
    implements $ValueValidityCopyWith<T, $Res> {
  _$ValueValidityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValueValidity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ValidValueImplCopyWith<T, $Res> {
  factory _$$ValidValueImplCopyWith(
          _$ValidValueImpl<T> value, $Res Function(_$ValidValueImpl<T>) then) =
      __$$ValidValueImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ValidValueImplCopyWithImpl<T, $Res>
    extends _$ValueValidityCopyWithImpl<T, $Res, _$ValidValueImpl<T>>
    implements _$$ValidValueImplCopyWith<T, $Res> {
  __$$ValidValueImplCopyWithImpl(
      _$ValidValueImpl<T> _value, $Res Function(_$ValidValueImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ValueValidity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ValidValueImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ValidValueImpl<T> implements ValidValue<T> {
  const _$ValidValueImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'ValueValidity<$T>.valid(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidValueImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ValueValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidValueImplCopyWith<T, _$ValidValueImpl<T>> get copyWith =>
      __$$ValidValueImplCopyWithImpl<T, _$ValidValueImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) valid,
    required TResult Function(ValueFailure<T> failure) invalid,
  }) {
    return valid(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? valid,
    TResult? Function(ValueFailure<T> failure)? invalid,
  }) {
    return valid?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? valid,
    TResult Function(ValueFailure<T> failure)? invalid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ValidValue<T> value) valid,
    required TResult Function(InvalidValue<T> value) invalid,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ValidValue<T> value)? valid,
    TResult? Function(InvalidValue<T> value)? invalid,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ValidValue<T> value)? valid,
    TResult Function(InvalidValue<T> value)? invalid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class ValidValue<T> implements ValueValidity<T> {
  const factory ValidValue({required final T data}) = _$ValidValueImpl<T>;

  T get data;

  /// Create a copy of ValueValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidValueImplCopyWith<T, _$ValidValueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidValueImplCopyWith<T, $Res> {
  factory _$$InvalidValueImplCopyWith(_$InvalidValueImpl<T> value,
          $Res Function(_$InvalidValueImpl<T>) then) =
      __$$InvalidValueImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ValueFailure<T> failure});

  $ValueFailureCopyWith<T, $Res> get failure;
}

/// @nodoc
class __$$InvalidValueImplCopyWithImpl<T, $Res>
    extends _$ValueValidityCopyWithImpl<T, $Res, _$InvalidValueImpl<T>>
    implements _$$InvalidValueImplCopyWith<T, $Res> {
  __$$InvalidValueImplCopyWithImpl(
      _$InvalidValueImpl<T> _value, $Res Function(_$InvalidValueImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ValueValidity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$InvalidValueImpl<T>(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<T>,
    ));
  }

  /// Create a copy of ValueValidity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValueFailureCopyWith<T, $Res> get failure {
    return $ValueFailureCopyWith<T, $Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$InvalidValueImpl<T> implements InvalidValue<T> {
  const _$InvalidValueImpl({required this.failure});

  @override
  final ValueFailure<T> failure;

  @override
  String toString() {
    return 'ValueValidity<$T>.invalid(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidValueImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of ValueValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidValueImplCopyWith<T, _$InvalidValueImpl<T>> get copyWith =>
      __$$InvalidValueImplCopyWithImpl<T, _$InvalidValueImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) valid,
    required TResult Function(ValueFailure<T> failure) invalid,
  }) {
    return invalid(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? valid,
    TResult? Function(ValueFailure<T> failure)? invalid,
  }) {
    return invalid?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? valid,
    TResult Function(ValueFailure<T> failure)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ValidValue<T> value) valid,
    required TResult Function(InvalidValue<T> value) invalid,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ValidValue<T> value)? valid,
    TResult? Function(InvalidValue<T> value)? invalid,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ValidValue<T> value)? valid,
    TResult Function(InvalidValue<T> value)? invalid,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class InvalidValue<T> implements ValueValidity<T> {
  const factory InvalidValue({required final ValueFailure<T> failure}) =
      _$InvalidValueImpl<T>;

  ValueFailure<T> get failure;

  /// Create a copy of ValueValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidValueImplCopyWith<T, _$InvalidValueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
