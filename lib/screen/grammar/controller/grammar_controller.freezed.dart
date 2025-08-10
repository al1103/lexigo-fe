// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grammar_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GrammarState {
  ViewStatus get status => throw _privateConstructorUsedError;
  List<GrammarModel> get articles => throw _privateConstructorUsedError;
  List<GrammarCategory> get categories => throw _privateConstructorUsedError;
  List<GrammarModel> get popularArticles => throw _privateConstructorUsedError;
  GrammarModel? get selectedArticle => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String? get searchKeyword => throw _privateConstructorUsedError;
  String? get selectedCategory => throw _privateConstructorUsedError;
  String? get selectedDifficulty => throw _privateConstructorUsedError;
  bool get isFiltering => throw _privateConstructorUsedError;

  /// Create a copy of GrammarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrammarStateCopyWith<GrammarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarStateCopyWith<$Res> {
  factory $GrammarStateCopyWith(
          GrammarState value, $Res Function(GrammarState) then) =
      _$GrammarStateCopyWithImpl<$Res, GrammarState>;
  @useResult
  $Res call(
      {ViewStatus status,
      List<GrammarModel> articles,
      List<GrammarCategory> categories,
      List<GrammarModel> popularArticles,
      GrammarModel? selectedArticle,
      String? error,
      int currentPage,
      bool hasMore,
      String? searchKeyword,
      String? selectedCategory,
      String? selectedDifficulty,
      bool isFiltering});

  $GrammarModelCopyWith<$Res>? get selectedArticle;
}

