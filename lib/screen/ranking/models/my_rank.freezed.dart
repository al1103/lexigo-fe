// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_rank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyRank _$MyRankFromJson(Map<String, dynamic> json) {
  return _MyRank.fromJson(json);
}

/// @nodoc
mixin _$MyRank {
  @JsonKey(name: 'global')
  Global? get global => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly')
  Global? get weekly => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly')
  Global? get monthly => throw _privateConstructorUsedError;

  /// Serializes this MyRank to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyRank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyRankCopyWith<MyRank> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyRankCopyWith<$Res> {
  factory $MyRankCopyWith(MyRank value, $Res Function(MyRank) then) =
      _$MyRankCopyWithImpl<$Res, MyRank>;
  @useResult
  $Res call(
      {@JsonKey(name: 'global') Global? global,
      @JsonKey(name: 'weekly') Global? weekly,
      @JsonKey(name: 'monthly') Global? monthly});

  $GlobalCopyWith<$Res>? get global;
  $GlobalCopyWith<$Res>? get weekly;
  $GlobalCopyWith<$Res>? get monthly;
}

/// @nodoc
class _$MyRankCopyWithImpl<$Res, $Val extends MyRank>
    implements $MyRankCopyWith<$Res> {
  _$MyRankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyRank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? global = freezed,
    Object? weekly = freezed,
    Object? monthly = freezed,
  }) {
    return _then(_value.copyWith(
      global: freezed == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as Global?,
      weekly: freezed == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as Global?,
      monthly: freezed == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as Global?,
    ) as $Val);
  }

  /// Create a copy of MyRank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalCopyWith<$Res>? get global {
    if (_value.global == null) {
      return null;
    }

    return $GlobalCopyWith<$Res>(_value.global!, (value) {
      return _then(_value.copyWith(global: value) as $Val);
    });
  }

  /// Create a copy of MyRank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalCopyWith<$Res>? get weekly {
    if (_value.weekly == null) {
      return null;
    }

    return $GlobalCopyWith<$Res>(_value.weekly!, (value) {
      return _then(_value.copyWith(weekly: value) as $Val);
    });
  }

  /// Create a copy of MyRank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalCopyWith<$Res>? get monthly {
    if (_value.monthly == null) {
      return null;
    }

    return $GlobalCopyWith<$Res>(_value.monthly!, (value) {
      return _then(_value.copyWith(monthly: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyRankImplCopyWith<$Res> implements $MyRankCopyWith<$Res> {
  factory _$$MyRankImplCopyWith(
          _$MyRankImpl value, $Res Function(_$MyRankImpl) then) =
      __$$MyRankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'global') Global? global,
      @JsonKey(name: 'weekly') Global? weekly,
      @JsonKey(name: 'monthly') Global? monthly});

  @override
  $GlobalCopyWith<$Res>? get global;
  @override
  $GlobalCopyWith<$Res>? get weekly;
  @override
  $GlobalCopyWith<$Res>? get monthly;
}

/// @nodoc
class __$$MyRankImplCopyWithImpl<$Res>
    extends _$MyRankCopyWithImpl<$Res, _$MyRankImpl>
    implements _$$MyRankImplCopyWith<$Res> {
  __$$MyRankImplCopyWithImpl(
      _$MyRankImpl _value, $Res Function(_$MyRankImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyRank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? global = freezed,
    Object? weekly = freezed,
    Object? monthly = freezed,
  }) {
    return _then(_$MyRankImpl(
      global: freezed == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as Global?,
      weekly: freezed == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as Global?,
      monthly: freezed == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as Global?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyRankImpl implements _MyRank {
  const _$MyRankImpl(
      {@JsonKey(name: 'global') this.global,
      @JsonKey(name: 'weekly') this.weekly,
      @JsonKey(name: 'monthly') this.monthly});

  factory _$MyRankImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyRankImplFromJson(json);

  @override
  @JsonKey(name: 'global')
  final Global? global;
  @override
  @JsonKey(name: 'weekly')
  final Global? weekly;
  @override
  @JsonKey(name: 'monthly')
  final Global? monthly;

  @override
  String toString() {
    return 'MyRank(global: $global, weekly: $weekly, monthly: $monthly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyRankImpl &&
            (identical(other.global, global) || other.global == global) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, global, weekly, monthly);

  /// Create a copy of MyRank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyRankImplCopyWith<_$MyRankImpl> get copyWith =>
      __$$MyRankImplCopyWithImpl<_$MyRankImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyRankImplToJson(
      this,
    );
  }
}

abstract class _MyRank implements MyRank {
  const factory _MyRank(
      {@JsonKey(name: 'global') final Global? global,
      @JsonKey(name: 'weekly') final Global? weekly,
      @JsonKey(name: 'monthly') final Global? monthly}) = _$MyRankImpl;

  factory _MyRank.fromJson(Map<String, dynamic> json) = _$MyRankImpl.fromJson;

  @override
  @JsonKey(name: 'global')
  Global? get global;
  @override
  @JsonKey(name: 'weekly')
  Global? get weekly;
  @override
  @JsonKey(name: 'monthly')
  Global? get monthly;

  /// Create a copy of MyRank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyRankImplCopyWith<_$MyRankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Global _$GlobalFromJson(Map<String, dynamic> json) {
  return _Global.fromJson(json);
}

/// @nodoc
mixin _$Global {
  @JsonKey(name: 'rank')
  String? get rank => throw _privateConstructorUsedError;

  /// Serializes this Global to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Global
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalCopyWith<Global> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalCopyWith<$Res> {
  factory $GlobalCopyWith(Global value, $Res Function(Global) then) =
      _$GlobalCopyWithImpl<$Res, Global>;
  @useResult
  $Res call({@JsonKey(name: 'rank') String? rank});
}

/// @nodoc
class _$GlobalCopyWithImpl<$Res, $Val extends Global>
    implements $GlobalCopyWith<$Res> {
  _$GlobalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Global
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalImplCopyWith<$Res> implements $GlobalCopyWith<$Res> {
  factory _$$GlobalImplCopyWith(
          _$GlobalImpl value, $Res Function(_$GlobalImpl) then) =
      __$$GlobalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'rank') String? rank});
}

/// @nodoc
class __$$GlobalImplCopyWithImpl<$Res>
    extends _$GlobalCopyWithImpl<$Res, _$GlobalImpl>
    implements _$$GlobalImplCopyWith<$Res> {
  __$$GlobalImplCopyWithImpl(
      _$GlobalImpl _value, $Res Function(_$GlobalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Global
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = freezed,
  }) {
    return _then(_$GlobalImpl(
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalImpl implements _Global {
  const _$GlobalImpl({@JsonKey(name: 'rank') this.rank});

  factory _$GlobalImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalImplFromJson(json);

  @override
  @JsonKey(name: 'rank')
  final String? rank;

  @override
  String toString() {
    return 'Global(rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalImpl &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rank);

  /// Create a copy of Global
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalImplCopyWith<_$GlobalImpl> get copyWith =>
      __$$GlobalImplCopyWithImpl<_$GlobalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalImplToJson(
      this,
    );
  }
}

abstract class _Global implements Global {
  const factory _Global({@JsonKey(name: 'rank') final String? rank}) =
      _$GlobalImpl;

  factory _Global.fromJson(Map<String, dynamic> json) = _$GlobalImpl.fromJson;

  @override
  @JsonKey(name: 'rank')
  String? get rank;

  /// Create a copy of Global
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalImplCopyWith<_$GlobalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
