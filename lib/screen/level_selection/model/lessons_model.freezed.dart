// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonsModel _$LessonsModelFromJson(Map<String, dynamic> json) {
  return _Lessons.fromJson(json);
}

/// @nodoc
mixin _$LessonsModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_level')
  String? get difficultyLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
  int? get totalQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_published')
  bool? get isPublished => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_question_count')
  String? get actualQuestionCount => throw _privateConstructorUsedError;

  /// Serializes this LessonsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonsModelCopyWith<LessonsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsModelCopyWith<$Res> {
  factory $LessonsModelCopyWith(
          LessonsModel value, $Res Function(LessonsModel) then) =
      _$LessonsModelCopyWithImpl<$Res, LessonsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'difficulty_level') String? difficultyLevel,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'is_published') bool? isPublished,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'actual_question_count') String? actualQuestionCount});
}

/// @nodoc
class _$LessonsModelCopyWithImpl<$Res, $Val extends LessonsModel>
    implements $LessonsModelCopyWith<$Res> {
  _$LessonsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? difficultyLevel = freezed,
    Object? totalQuestions = freezed,
    Object? isPublished = freezed,
    Object? createdAt = freezed,
    Object? actualQuestionCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublished: freezed == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualQuestionCount: freezed == actualQuestionCount
          ? _value.actualQuestionCount
          : actualQuestionCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonsImplCopyWith<$Res>
    implements $LessonsModelCopyWith<$Res> {
  factory _$$LessonsImplCopyWith(
          _$LessonsImpl value, $Res Function(_$LessonsImpl) then) =
      __$$LessonsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'difficulty_level') String? difficultyLevel,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'is_published') bool? isPublished,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'actual_question_count') String? actualQuestionCount});
}

/// @nodoc
class __$$LessonsImplCopyWithImpl<$Res>
    extends _$LessonsModelCopyWithImpl<$Res, _$LessonsImpl>
    implements _$$LessonsImplCopyWith<$Res> {
  __$$LessonsImplCopyWithImpl(
      _$LessonsImpl _value, $Res Function(_$LessonsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? difficultyLevel = freezed,
    Object? totalQuestions = freezed,
    Object? isPublished = freezed,
    Object? createdAt = freezed,
    Object? actualQuestionCount = freezed,
  }) {
    return _then(_$LessonsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublished: freezed == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualQuestionCount: freezed == actualQuestionCount
          ? _value.actualQuestionCount
          : actualQuestionCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonsImpl implements _Lessons {
  const _$LessonsImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'difficulty_level') this.difficultyLevel,
      @JsonKey(name: 'total_questions') this.totalQuestions,
      @JsonKey(name: 'is_published') this.isPublished,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'actual_question_count') this.actualQuestionCount});

  factory _$LessonsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonsImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'difficulty_level')
  final String? difficultyLevel;
  @override
  @JsonKey(name: 'total_questions')
  final int? totalQuestions;
  @override
  @JsonKey(name: 'is_published')
  final bool? isPublished;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'actual_question_count')
  final String? actualQuestionCount;

  @override
  String toString() {
    return 'LessonsModel(id: $id, title: $title, description: $description, difficultyLevel: $difficultyLevel, totalQuestions: $totalQuestions, isPublished: $isPublished, createdAt: $createdAt, actualQuestionCount: $actualQuestionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.actualQuestionCount, actualQuestionCount) ||
                other.actualQuestionCount == actualQuestionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      difficultyLevel,
      totalQuestions,
      isPublished,
      createdAt,
      actualQuestionCount);

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsImplCopyWith<_$LessonsImpl> get copyWith =>
      __$$LessonsImplCopyWithImpl<_$LessonsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonsImplToJson(
      this,
    );
  }
}

abstract class _Lessons implements LessonsModel {
  const factory _Lessons(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'difficulty_level') final String? difficultyLevel,
      @JsonKey(name: 'total_questions') final int? totalQuestions,
      @JsonKey(name: 'is_published') final bool? isPublished,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'actual_question_count')
      final String? actualQuestionCount}) = _$LessonsImpl;

  factory _Lessons.fromJson(Map<String, dynamic> json) = _$LessonsImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'difficulty_level')
  String? get difficultyLevel;
  @override
  @JsonKey(name: 'total_questions')
  int? get totalQuestions;
  @override
  @JsonKey(name: 'is_published')
  bool? get isPublished;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'actual_question_count')
  String? get actualQuestionCount;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonsImplCopyWith<_$LessonsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
