// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmartWord _$SmartWordFromJson(Map<String, dynamic> json) {
  return _SmartWord.fromJson(json);
}

/// @nodoc
mixin _$SmartWord {
  @JsonKey(name: 'word')
  String? get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'pronunciations')
  List<Pronunciation>? get pronunciations => throw _privateConstructorUsedError;
  @JsonKey(name: 'meanings')
  List<Meaning>? get meanings => throw _privateConstructorUsedError;

  /// Serializes this SmartWord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmartWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartWordCopyWith<SmartWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartWordCopyWith<$Res> {
  factory $SmartWordCopyWith(SmartWord value, $Res Function(SmartWord) then) =
      _$SmartWordCopyWithImpl<$Res, SmartWord>;
  @useResult
  $Res call(
      {@JsonKey(name: 'word') String? word,
      @JsonKey(name: 'pronunciations') List<Pronunciation>? pronunciations,
      @JsonKey(name: 'meanings') List<Meaning>? meanings});
}

/// @nodoc
class _$SmartWordCopyWithImpl<$Res, $Val extends SmartWord>
    implements $SmartWordCopyWith<$Res> {
  _$SmartWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmartWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? pronunciations = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_value.copyWith(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      pronunciations: freezed == pronunciations
          ? _value.pronunciations
          : pronunciations // ignore: cast_nullable_to_non_nullable
              as List<Pronunciation>?,
      meanings: freezed == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<Meaning>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmartWordImplCopyWith<$Res>
    implements $SmartWordCopyWith<$Res> {
  factory _$$SmartWordImplCopyWith(
          _$SmartWordImpl value, $Res Function(_$SmartWordImpl) then) =
      __$$SmartWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'word') String? word,
      @JsonKey(name: 'pronunciations') List<Pronunciation>? pronunciations,
      @JsonKey(name: 'meanings') List<Meaning>? meanings});
}

