// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grammar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GrammarModel _$GrammarModelFromJson(Map<String, dynamic> json) {
  return _GrammarModel.fromJson(json);
}

/// @nodoc
mixin _$GrammarModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_level')
  String get difficultyLevel => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'reading_time')
  int? get readingTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_published')
  bool get isPublished => throw _privateConstructorUsedError;

  /// Serializes this GrammarModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GrammarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrammarModelCopyWith<GrammarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarModelCopyWith<$Res> {
  factory $GrammarModelCopyWith(
          GrammarModel value, $Res Function(GrammarModel) then) =
      _$GrammarModelCopyWithImpl<$Res, GrammarModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      @JsonKey(name: 'difficulty_level') String difficultyLevel,
      String? category,
      List<String>? tags,
      @JsonKey(name: 'reading_time') int? readingTime,
      @JsonKey(name: 'is_published') bool isPublished});
}

/// @nodoc
class _$GrammarModelCopyWithImpl<$Res, $Val extends GrammarModel>
    implements $GrammarModelCopyWith<$Res> {
  _$GrammarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrammarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? difficultyLevel = null,
    Object? category = freezed,
    Object? tags = freezed,
    Object? readingTime = freezed,
    Object? isPublished = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      difficultyLevel: null == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      readingTime: freezed == readingTime
          ? _value.readingTime
          : readingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrammarModelImplCopyWith<$Res>
    implements $GrammarModelCopyWith<$Res> {
  factory _$$GrammarModelImplCopyWith(
          _$GrammarModelImpl value, $Res Function(_$GrammarModelImpl) then) =
      __$$GrammarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      @JsonKey(name: 'difficulty_level') String difficultyLevel,
      String? category,
      List<String>? tags,
      @JsonKey(name: 'reading_time') int? readingTime,
      @JsonKey(name: 'is_published') bool isPublished});
}

/// @nodoc
class __$$GrammarModelImplCopyWithImpl<$Res>
    extends _$GrammarModelCopyWithImpl<$Res, _$GrammarModelImpl>
    implements _$$GrammarModelImplCopyWith<$Res> {
  __$$GrammarModelImplCopyWithImpl(
      _$GrammarModelImpl _value, $Res Function(_$GrammarModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrammarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? difficultyLevel = null,
    Object? category = freezed,
    Object? tags = freezed,
    Object? readingTime = freezed,
    Object? isPublished = null,
  }) {
    return _then(_$GrammarModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      difficultyLevel: null == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      readingTime: freezed == readingTime
          ? _value.readingTime
          : readingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrammarModelImpl implements _GrammarModel {
  const _$GrammarModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      @JsonKey(name: 'difficulty_level') required this.difficultyLevel,
      this.category,
      final List<String>? tags,
      @JsonKey(name: 'reading_time') this.readingTime,
      @JsonKey(name: 'is_published') this.isPublished = true})
      : _tags = tags;

  factory _$GrammarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrammarModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  @JsonKey(name: 'difficulty_level')
  final String difficultyLevel;
  @override
  final String? category;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'reading_time')
  final int? readingTime;
  @override
  @JsonKey(name: 'is_published')
  final bool isPublished;

  @override
  String toString() {
    return 'GrammarModel(id: $id, title: $title, content: $content, difficultyLevel: $difficultyLevel, category: $category, tags: $tags, readingTime: $readingTime, isPublished: $isPublished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrammarModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.readingTime, readingTime) ||
                other.readingTime == readingTime) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      difficultyLevel,
      category,
      const DeepCollectionEquality().hash(_tags),
      readingTime,
      isPublished);

  /// Create a copy of GrammarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrammarModelImplCopyWith<_$GrammarModelImpl> get copyWith =>
      __$$GrammarModelImplCopyWithImpl<_$GrammarModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrammarModelImplToJson(
      this,
    );
  }
}

abstract class _GrammarModel implements GrammarModel {
  const factory _GrammarModel(
      {required final int id,
      required final String title,
      required final String content,
      @JsonKey(name: 'difficulty_level') required final String difficultyLevel,
      final String? category,
      final List<String>? tags,
      @JsonKey(name: 'reading_time') final int? readingTime,
      @JsonKey(name: 'is_published')
      final bool isPublished}) = _$GrammarModelImpl;

  factory _GrammarModel.fromJson(Map<String, dynamic> json) =
      _$GrammarModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(name: 'difficulty_level')
  String get difficultyLevel;
  @override
  String? get category;
  @override
  List<String>? get tags;
  @override
  @JsonKey(name: 'reading_time')
  int? get readingTime;
  @override
  @JsonKey(name: 'is_published')
  bool get isPublished;

  /// Create a copy of GrammarModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrammarModelImplCopyWith<_$GrammarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GrammarCategory _$GrammarCategoryFromJson(Map<String, dynamic> json) {
  return _GrammarCategory.fromJson(json);
}

