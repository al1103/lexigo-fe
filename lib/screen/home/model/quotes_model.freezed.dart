// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuotesModel _$QuotesModelFromJson(Map<String, dynamic> json) {
  return _QuotesModel.fromJson(json);
}

/// @nodoc
mixin _$QuotesModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this QuotesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuotesModelCopyWith<QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesModelCopyWith<$Res> {
  factory $QuotesModelCopyWith(
          QuotesModel value, $Res Function(QuotesModel) then) =
      _$QuotesModelCopyWithImpl<$Res, QuotesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$QuotesModelCopyWithImpl<$Res, $Val extends QuotesModel>
    implements $QuotesModelCopyWith<$Res> {
  _$QuotesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuotesModelImplCopyWith<$Res>
    implements $QuotesModelCopyWith<$Res> {
  factory _$$QuotesModelImplCopyWith(
          _$QuotesModelImpl value, $Res Function(_$QuotesModelImpl) then) =
      __$$QuotesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$QuotesModelImplCopyWithImpl<$Res>
    extends _$QuotesModelCopyWithImpl<$Res, _$QuotesModelImpl>
    implements _$$QuotesModelImplCopyWith<$Res> {
  __$$QuotesModelImplCopyWithImpl(
      _$QuotesModelImpl _value, $Res Function(_$QuotesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? author = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$QuotesModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuotesModelImpl implements _QuotesModel {
  const _$QuotesModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'author') this.author,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$QuotesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotesModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'author')
  final String? author;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'QuotesModel(id: $id, content: $content, author: $author, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, author, createdAt);

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotesModelImplCopyWith<_$QuotesModelImpl> get copyWith =>
      __$$QuotesModelImplCopyWithImpl<_$QuotesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotesModelImplToJson(
      this,
    );
  }
}

abstract class _QuotesModel implements QuotesModel {
  const factory _QuotesModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'content') final String? content,
          @JsonKey(name: 'author') final String? author,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$QuotesModelImpl;

  factory _QuotesModel.fromJson(Map<String, dynamic> json) =
      _$QuotesModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'content')
  String? get content;
  @override
  @JsonKey(name: 'author')
  String? get author;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuotesModelImplCopyWith<_$QuotesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