/// @nodoc
class _$GrammarStateCopyWithImpl<$Res, $Val extends GrammarState>
    implements $GrammarStateCopyWith<$Res> {
  _$GrammarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrammarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? articles = null,
    Object? categories = null,
    Object? popularArticles = null,
    Object? selectedArticle = freezed,
    Object? error = freezed,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? searchKeyword = freezed,
    Object? selectedCategory = freezed,
    Object? selectedDifficulty = freezed,
    Object? isFiltering = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<GrammarModel>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<GrammarCategory>,
      popularArticles: null == popularArticles
          ? _value.popularArticles
          : popularArticles // ignore: cast_nullable_to_non_nullable
              as List<GrammarModel>,
      selectedArticle: freezed == selectedArticle
          ? _value.selectedArticle
          : selectedArticle // ignore: cast_nullable_to_non_nullable
              as GrammarModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKeyword: freezed == searchKeyword
          ? _value.searchKeyword
          : searchKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDifficulty: freezed == selectedDifficulty
          ? _value.selectedDifficulty
          : selectedDifficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      isFiltering: null == isFiltering
          ? _value.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of GrammarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GrammarModelCopyWith<$Res>? get selectedArticle {
    if (_value.selectedArticle == null) {
      return null;
    }

    return $GrammarModelCopyWith<$Res>(_value.selectedArticle!, (value) {
      return _then(_value.copyWith(selectedArticle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GrammarStateImplCopyWith<$Res>
    implements $GrammarStateCopyWith<$Res> {
  factory _$$GrammarStateImplCopyWith(
          _$GrammarStateImpl value, $Res Function(_$GrammarStateImpl) then) =
      __$$GrammarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ViewStatus status,
      List<GrammarModel> articles,
      List<GrammarCategory> categories,
      List<GrammarModel> popularArticles,
      GrammarModel? selectedArticle,
      String? error,
      int currentPage,
      bool hasMore,
      String? searchKeyword,
      String? selectedCategory,
      String? selectedDifficulty,
      bool isFiltering});

  @override
  $GrammarModelCopyWith<$Res>? get selectedArticle;
}

/// @nodoc
class __$$GrammarStateImplCopyWithImpl<$Res>
    extends _$GrammarStateCopyWithImpl<$Res, _$GrammarStateImpl>
    implements _$$GrammarStateImplCopyWith<$Res> {
  __$$GrammarStateImplCopyWithImpl(
      _$GrammarStateImpl _value, $Res Function(_$GrammarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrammarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? articles = null,
    Object? categories = null,
    Object? popularArticles = null,
    Object? selectedArticle = freezed,
    Object? error = freezed,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? searchKeyword = freezed,
    Object? selectedCategory = freezed,
    Object? selectedDifficulty = freezed,
    Object? isFiltering = null,
  }) {
    return _then(_$GrammarStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<GrammarModel>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<GrammarCategory>,
      popularArticles: null == popularArticles
          ? _value._popularArticles
          : popularArticles // ignore: cast_nullable_to_non_nullable
              as List<GrammarModel>,
      selectedArticle: freezed == selectedArticle
          ? _value.selectedArticle
          : selectedArticle // ignore: cast_nullable_to_non_nullable
              as GrammarModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKeyword: freezed == searchKeyword
          ? _value.searchKeyword
          : searchKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDifficulty: freezed == selectedDifficulty
          ? _value.selectedDifficulty
          : selectedDifficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      isFiltering: null == isFiltering
          ? _value.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GrammarStateImpl implements _GrammarState {
  const _$GrammarStateImpl(
      {required this.status,
      final List<GrammarModel> articles = const [],
      final List<GrammarCategory> categories = const [],
      final List<GrammarModel> popularArticles = const [],
      this.selectedArticle,
      this.error,
      this.currentPage = 1,
      this.hasMore = false,
      this.searchKeyword,
      this.selectedCategory,
      this.selectedDifficulty,
      this.isFiltering = false})
      : _articles = articles,
        _categories = categories,
        _popularArticles = popularArticles;

  @override
  final ViewStatus status;
  final List<GrammarModel> _articles;
  @override
  @JsonKey()
  List<GrammarModel> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  final List<GrammarCategory> _categories;
  @override
  @JsonKey()
  List<GrammarCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<GrammarModel> _popularArticles;
  @override
  @JsonKey()
  List<GrammarModel> get popularArticles {
    if (_popularArticles is EqualUnmodifiableListView) return _popularArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularArticles);
  }

  @override
  final GrammarModel? selectedArticle;
  @override
  final String? error;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final String? searchKeyword;
  @override
  final String? selectedCategory;
  @override
  final String? selectedDifficulty;
  @override
  @JsonKey()
  final bool isFiltering;

  @override
  String toString() {
    return 'GrammarState(status: $status, articles: $articles, categories: $categories, popularArticles: $popularArticles, selectedArticle: $selectedArticle, error: $error, currentPage: $currentPage, hasMore: $hasMore, searchKeyword: $searchKeyword, selectedCategory: $selectedCategory, selectedDifficulty: $selectedDifficulty, isFiltering: $isFiltering)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrammarStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._popularArticles, _popularArticles) &&
            (identical(other.selectedArticle, selectedArticle) ||
                other.selectedArticle == selectedArticle) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.searchKeyword, searchKeyword) ||
                other.searchKeyword == searchKeyword) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedDifficulty, selectedDifficulty) ||
                other.selectedDifficulty == selectedDifficulty) &&
            (identical(other.isFiltering, isFiltering) ||
                other.isFiltering == isFiltering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_articles),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_popularArticles),
      selectedArticle,
      error,
      currentPage,
      hasMore,
      searchKeyword,
      selectedCategory,
      selectedDifficulty,
      isFiltering);

  /// Create a copy of GrammarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrammarStateImplCopyWith<_$GrammarStateImpl> get copyWith =>
      __$$GrammarStateImplCopyWithImpl<_$GrammarStateImpl>(this, _$identity);
}

abstract class _GrammarState implements GrammarState {
  const factory _GrammarState(
      {required final ViewStatus status,
      final List<GrammarModel> articles,
      final List<GrammarCategory> categories,
      final List<GrammarModel> popularArticles,
      final GrammarModel? selectedArticle,
      final String? error,
      final int currentPage,
      final bool hasMore,
      final String? searchKeyword,
      final String? selectedCategory,
      final String? selectedDifficulty,
      final bool isFiltering}) = _$GrammarStateImpl;

  @override
  ViewStatus get status;
  @override
  List<GrammarModel> get articles;
  @override
  List<GrammarCategory> get categories;
  @override
  List<GrammarModel> get popularArticles;
  @override
  GrammarModel? get selectedArticle;
  @override
  String? get error;
  @override
  int get currentPage;
  @override
  bool get hasMore;
  @override
  String? get searchKeyword;
  @override
  String? get selectedCategory;
  @override
  String? get selectedDifficulty;
  @override
  bool get isFiltering;

  /// Create a copy of GrammarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrammarStateImplCopyWith<_$GrammarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