/// @nodoc
mixin _$GrammarCategory {
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this GrammarCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GrammarCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrammarCategoryCopyWith<GrammarCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarCategoryCopyWith<$Res> {
  factory $GrammarCategoryCopyWith(
          GrammarCategory value, $Res Function(GrammarCategory) then) =
      _$GrammarCategoryCopyWithImpl<$Res, GrammarCategory>;
  @useResult
  $Res call({String name, int count});
}

/// @nodoc
class _$GrammarCategoryCopyWithImpl<$Res, $Val extends GrammarCategory>
    implements $GrammarCategoryCopyWith<$Res> {
  _$GrammarCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrammarCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrammarCategoryImplCopyWith<$Res>
    implements $GrammarCategoryCopyWith<$Res> {
  factory _$$GrammarCategoryImplCopyWith(_$GrammarCategoryImpl value,
          $Res Function(_$GrammarCategoryImpl) then) =
      __$$GrammarCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int count});
}

/// @nodoc
class __$$GrammarCategoryImplCopyWithImpl<$Res>
    extends _$GrammarCategoryCopyWithImpl<$Res, _$GrammarCategoryImpl>
    implements _$$GrammarCategoryImplCopyWith<$Res> {
  __$$GrammarCategoryImplCopyWithImpl(
      _$GrammarCategoryImpl _value, $Res Function(_$GrammarCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrammarCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_$GrammarCategoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrammarCategoryImpl implements _GrammarCategory {
  const _$GrammarCategoryImpl({required this.name, required this.count});

  factory _$GrammarCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrammarCategoryImplFromJson(json);

  @override
  final String name;
  @override
  final int count;

  @override
  String toString() {
    return 'GrammarCategory(name: $name, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrammarCategoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, count);

  /// Create a copy of GrammarCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrammarCategoryImplCopyWith<_$GrammarCategoryImpl> get copyWith =>
      __$$GrammarCategoryImplCopyWithImpl<_$GrammarCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrammarCategoryImplToJson(
      this,
    );
  }
}

abstract class _GrammarCategory implements GrammarCategory {
  const factory _GrammarCategory(
      {required final String name,
      required final int count}) = _$GrammarCategoryImpl;

  factory _GrammarCategory.fromJson(Map<String, dynamic> json) =
      _$GrammarCategoryImpl.fromJson;

  @override
  String get name;
  @override
  int get count;

  /// Create a copy of GrammarCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrammarCategoryImplCopyWith<_$GrammarCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GrammarResponse _$GrammarResponseFromJson(Map<String, dynamic> json) {
  return _GrammarResponse.fromJson(json);
}

/// @nodoc
mixin _$GrammarResponse {
  @JsonKey(name: 'articles')
  List<GrammarModel> get items => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this GrammarResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GrammarResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrammarResponseCopyWith<GrammarResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarResponseCopyWith<$Res> {
  factory $GrammarResponseCopyWith(
          GrammarResponse value, $Res Function(GrammarResponse) then) =
      _$GrammarResponseCopyWithImpl<$Res, GrammarResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'articles') List<GrammarModel> items,
      int total,
      int page,
      int limit});
}

/// @nodoc
class _$GrammarResponseCopyWithImpl<$Res, $Val extends GrammarResponse>
    implements $GrammarResponseCopyWith<$Res> {
  _$GrammarResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrammarResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GrammarModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrammarResponseImplCopyWith<$Res>
    implements $GrammarResponseCopyWith<$Res> {
  factory _$$GrammarResponseImplCopyWith(_$GrammarResponseImpl value,
          $Res Function(_$GrammarResponseImpl) then) =
      __$$GrammarResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'articles') List<GrammarModel> items,
      int total,
      int page,
      int limit});
}

/// @nodoc
class __$$GrammarResponseImplCopyWithImpl<$Res>
    extends _$GrammarResponseCopyWithImpl<$Res, _$GrammarResponseImpl>
    implements _$$GrammarResponseImplCopyWith<$Res> {
  __$$GrammarResponseImplCopyWithImpl(
      _$GrammarResponseImpl _value, $Res Function(_$GrammarResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrammarResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GrammarResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GrammarModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrammarResponseImpl implements _GrammarResponse {
  const _$GrammarResponseImpl(
      {@JsonKey(name: 'articles') required final List<GrammarModel> items,
      this.total = 0,
      this.page = 1,
      this.limit = 10})
      : _items = items;

  factory _$GrammarResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrammarResponseImplFromJson(json);

  final List<GrammarModel> _items;
  @override
  @JsonKey(name: 'articles')
  List<GrammarModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'GrammarResponse(items: $items, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrammarResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), total, page, limit);

  /// Create a copy of GrammarResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrammarResponseImplCopyWith<_$GrammarResponseImpl> get copyWith =>
      __$$GrammarResponseImplCopyWithImpl<_$GrammarResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrammarResponseImplToJson(
      this,
    );
  }
}

abstract class _GrammarResponse implements GrammarResponse {
  const factory _GrammarResponse(
      {@JsonKey(name: 'articles') required final List<GrammarModel> items,
      final int total,
      final int page,
      final int limit}) = _$GrammarResponseImpl;

  factory _GrammarResponse.fromJson(Map<String, dynamic> json) =
      _$GrammarResponseImpl.fromJson;

  @override
  @JsonKey(name: 'articles')
  List<GrammarModel> get items;
  @override
  int get total;
  @override
  int get page;
  @override
  int get limit;

  /// Create a copy of GrammarResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrammarResponseImplCopyWith<_$GrammarResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
