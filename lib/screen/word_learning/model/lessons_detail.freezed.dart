// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonsDetail _$LessonsDetailFromJson(Map<String, dynamic> json) {
  return _LessonsDetail.fromJson(json);
}

/// @nodoc
mixin _$LessonsDetail {
  @JsonKey(name: 'question_id')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'points')
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  Word? get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'options')
  List<Option>? get options => throw _privateConstructorUsedError;

  /// Serializes this LessonsDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonsDetailCopyWith<LessonsDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsDetailCopyWith<$Res> {
  factory $LessonsDetailCopyWith(
          LessonsDetail value, $Res Function(LessonsDetail) then) =
      _$LessonsDetailCopyWithImpl<$Res, LessonsDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'points') int? points,
      @JsonKey(name: 'word') Word? word,
      @JsonKey(name: 'options') List<Option>? options});

  $WordCopyWith<$Res>? get word;
}

/// @nodoc
class _$LessonsDetailCopyWithImpl<$Res, $Val extends LessonsDetail>
    implements $LessonsDetailCopyWith<$Res> {
  _$LessonsDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? points = freezed,
    Object? word = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
    ) as $Val);
  }

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res>? get word {
    if (_value.word == null) {
      return null;
    }

    return $WordCopyWith<$Res>(_value.word!, (value) {
      return _then(_value.copyWith(word: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LessonsDetailImplCopyWith<$Res>
    implements $LessonsDetailCopyWith<$Res> {
  factory _$$LessonsDetailImplCopyWith(
          _$LessonsDetailImpl value, $Res Function(_$LessonsDetailImpl) then) =
      __$$LessonsDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'points') int? points,
      @JsonKey(name: 'word') Word? word,
      @JsonKey(name: 'options') List<Option>? options});

  @override
  $WordCopyWith<$Res>? get word;
}

/// @nodoc
class __$$LessonsDetailImplCopyWithImpl<$Res>
    extends _$LessonsDetailCopyWithImpl<$Res, _$LessonsDetailImpl>
    implements _$$LessonsDetailImplCopyWith<$Res> {
  __$$LessonsDetailImplCopyWithImpl(
      _$LessonsDetailImpl _value, $Res Function(_$LessonsDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? points = freezed,
    Object? word = freezed,
    Object? options = freezed,
  }) {
    return _then(_$LessonsDetailImpl(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonsDetailImpl implements _LessonsDetail {
  const _$LessonsDetailImpl(
      {@JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'question_text') this.questionText,
      @JsonKey(name: 'question_type') this.questionType,
      @JsonKey(name: 'points') this.points,
      @JsonKey(name: 'word') this.word,
      @JsonKey(name: 'options') final List<Option>? options})
      : _options = options;

  factory _$LessonsDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonsDetailImplFromJson(json);

  @override
  @JsonKey(name: 'question_id')
  final int? questionId;
  @override
  @JsonKey(name: 'question_text')
  final String? questionText;
  @override
  @JsonKey(name: 'question_type')
  final String? questionType;
  @override
  @JsonKey(name: 'points')
  final int? points;
  @override
  @JsonKey(name: 'word')
  final Word? word;
  final List<Option>? _options;
  @override
  @JsonKey(name: 'options')
  List<Option>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LessonsDetail(questionId: $questionId, questionText: $questionText, questionType: $questionType, points: $points, word: $word, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsDetailImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.word, word) || other.word == word) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      questionText,
      questionType,
      points,
      word,
      const DeepCollectionEquality().hash(_options));

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsDetailImplCopyWith<_$LessonsDetailImpl> get copyWith =>
      __$$LessonsDetailImplCopyWithImpl<_$LessonsDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonsDetailImplToJson(
      this,
    );
  }
}

abstract class _LessonsDetail implements LessonsDetail {
  const factory _LessonsDetail(
          {@JsonKey(name: 'question_id') final int? questionId,
          @JsonKey(name: 'question_text') final String? questionText,
          @JsonKey(name: 'question_type') final String? questionType,
          @JsonKey(name: 'points') final int? points,
          @JsonKey(name: 'word') final Word? word,
          @JsonKey(name: 'options') final List<Option>? options}) =
      _$LessonsDetailImpl;

  factory _LessonsDetail.fromJson(Map<String, dynamic> json) =
      _$LessonsDetailImpl.fromJson;

  @override
  @JsonKey(name: 'question_id')
  int? get questionId;
  @override
  @JsonKey(name: 'question_text')
  String? get questionText;
  @override
  @JsonKey(name: 'question_type')
  String? get questionType;
  @override
  @JsonKey(name: 'points')
  int? get points;
  @override
  @JsonKey(name: 'word')
  Word? get word;
  @override
  @JsonKey(name: 'options')
  List<Option>? get options;

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonsDetailImplCopyWith<_$LessonsDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_text')
  String? get optionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool? get isCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_order')
  int? get optionOrder => throw _privateConstructorUsedError;

  /// Serializes this Option to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'option_text') String? optionText,
      @JsonKey(name: 'is_correct') bool? isCorrect,
      @JsonKey(name: 'option_order') int? optionOrder});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? optionText = freezed,
    Object? isCorrect = freezed,
    Object? optionOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      optionText: freezed == optionText
          ? _value.optionText
          : optionText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
      optionOrder: freezed == optionOrder
          ? _value.optionOrder
          : optionOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(
          _$OptionImpl value, $Res Function(_$OptionImpl) then) =
      __$$OptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'option_text') String? optionText,
      @JsonKey(name: 'is_correct') bool? isCorrect,
      @JsonKey(name: 'option_order') int? optionOrder});
}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$OptionImpl>
    implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(
      _$OptionImpl _value, $Res Function(_$OptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? optionText = freezed,
    Object? isCorrect = freezed,
    Object? optionOrder = freezed,
  }) {
    return _then(_$OptionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      optionText: freezed == optionText
          ? _value.optionText
          : optionText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
      optionOrder: freezed == optionOrder
          ? _value.optionOrder
          : optionOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionImpl implements _Option {
  const _$OptionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'option_text') this.optionText,
      @JsonKey(name: 'is_correct') this.isCorrect,
      @JsonKey(name: 'option_order') this.optionOrder});

  factory _$OptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'option_text')
  final String? optionText;
  @override
  @JsonKey(name: 'is_correct')
  final bool? isCorrect;
  @override
  @JsonKey(name: 'option_order')
  final int? optionOrder;

  @override
  String toString() {
    return 'Option(id: $id, optionText: $optionText, isCorrect: $isCorrect, optionOrder: $optionOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.optionText, optionText) ||
                other.optionText == optionText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.optionOrder, optionOrder) ||
                other.optionOrder == optionOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, optionText, isCorrect, optionOrder);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionImplToJson(
      this,
    );
  }
}

