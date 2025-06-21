// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return _WordModel.fromJson(json);
}

/// @nodoc
mixin _$WordModel {
  @JsonKey(name: 'questions')
  List<Question>? get questions => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;

  /// Serializes this WordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordModelCopyWith<WordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordModelCopyWith<$Res> {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) then) =
      _$WordModelCopyWithImpl<$Res, WordModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'questions') List<Question>? questions,
      @JsonKey(name: 'total') int? total});
}

/// @nodoc
class _$WordModelCopyWithImpl<$Res, $Val extends WordModel>
    implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordModelImplCopyWith<$Res>
    implements $WordModelCopyWith<$Res> {
  factory _$$WordModelImplCopyWith(
          _$WordModelImpl value, $Res Function(_$WordModelImpl) then) =
      __$$WordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'questions') List<Question>? questions,
      @JsonKey(name: 'total') int? total});
}

/// @nodoc
class __$$WordModelImplCopyWithImpl<$Res>
    extends _$WordModelCopyWithImpl<$Res, _$WordModelImpl>
    implements _$$WordModelImplCopyWith<$Res> {
  __$$WordModelImplCopyWithImpl(
      _$WordModelImpl _value, $Res Function(_$WordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = freezed,
    Object? total = freezed,
  }) {
    return _then(_$WordModelImpl(
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordModelImpl implements _WordModel {
  const _$WordModelImpl(
      {@JsonKey(name: 'questions') final List<Question>? questions,
      @JsonKey(name: 'total') this.total})
      : _questions = questions;

  factory _$WordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordModelImplFromJson(json);

  final List<Question>? _questions;
  @override
  @JsonKey(name: 'questions')
  List<Question>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'total')
  final int? total;

  @override
  String toString() {
    return 'WordModel(questions: $questions, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordModelImpl &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_questions), total);

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      __$$WordModelImplCopyWithImpl<_$WordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordModelImplToJson(
      this,
    );
  }
}

abstract class _WordModel implements WordModel {
  const factory _WordModel(
      {@JsonKey(name: 'questions') final List<Question>? questions,
      @JsonKey(name: 'total') final int? total}) = _$WordModelImpl;

  factory _WordModel.fromJson(Map<String, dynamic> json) =
      _$WordModelImpl.fromJson;

  @override
  @JsonKey(name: 'questions')
  List<Question>? get questions;
  @override
  @JsonKey(name: 'total')
  int? get total;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: 'explanation')
  String? get explanation => throw _privateConstructorUsedError;
  @JsonKey(name: 'points')
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  String? get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'pronunciation')
  String? get pronunciation => throw _privateConstructorUsedError;
  @JsonKey(name: 'meaning')
  String? get meaning => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_level')
  String? get difficultyLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'options')
  List<Option>? get options => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'correct_answer') String? correctAnswer,
      @JsonKey(name: 'explanation') String? explanation,
      @JsonKey(name: 'points') int? points,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'difficulty_level') String? difficultyLevel,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'options') List<Option>? options});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? correctAnswer = freezed,
    Object? explanation = freezed,
    Object? points = freezed,
    Object? word = freezed,
    Object? pronunciation = freezed,
    Object? meaning = freezed,
    Object? difficultyLevel = freezed,
    Object? categoryName = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
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
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'correct_answer') String? correctAnswer,
      @JsonKey(name: 'explanation') String? explanation,
      @JsonKey(name: 'points') int? points,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'difficulty_level') String? difficultyLevel,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'options') List<Option>? options});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? correctAnswer = freezed,
    Object? explanation = freezed,
    Object? points = freezed,
    Object? word = freezed,
    Object? pronunciation = freezed,
    Object? meaning = freezed,
    Object? difficultyLevel = freezed,
    Object? categoryName = freezed,
    Object? options = freezed,
  }) {
    return _then(_$QuestionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
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
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'question_text') this.questionText,
      @JsonKey(name: 'question_type') this.questionType,
      @JsonKey(name: 'correct_answer') this.correctAnswer,
      @JsonKey(name: 'explanation') this.explanation,
      @JsonKey(name: 'points') this.points,
      @JsonKey(name: 'word') this.word,
      @JsonKey(name: 'pronunciation') this.pronunciation,
      @JsonKey(name: 'meaning') this.meaning,
      @JsonKey(name: 'difficulty_level') this.difficultyLevel,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'options') final List<Option>? options})
      : _options = options;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'question_text')
  final String? questionText;
  @override
  @JsonKey(name: 'question_type')
  final String? questionType;
  @override
  @JsonKey(name: 'correct_answer')
  final String? correctAnswer;
  @override
  @JsonKey(name: 'explanation')
  final String? explanation;
  @override
  @JsonKey(name: 'points')
  final int? points;
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
  @JsonKey(name: 'difficulty_level')
  final String? difficultyLevel;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
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
    return 'Question(id: $id, questionText: $questionText, questionType: $questionType, correctAnswer: $correctAnswer, explanation: $explanation, points: $points, word: $word, pronunciation: $pronunciation, meaning: $meaning, difficultyLevel: $difficultyLevel, categoryName: $categoryName, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      questionText,
      questionType,
      correctAnswer,
      explanation,
      points,
      word,
      pronunciation,
      meaning,
      difficultyLevel,
      categoryName,
      const DeepCollectionEquality().hash(_options));

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'question_text') final String? questionText,
      @JsonKey(name: 'question_type') final String? questionType,
      @JsonKey(name: 'correct_answer') final String? correctAnswer,
      @JsonKey(name: 'explanation') final String? explanation,
      @JsonKey(name: 'points') final int? points,
      @JsonKey(name: 'word') final String? word,
      @JsonKey(name: 'pronunciation') final String? pronunciation,
      @JsonKey(name: 'meaning') final String? meaning,
      @JsonKey(name: 'difficulty_level') final String? difficultyLevel,
      @JsonKey(name: 'category_name') final String? categoryName,
      @JsonKey(name: 'options') final List<Option>? options}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'question_text')
  String? get questionText;
  @override
  @JsonKey(name: 'question_type')
  String? get questionType;
  @override
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer;
  @override
  @JsonKey(name: 'explanation')
  String? get explanation;
  @override
  @JsonKey(name: 'points')
  int? get points;
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
  @JsonKey(name: 'difficulty_level')
  String? get difficultyLevel;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'options')
  List<Option>? get options;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  int? get questionId => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'question_id') int? questionId,
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
    Object? questionId = freezed,
    Object? optionText = freezed,
    Object? isCorrect = freezed,
    Object? optionOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'question_id') int? questionId,
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
    Object? questionId = freezed,
    Object? optionText = freezed,
    Object? isCorrect = freezed,
    Object? optionOrder = freezed,
  }) {
    return _then(_$OptionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'option_text') this.optionText,
      @JsonKey(name: 'is_correct') this.isCorrect,
      @JsonKey(name: 'option_order') this.optionOrder});

  factory _$OptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'question_id')
  final int? questionId;
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
    return 'Option(id: $id, questionId: $questionId, optionText: $optionText, isCorrect: $isCorrect, optionOrder: $optionOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.optionText, optionText) ||
                other.optionText == optionText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.optionOrder, optionOrder) ||
                other.optionOrder == optionOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, questionId, optionText, isCorrect, optionOrder);

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
      @JsonKey(name: 'question_id') final int? questionId,
      @JsonKey(name: 'option_text') final String? optionText,
      @JsonKey(name: 'is_correct') final bool? isCorrect,
      @JsonKey(name: 'option_order') final int? optionOrder}) = _$OptionImpl;

  factory _Option.fromJson(Map<String, dynamic> json) = _$OptionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'question_id')
  int? get questionId;
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
