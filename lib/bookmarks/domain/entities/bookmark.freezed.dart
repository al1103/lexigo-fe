// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizBookmark _$QuizBookmarkFromJson(Map<String, dynamic> json) {
  return _QuizBookmark.fromJson(json);
}

/// @nodoc
mixin _$QuizBookmark {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookmarked_at')
  DateTime? get bookmarkedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'word_id')
  int? get wordId => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  String? get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'meaning')
  String? get meaning => throw _privateConstructorUsedError;
  @JsonKey(name: 'pronunciation')
  String? get pronunciation => throw _privateConstructorUsedError;
  @JsonKey(name: 'example_sentence')
  String? get exampleSentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_level')
  String? get difficultyLevel => throw _privateConstructorUsedError;

  /// Serializes this QuizBookmark to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizBookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizBookmarkCopyWith<QuizBookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizBookmarkCopyWith<$Res> {
  factory $QuizBookmarkCopyWith(
          QuizBookmark value, $Res Function(QuizBookmark) then) =
      _$QuizBookmarkCopyWithImpl<$Res, QuizBookmark>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'bookmarked_at') DateTime? bookmarkedAt,
      @JsonKey(name: 'word_id') int? wordId,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'example_sentence') String? exampleSentence,
      @JsonKey(name: 'difficulty_level') String? difficultyLevel});
}

/// @nodoc
class _$QuizBookmarkCopyWithImpl<$Res, $Val extends QuizBookmark>
    implements $QuizBookmarkCopyWith<$Res> {
  _$QuizBookmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizBookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? notes = freezed,
    Object? bookmarkedAt = freezed,
    Object? wordId = freezed,
    Object? word = freezed,
    Object? meaning = freezed,
    Object? pronunciation = freezed,
    Object? exampleSentence = freezed,
    Object? difficultyLevel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmarkedAt: freezed == bookmarkedAt
          ? _value.bookmarkedAt
          : bookmarkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      wordId: freezed == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as int?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      pronunciation: freezed == pronunciation
          ? _value.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String?,
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizBookmarkImplCopyWith<$Res>
    implements $QuizBookmarkCopyWith<$Res> {
  factory _$$QuizBookmarkImplCopyWith(
          _$QuizBookmarkImpl value, $Res Function(_$QuizBookmarkImpl) then) =
      __$$QuizBookmarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'bookmarked_at') DateTime? bookmarkedAt,
      @JsonKey(name: 'word_id') int? wordId,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'example_sentence') String? exampleSentence,
      @JsonKey(name: 'difficulty_level') String? difficultyLevel});
}

/// @nodoc
class __$$QuizBookmarkImplCopyWithImpl<$Res>
    extends _$QuizBookmarkCopyWithImpl<$Res, _$QuizBookmarkImpl>
    implements _$$QuizBookmarkImplCopyWith<$Res> {
  __$$QuizBookmarkImplCopyWithImpl(
      _$QuizBookmarkImpl _value, $Res Function(_$QuizBookmarkImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizBookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? notes = freezed,
    Object? bookmarkedAt = freezed,
    Object? wordId = freezed,
    Object? word = freezed,
    Object? meaning = freezed,
    Object? pronunciation = freezed,
    Object? exampleSentence = freezed,
    Object? difficultyLevel = freezed,
  }) {
    return _then(_$QuizBookmarkImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmarkedAt: freezed == bookmarkedAt
          ? _value.bookmarkedAt
          : bookmarkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      wordId: freezed == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as int?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      pronunciation: freezed == pronunciation
          ? _value.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String?,
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizBookmarkImpl implements _QuizBookmark {
  const _$QuizBookmarkImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'bookmarked_at') this.bookmarkedAt,
      @JsonKey(name: 'word_id') this.wordId,
      @JsonKey(name: 'word') this.word,
      @JsonKey(name: 'meaning') this.meaning,
      @JsonKey(name: 'pronunciation') this.pronunciation,
      @JsonKey(name: 'example_sentence') this.exampleSentence,
      @JsonKey(name: 'difficulty_level') this.difficultyLevel});

  factory _$QuizBookmarkImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizBookmarkImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'notes')
  final String? notes;
  @override
  @JsonKey(name: 'bookmarked_at')
  final DateTime? bookmarkedAt;
  @override
  @JsonKey(name: 'word_id')
  final int? wordId;
  @override
  @JsonKey(name: 'word')
  final String? word;
  @override
  @JsonKey(name: 'meaning')
  final String? meaning;
  @override
  @JsonKey(name: 'pronunciation')
  final String? pronunciation;
  @override
  @JsonKey(name: 'example_sentence')
  final String? exampleSentence;
  @override
  @JsonKey(name: 'difficulty_level')
  final String? difficultyLevel;

  @override
  String toString() {
    return 'QuizBookmark(id: $id, notes: $notes, bookmarkedAt: $bookmarkedAt, wordId: $wordId, word: $word, meaning: $meaning, pronunciation: $pronunciation, exampleSentence: $exampleSentence, difficultyLevel: $difficultyLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizBookmarkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.bookmarkedAt, bookmarkedAt) ||
                other.bookmarkedAt == bookmarkedAt) &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.exampleSentence, exampleSentence) ||
                other.exampleSentence == exampleSentence) &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, notes, bookmarkedAt, wordId,
      word, meaning, pronunciation, exampleSentence, difficultyLevel);

  /// Create a copy of QuizBookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizBookmarkImplCopyWith<_$QuizBookmarkImpl> get copyWith =>
      __$$QuizBookmarkImplCopyWithImpl<_$QuizBookmarkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizBookmarkImplToJson(
      this,
    );
  }
}

abstract class _QuizBookmark implements QuizBookmark {
  const factory _QuizBookmark(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'notes') final String? notes,
          @JsonKey(name: 'bookmarked_at') final DateTime? bookmarkedAt,
          @JsonKey(name: 'word_id') final int? wordId,
          @JsonKey(name: 'word') final String? word,
          @JsonKey(name: 'meaning') final String? meaning,
          @JsonKey(name: 'pronunciation') final String? pronunciation,
          @JsonKey(name: 'example_sentence') final String? exampleSentence,
          @JsonKey(name: 'difficulty_level') final String? difficultyLevel}) =
      _$QuizBookmarkImpl;

  factory _QuizBookmark.fromJson(Map<String, dynamic> json) =
      _$QuizBookmarkImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override
  @JsonKey(name: 'bookmarked_at')
  DateTime? get bookmarkedAt;
  @override
  @JsonKey(name: 'word_id')
  int? get wordId;
  @override
  @JsonKey(name: 'word')
  String? get word;
  @override
  @JsonKey(name: 'meaning')
  String? get meaning;
  @override
  @JsonKey(name: 'pronunciation')
  String? get pronunciation;
  @override
  @JsonKey(name: 'example_sentence')
  String? get exampleSentence;
  @override
  @JsonKey(name: 'difficulty_level')
  String? get difficultyLevel;

  /// Create a copy of QuizBookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizBookmarkImplCopyWith<_$QuizBookmarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
