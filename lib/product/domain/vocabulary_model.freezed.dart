// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VocabularyModel _$VocabularyModelFromJson(Map<String, dynamic> json) {
  return _VocabularyModel.fromJson(json);
}

/// @nodoc
mixin _$VocabularyModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  String? get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'pronunciation')
  String? get pronunciation => throw _privateConstructorUsedError;
  @JsonKey(name: 'meaning')
  String? get meaning => throw _privateConstructorUsedError;
  @JsonKey(name: 'definition')
  String? get definition => throw _privateConstructorUsedError;
  @JsonKey(name: 'example_sentence')
  String? get exampleSentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_level')
  String? get difficultyLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_url')
  String? get audioUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_color')
  String? get categoryColor => throw _privateConstructorUsedError;

  /// Serializes this VocabularyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyModelCopyWith<VocabularyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyModelCopyWith<$Res> {
  factory $VocabularyModelCopyWith(
          VocabularyModel value, $Res Function(VocabularyModel) then) =
      _$VocabularyModelCopyWithImpl<$Res, VocabularyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'definition') String? definition,
      @JsonKey(name: 'example_sentence') String? exampleSentence,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'difficulty_level') String? difficultyLevel,
      @JsonKey(name: 'audio_url') String? audioUrl,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_color') String? categoryColor});
}

/// @nodoc
class _$VocabularyModelCopyWithImpl<$Res, $Val extends VocabularyModel>
    implements $VocabularyModelCopyWith<$Res> {
  _$VocabularyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? word = freezed,
    Object? pronunciation = freezed,
    Object? meaning = freezed,
    Object? definition = freezed,
    Object? exampleSentence = freezed,
    Object? categoryId = freezed,
    Object? difficultyLevel = freezed,
    Object? audioUrl = freezed,
    Object? imageUrl = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? categoryName = freezed,
    Object? categoryColor = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      pronunciation: freezed == pronunciation
          ? _value.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String?,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyModelImplCopyWith<$Res>
    implements $VocabularyModelCopyWith<$Res> {
  factory _$$VocabularyModelImplCopyWith(_$VocabularyModelImpl value,
          $Res Function(_$VocabularyModelImpl) then) =
      __$$VocabularyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'definition') String? definition,
      @JsonKey(name: 'example_sentence') String? exampleSentence,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'difficulty_level') String? difficultyLevel,
      @JsonKey(name: 'audio_url') String? audioUrl,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_color') String? categoryColor});
}

/// @nodoc
class __$$VocabularyModelImplCopyWithImpl<$Res>
    extends _$VocabularyModelCopyWithImpl<$Res, _$VocabularyModelImpl>
    implements _$$VocabularyModelImplCopyWith<$Res> {
  __$$VocabularyModelImplCopyWithImpl(
      _$VocabularyModelImpl _value, $Res Function(_$VocabularyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? word = freezed,
    Object? pronunciation = freezed,
    Object? meaning = freezed,
    Object? definition = freezed,
    Object? exampleSentence = freezed,
    Object? categoryId = freezed,
    Object? difficultyLevel = freezed,
    Object? audioUrl = freezed,
    Object? imageUrl = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? categoryName = freezed,
    Object? categoryColor = freezed,
  }) {
    return _then(_$VocabularyModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      pronunciation: freezed == pronunciation
          ? _value.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String?,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyModelImpl implements _VocabularyModel {
  const _$VocabularyModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'word') this.word,
      @JsonKey(name: 'pronunciation') this.pronunciation,
      @JsonKey(name: 'meaning') this.meaning,
      @JsonKey(name: 'definition') this.definition,
      @JsonKey(name: 'example_sentence') this.exampleSentence,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'difficulty_level') this.difficultyLevel,
      @JsonKey(name: 'audio_url') this.audioUrl,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_color') this.categoryColor});

  factory _$VocabularyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'word')
  final String? word;
  @override
  @JsonKey(name: 'pronunciation')
  final String? pronunciation;
  @override
  @JsonKey(name: 'meaning')
  final String? meaning;
  @override
  @JsonKey(name: 'definition')
  final String? definition;
  @override
  @JsonKey(name: 'example_sentence')
  final String? exampleSentence;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'difficulty_level')
  final String? difficultyLevel;
  @override
  @JsonKey(name: 'audio_url')
  final String? audioUrl;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'category_color')
  final String? categoryColor;

  @override
  String toString() {
    return 'VocabularyModel(id: $id, word: $word, pronunciation: $pronunciation, meaning: $meaning, definition: $definition, exampleSentence: $exampleSentence, categoryId: $categoryId, difficultyLevel: $difficultyLevel, audioUrl: $audioUrl, imageUrl: $imageUrl, isActive: $isActive, createdAt: $createdAt, categoryName: $categoryName, categoryColor: $categoryColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.exampleSentence, exampleSentence) ||
                other.exampleSentence == exampleSentence) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      word,
      pronunciation,
      meaning,
      definition,
      exampleSentence,
      categoryId,
      difficultyLevel,
      audioUrl,
      imageUrl,
      isActive,
      createdAt,
      categoryName,
      categoryColor);

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyModelImplCopyWith<_$VocabularyModelImpl> get copyWith =>
      __$$VocabularyModelImplCopyWithImpl<_$VocabularyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyModelImplToJson(
      this,
    );
  }
}

abstract class _VocabularyModel implements VocabularyModel {
  const factory _VocabularyModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'word') final String? word,
          @JsonKey(name: 'pronunciation') final String? pronunciation,
          @JsonKey(name: 'meaning') final String? meaning,
          @JsonKey(name: 'definition') final String? definition,
          @JsonKey(name: 'example_sentence') final String? exampleSentence,
          @JsonKey(name: 'category_id') final int? categoryId,
          @JsonKey(name: 'difficulty_level') final String? difficultyLevel,
          @JsonKey(name: 'audio_url') final String? audioUrl,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'category_name') final String? categoryName,
          @JsonKey(name: 'category_color') final String? categoryColor}) =
      _$VocabularyModelImpl;

  factory _VocabularyModel.fromJson(Map<String, dynamic> json) =
      _$VocabularyModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'word')
  String? get word;
  @override
  @JsonKey(name: 'pronunciation')
  String? get pronunciation;
  @override
  @JsonKey(name: 'meaning')
  String? get meaning;
  @override
  @JsonKey(name: 'definition')
  String? get definition;
  @override
  @JsonKey(name: 'example_sentence')
  String? get exampleSentence;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'difficulty_level')
  String? get difficultyLevel;
  @override
  @JsonKey(name: 'audio_url')
  String? get audioUrl;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'category_color')
  String? get categoryColor;

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyModelImplCopyWith<_$VocabularyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