abstract class _Option implements Option {
  const factory _Option(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'option_text') final String? optionText,
      @JsonKey(name: 'is_correct') final bool? isCorrect,
      @JsonKey(name: 'option_order') final int? optionOrder}) = _$OptionImpl;

  factory _Option.fromJson(Map<String, dynamic> json) = _$OptionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'option_text')
  String? get optionText;
  @override
  @JsonKey(name: 'is_correct')
  bool? get isCorrect;
  @override
  @JsonKey(name: 'option_order')
  int? get optionOrder;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  String? get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'pronunciation')
  String? get pronunciation => throw _privateConstructorUsedError;
  @JsonKey(name: 'meaning')
  String? get meaning => throw _privateConstructorUsedError;
  @JsonKey(name: 'definition')
  dynamic get definition => throw _privateConstructorUsedError;
  @JsonKey(name: 'example_sentence')
  String? get exampleSentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_url')
  dynamic get audioUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  dynamic get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookmark_notes')
  dynamic get bookmarkNotes => throw _privateConstructorUsedError;

  /// Serializes this Word to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'definition') dynamic definition,
      @JsonKey(name: 'example_sentence') String? exampleSentence,
      @JsonKey(name: 'audio_url') dynamic audioUrl,
      @JsonKey(name: 'image_url') dynamic imageUrl,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'bookmark_notes') dynamic bookmarkNotes});
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Word
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
    Object? audioUrl = freezed,
    Object? imageUrl = freezed,
    Object? isBookmarked = freezed,
    Object? bookmarkNotes = freezed,
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
              as dynamic,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      bookmarkNotes: freezed == bookmarkNotes
          ? _value.bookmarkNotes
          : bookmarkNotes // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordImplCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$WordImplCopyWith(
          _$WordImpl value, $Res Function(_$WordImpl) then) =
      __$$WordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'definition') dynamic definition,
      @JsonKey(name: 'example_sentence') String? exampleSentence,
      @JsonKey(name: 'audio_url') dynamic audioUrl,
      @JsonKey(name: 'image_url') dynamic imageUrl,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      @JsonKey(name: 'bookmark_notes') dynamic bookmarkNotes});
}