/// @nodoc
class __$$SmartWordImplCopyWithImpl<$Res>
    extends _$SmartWordCopyWithImpl<$Res, _$SmartWordImpl>
    implements _$$SmartWordImplCopyWith<$Res> {
  __$$SmartWordImplCopyWithImpl(
      _$SmartWordImpl _value, $Res Function(_$SmartWordImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? pronunciations = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_$SmartWordImpl(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      pronunciations: freezed == pronunciations
          ? _value._pronunciations
          : pronunciations // ignore: cast_nullable_to_non_nullable
              as List<Pronunciation>?,
      meanings: freezed == meanings
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<Meaning>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmartWordImpl implements _SmartWord {
  const _$SmartWordImpl(
      {@JsonKey(name: 'word') this.word,
      @JsonKey(name: 'pronunciations')
      final List<Pronunciation>? pronunciations,
      @JsonKey(name: 'meanings') final List<Meaning>? meanings})
      : _pronunciations = pronunciations,
        _meanings = meanings;

  factory _$SmartWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmartWordImplFromJson(json);

  @override
  @JsonKey(name: 'word')
  final String? word;
  final List<Pronunciation>? _pronunciations;
  @override
  @JsonKey(name: 'pronunciations')
  List<Pronunciation>? get pronunciations {
    final value = _pronunciations;
    if (value == null) return null;
    if (_pronunciations is EqualUnmodifiableListView) return _pronunciations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Meaning>? _meanings;
  @override
  @JsonKey(name: 'meanings')
  List<Meaning>? get meanings {
    final value = _meanings;
    if (value == null) return null;
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SmartWord(word: $word, pronunciations: $pronunciations, meanings: $meanings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartWordImpl &&
            (identical(other.word, word) || other.word == word) &&
            const DeepCollectionEquality()
                .equals(other._pronunciations, _pronunciations) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      word,
      const DeepCollectionEquality().hash(_pronunciations),
      const DeepCollectionEquality().hash(_meanings));

  /// Create a copy of SmartWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartWordImplCopyWith<_$SmartWordImpl> get copyWith =>
      __$$SmartWordImplCopyWithImpl<_$SmartWordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmartWordImplToJson(
      this,
    );
  }
}

abstract class _SmartWord implements SmartWord {
  const factory _SmartWord(
          {@JsonKey(name: 'word') final String? word,
          @JsonKey(name: 'pronunciations')
          final List<Pronunciation>? pronunciations,
          @JsonKey(name: 'meanings') final List<Meaning>? meanings}) =
      _$SmartWordImpl;

  factory _SmartWord.fromJson(Map<String, dynamic> json) =
      _$SmartWordImpl.fromJson;

  @override
  @JsonKey(name: 'word')
  String? get word;
  @override
  @JsonKey(name: 'pronunciations')
  List<Pronunciation>? get pronunciations;
  @override
  @JsonKey(name: 'meanings')
  List<Meaning>? get meanings;

  /// Create a copy of SmartWord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmartWordImplCopyWith<_$SmartWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meaning _$MeaningFromJson(Map<String, dynamic> json) {
  return _Meaning.fromJson(json);
}

/// @nodoc
mixin _$Meaning {
  @JsonKey(name: 'partOfSpeech')
  String? get partOfSpeech => throw _privateConstructorUsedError;
  @JsonKey(name: 'vietnamese')
  String? get vietnamese => throw _privateConstructorUsedError;
  @JsonKey(name: 'definition')
  String? get definition => throw _privateConstructorUsedError;
  @JsonKey(name: 'examples')
  List<Example>? get examples => throw _privateConstructorUsedError;

  /// Serializes this Meaning to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meaning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeaningCopyWith<Meaning> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeaningCopyWith<$Res> {
  factory $MeaningCopyWith(Meaning value, $Res Function(Meaning) then) =
      _$MeaningCopyWithImpl<$Res, Meaning>;
  @useResult
  $Res call(
      {@JsonKey(name: 'partOfSpeech') String? partOfSpeech,
      @JsonKey(name: 'vietnamese') String? vietnamese,
      @JsonKey(name: 'definition') String? definition,
      @JsonKey(name: 'examples') List<Example>? examples});
}

/// @nodoc
class _$MeaningCopyWithImpl<$Res, $Val extends Meaning>
    implements $MeaningCopyWith<$Res> {
  _$MeaningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meaning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partOfSpeech = freezed,
    Object? vietnamese = freezed,
    Object? definition = freezed,
    Object? examples = freezed,
  }) {
    return _then(_value.copyWith(
      partOfSpeech: freezed == partOfSpeech
          ? _value.partOfSpeech
          : partOfSpeech // ignore: cast_nullable_to_non_nullable
              as String?,
      vietnamese: freezed == vietnamese
          ? _value.vietnamese
          : vietnamese // ignore: cast_nullable_to_non_nullable
              as String?,
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      examples: freezed == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<Example>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeaningImplCopyWith<$Res> implements $MeaningCopyWith<$Res> {
  factory _$$MeaningImplCopyWith(
          _$MeaningImpl value, $Res Function(_$MeaningImpl) then) =
      __$$MeaningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'partOfSpeech') String? partOfSpeech,
      @JsonKey(name: 'vietnamese') String? vietnamese,
      @JsonKey(name: 'definition') String? definition,
      @JsonKey(name: 'examples') List<Example>? examples});
}

/// @nodoc
class __$$MeaningImplCopyWithImpl<$Res>
    extends _$MeaningCopyWithImpl<$Res, _$MeaningImpl>
    implements _$$MeaningImplCopyWith<$Res> {
  __$$MeaningImplCopyWithImpl(
      _$MeaningImpl _value, $Res Function(_$MeaningImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meaning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partOfSpeech = freezed,
    Object? vietnamese = freezed,
    Object? definition = freezed,
    Object? examples = freezed,
  }) {
    return _then(_$MeaningImpl(
      partOfSpeech: freezed == partOfSpeech
          ? _value.partOfSpeech
          : partOfSpeech // ignore: cast_nullable_to_non_nullable
              as String?,
      vietnamese: freezed == vietnamese
          ? _value.vietnamese
          : vietnamese // ignore: cast_nullable_to_non_nullable
              as String?,
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      examples: freezed == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<Example>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeaningImpl implements _Meaning {
  const _$MeaningImpl(
      {@JsonKey(name: 'partOfSpeech') this.partOfSpeech,
      @JsonKey(name: 'vietnamese') this.vietnamese,
      @JsonKey(name: 'definition') this.definition,
      @JsonKey(name: 'examples') final List<Example>? examples})
      : _examples = examples;

  factory _$MeaningImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeaningImplFromJson(json);

  @override
  @JsonKey(name: 'partOfSpeech')
  final String? partOfSpeech;
  @override
  @JsonKey(name: 'vietnamese')
  final String? vietnamese;
  @override
  @JsonKey(name: 'definition')
  final String? definition;
  final List<Example>? _examples;
  @override
  @JsonKey(name: 'examples')
  List<Example>? get examples {
    final value = _examples;
    if (value == null) return null;
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Meaning(partOfSpeech: $partOfSpeech, vietnamese: $vietnamese, definition: $definition, examples: $examples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeaningImpl &&
            (identical(other.partOfSpeech, partOfSpeech) ||
                other.partOfSpeech == partOfSpeech) &&
            (identical(other.vietnamese, vietnamese) ||
                other.vietnamese == vietnamese) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partOfSpeech, vietnamese,
      definition, const DeepCollectionEquality().hash(_examples));

  /// Create a copy of Meaning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeaningImplCopyWith<_$MeaningImpl> get copyWith =>
      __$$MeaningImplCopyWithImpl<_$MeaningImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeaningImplToJson(
      this,
    );
  }
}

abstract class _Meaning implements Meaning {
  const factory _Meaning(
          {@JsonKey(name: 'partOfSpeech') final String? partOfSpeech,
          @JsonKey(name: 'vietnamese') final String? vietnamese,
          @JsonKey(name: 'definition') final String? definition,
          @JsonKey(name: 'examples') final List<Example>? examples}) =
      _$MeaningImpl;

  factory _Meaning.fromJson(Map<String, dynamic> json) = _$MeaningImpl.fromJson;

  @override
  @JsonKey(name: 'partOfSpeech')
  String? get partOfSpeech;
  @override
  @JsonKey(name: 'vietnamese')
  String? get vietnamese;
  @override
  @JsonKey(name: 'definition')
  String? get definition;
  @override
  @JsonKey(name: 'examples')
  List<Example>? get examples;

  /// Create a copy of Meaning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeaningImplCopyWith<_$MeaningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return _Example.fromJson(json);
}

/// @nodoc
mixin _$Example {
  @JsonKey(name: 'english')
  String? get english => throw _privateConstructorUsedError;
  @JsonKey(name: 'vietnamese')
  String? get vietnamese => throw _privateConstructorUsedError;

  /// Serializes this Example to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExampleCopyWith<Example> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleCopyWith<$Res> {
  factory $ExampleCopyWith(Example value, $Res Function(Example) then) =
      _$ExampleCopyWithImpl<$Res, Example>;
  @useResult
  $Res call(
      {@JsonKey(name: 'english') String? english,
      @JsonKey(name: 'vietnamese') String? vietnamese});
}

/// @nodoc
class _$ExampleCopyWithImpl<$Res, $Val extends Example>
    implements $ExampleCopyWith<$Res> {
  _$ExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? english = freezed,
    Object? vietnamese = freezed,
  }) {
    return _then(_value.copyWith(
      english: freezed == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
      vietnamese: freezed == vietnamese
          ? _value.vietnamese
          : vietnamese // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExampleImplCopyWith<$Res> implements $ExampleCopyWith<$Res> {
  factory _$$ExampleImplCopyWith(
          _$ExampleImpl value, $Res Function(_$ExampleImpl) then) =
      __$$ExampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'english') String? english,
      @JsonKey(name: 'vietnamese') String? vietnamese});
}

/// @nodoc
class __$$ExampleImplCopyWithImpl<$Res>
    extends _$ExampleCopyWithImpl<$Res, _$ExampleImpl>
    implements _$$ExampleImplCopyWith<$Res> {
  __$$ExampleImplCopyWithImpl(
      _$ExampleImpl _value, $Res Function(_$ExampleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? english = freezed,
    Object? vietnamese = freezed,
  }) {
    return _then(_$ExampleImpl(
      english: freezed == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String?,
      vietnamese: freezed == vietnamese
          ? _value.vietnamese
          : vietnamese // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExampleImpl implements _Example {
  const _$ExampleImpl(
      {@JsonKey(name: 'english') this.english,
      @JsonKey(name: 'vietnamese') this.vietnamese});

  factory _$ExampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExampleImplFromJson(json);

  @override
  @JsonKey(name: 'english')
  final String? english;
  @override
  @JsonKey(name: 'vietnamese')
  final String? vietnamese;

  @override
  String toString() {
    return 'Example(english: $english, vietnamese: $vietnamese)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExampleImpl &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.vietnamese, vietnamese) ||
                other.vietnamese == vietnamese));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, english, vietnamese);

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExampleImplCopyWith<_$ExampleImpl> get copyWith =>
      __$$ExampleImplCopyWithImpl<_$ExampleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExampleImplToJson(
      this,
    );
  }
}

abstract class _Example implements Example {
  const factory _Example(
      {@JsonKey(name: 'english') final String? english,
      @JsonKey(name: 'vietnamese') final String? vietnamese}) = _$ExampleImpl;

  factory _Example.fromJson(Map<String, dynamic> json) = _$ExampleImpl.fromJson;

  @override
  @JsonKey(name: 'english')
  String? get english;
  @override
  @JsonKey(name: 'vietnamese')
  String? get vietnamese;

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExampleImplCopyWith<_$ExampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pronunciation _$PronunciationFromJson(Map<String, dynamic> json) {
  return _Pronunciation.fromJson(json);
}

/// @nodoc
mixin _$Pronunciation {
  @JsonKey(name: 'ipa')
  String? get ipa => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio')
  String? get audio => throw _privateConstructorUsedError;

  /// Serializes this Pronunciation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PronunciationCopyWith<Pronunciation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PronunciationCopyWith<$Res> {
  factory $PronunciationCopyWith(
          Pronunciation value, $Res Function(Pronunciation) then) =
      _$PronunciationCopyWithImpl<$Res, Pronunciation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ipa') String? ipa,
      @JsonKey(name: 'audio') String? audio});
}

/// @nodoc
class _$PronunciationCopyWithImpl<$Res, $Val extends Pronunciation>
    implements $PronunciationCopyWith<$Res> {
  _$PronunciationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipa = freezed,
    Object? audio = freezed,
  }) {
    return _then(_value.copyWith(
      ipa: freezed == ipa
          ? _value.ipa
          : ipa // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PronunciationImplCopyWith<$Res>
    implements $PronunciationCopyWith<$Res> {
  factory _$$PronunciationImplCopyWith(
          _$PronunciationImpl value, $Res Function(_$PronunciationImpl) then) =
      __$$PronunciationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ipa') String? ipa,
      @JsonKey(name: 'audio') String? audio});
}

/// @nodoc
class __$$PronunciationImplCopyWithImpl<$Res>
    extends _$PronunciationCopyWithImpl<$Res, _$PronunciationImpl>
    implements _$$PronunciationImplCopyWith<$Res> {
  __$$PronunciationImplCopyWithImpl(
      _$PronunciationImpl _value, $Res Function(_$PronunciationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipa = freezed,
    Object? audio = freezed,
  }) {
    return _then(_$PronunciationImpl(
      ipa: freezed == ipa
          ? _value.ipa
          : ipa // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PronunciationImpl implements _Pronunciation {
  const _$PronunciationImpl(
      {@JsonKey(name: 'ipa') this.ipa, @JsonKey(name: 'audio') this.audio});

  factory _$PronunciationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PronunciationImplFromJson(json);

  @override
  @JsonKey(name: 'ipa')
  final String? ipa;
  @override
  @JsonKey(name: 'audio')
  final String? audio;

  @override
  String toString() {
    return 'Pronunciation(ipa: $ipa, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PronunciationImpl &&
            (identical(other.ipa, ipa) || other.ipa == ipa) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ipa, audio);

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PronunciationImplCopyWith<_$PronunciationImpl> get copyWith =>
      __$$PronunciationImplCopyWithImpl<_$PronunciationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PronunciationImplToJson(
      this,
    );
  }
}

abstract class _Pronunciation implements Pronunciation {
  const factory _Pronunciation(
      {@JsonKey(name: 'ipa') final String? ipa,
      @JsonKey(name: 'audio') final String? audio}) = _$PronunciationImpl;

  factory _Pronunciation.fromJson(Map<String, dynamic> json) =
      _$PronunciationImpl.fromJson;

  @override
  @JsonKey(name: 'ipa')
  String? get ipa;
  @override
  @JsonKey(name: 'audio')
  String? get audio;

  /// Create a copy of Pronunciation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PronunciationImplCopyWith<_$PronunciationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