/// @nodoc
class __$$WordImplCopyWithImpl<$Res>
    extends _$WordCopyWithImpl<$Res, _$WordImpl>
    implements _$$WordImplCopyWith<$Res> {
  __$$WordImplCopyWithImpl(_$WordImpl _value, $Res Function(_$WordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Word
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
    Object? audioUrl = freezed,
    Object? imageUrl = freezed,
    Object? isBookmarked = freezed,
    Object? bookmarkNotes = freezed,
  }) {
    return _then(_$WordImpl(
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
              as dynamic,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      bookmarkNotes: freezed == bookmarkNotes
          ? _value.bookmarkNotes
          : bookmarkNotes // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordImpl implements _Word {
  const _$WordImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'word') this.word,
      @JsonKey(name: 'pronunciation') this.pronunciation,
      @JsonKey(name: 'meaning') this.meaning,
      @JsonKey(name: 'definition') this.definition,
      @JsonKey(name: 'example_sentence') this.exampleSentence,
      @JsonKey(name: 'audio_url') this.audioUrl,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'is_bookmarked') this.isBookmarked,
      @JsonKey(name: 'bookmark_notes') this.bookmarkNotes});

  factory _$WordImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordImplFromJson(json);

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
  final dynamic definition;
  @override
  @JsonKey(name: 'example_sentence')
  final String? exampleSentence;
  @override
  @JsonKey(name: 'audio_url')
  final dynamic audioUrl;
  @override
  @JsonKey(name: 'image_url')
  final dynamic imageUrl;
  @override
  @JsonKey(name: 'is_bookmarked')
  final bool? isBookmarked;
  @override
  @JsonKey(name: 'bookmark_notes')
  final dynamic bookmarkNotes;

  @override
  String toString() {
    return 'Word(id: $id, word: $word, pronunciation: $pronunciation, meaning: $meaning, definition: $definition, exampleSentence: $exampleSentence, audioUrl: $audioUrl, imageUrl: $imageUrl, isBookmarked: $isBookmarked, bookmarkNotes: $bookmarkNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            const DeepCollectionEquality()
                .equals(other.definition, definition) &&
            (identical(other.exampleSentence, exampleSentence) ||
                other.exampleSentence == exampleSentence) &&
            const DeepCollectionEquality().equals(other.audioUrl, audioUrl) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            const DeepCollectionEquality()
                .equals(other.bookmarkNotes, bookmarkNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      word,
      pronunciation,
      meaning,
      const DeepCollectionEquality().hash(definition),
      exampleSentence,
      const DeepCollectionEquality().hash(audioUrl),
      const DeepCollectionEquality().hash(imageUrl),
      isBookmarked,
      const DeepCollectionEquality().hash(bookmarkNotes));

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      __$$WordImplCopyWithImpl<_$WordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordImplToJson(
      this,
    );
  }
}

abstract class _Word implements Word {
  const factory _Word(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'word') final String? word,
          @JsonKey(name: 'pronunciation') final String? pronunciation,
          @JsonKey(name: 'meaning') final String? meaning,
          @JsonKey(name: 'definition') final dynamic definition,
          @JsonKey(name: 'example_sentence') final String? exampleSentence,
          @JsonKey(name: 'audio_url') final dynamic audioUrl,
          @JsonKey(name: 'image_url') final dynamic imageUrl,
          @JsonKey(name: 'is_bookmarked') final bool? isBookmarked,
          @JsonKey(name: 'bookmark_notes') final dynamic bookmarkNotes}) =
      _$WordImpl;

  factory _Word.fromJson(Map<String, dynamic> json) = _$WordImpl.fromJson;

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
  dynamic get definition;
  @override
  @JsonKey(name: 'example_sentence')
  String? get exampleSentence;
  @override
  @JsonKey(name: 'audio_url')
  dynamic get audioUrl;
  @override
  @JsonKey(name: 'image_url')
  dynamic get imageUrl;
  @override
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked;
  @override
  @JsonKey(name: 'bookmark_notes')
  dynamic get bookmarkNotes;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
