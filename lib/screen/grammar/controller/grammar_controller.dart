import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexigo/core/presentation/view_status.dart';
import 'package:lexigo/screen/grammar/data/grammar_repository_impl.dart';
import 'package:lexigo/screen/grammar/model/grammar_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grammar_controller.freezed.dart';
part 'grammar_controller.g.dart';

@freezed
class GrammarState with _$GrammarState {
  const factory GrammarState({
    required ViewStatus status,
    @Default([]) List<GrammarModel> articles,
    @Default([]) List<GrammarCategory> categories,
    @Default([]) List<GrammarModel> popularArticles,
    GrammarModel? selectedArticle,
    String? error,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    String? searchKeyword,
    String? selectedCategory,
    String? selectedDifficulty,
    @Default(false) bool isFiltering,
  }) = _GrammarState;
}

@riverpod
class GrammarNotifier extends _$GrammarNotifier {
  @override
  GrammarState build() {
    _loadInitialData();
    return GrammarState(status: ViewLoading());
  }

  Future<void> _loadInitialData() async {
    try {
      final repository = ref.read(grammarRepositoryProvider);

      // Load categories and popular articles
      final categoriesFuture = repository.getCategories();
      final popularArticlesFuture = repository.getPopularArticles();
      final articlesFuture = repository.getAllArticles();

      final results = await Future.wait([
        categoriesFuture,
        popularArticlesFuture,
        articlesFuture,
      ]);

      final categories = results[0] as List<GrammarCategory>;
      final popularArticles = results[1] as List<GrammarModel>;
      final articlesResponse = results[2] as GrammarResponse;

      state = state.copyWith(
        status: ViewSuccess(null),
        categories: categories,
        popularArticles: popularArticles,
        articles: articlesResponse.items,
        hasMore: articlesResponse.items.length >= articlesResponse.limit,
        currentPage: 1,
      );
    } catch (e) {
      state = state.copyWith(
        status: ViewError(500, e.toString()),
        error: e.toString(),
      );
    }
  }

  Future<void> loadMoreArticles() async {
    if (!state.hasMore || state.status is ViewLoading) return;

    try {
      final repository = ref.read(grammarRepositoryProvider);
      final nextPage = state.currentPage + 1;

      final response = await repository.getAllArticles(
        page: nextPage,
        search: state.searchKeyword,
        category: state.selectedCategory,
        difficulty: state.selectedDifficulty,
      );

      state = state.copyWith(
        status: ViewSuccess(null),
        articles: [...state.articles, ...response.items],
        hasMore: response.items.length >= response.limit,
        currentPage: nextPage,
      );
    } catch (e) {
      state = state.copyWith(
        status: ViewError(500, e.toString()),
        error: e.toString(),
      );
    }
  }

  Future<void> searchArticles(String keyword) async {
    try {
      state = state.copyWith(
        status: ViewLoading(),
        searchKeyword: keyword.isEmpty ? null : keyword,
        isFiltering: true,
      );

      final repository = ref.read(grammarRepositoryProvider);
      final response = await repository.getAllArticles(
        search: keyword.isEmpty ? null : keyword,
        category: state.selectedCategory,
        difficulty: state.selectedDifficulty,
      );

      state = state.copyWith(
        status: ViewSuccess(null),
        articles: response.items,
        hasMore: response.items.length >= response.limit,
        currentPage: 1,
        isFiltering: keyword.isNotEmpty ||
            state.selectedCategory != null ||
            state.selectedDifficulty != null,
      );
    } catch (e) {
      state = state.copyWith(
        status: ViewError(500, e.toString()),
        error: e.toString(),
      );
    }
  }

  Future<void> filterByCategory(String? category) async {
    try {
      state = state.copyWith(
        status: ViewLoading(),
        selectedCategory: category,
        isFiltering: true,
      );

      final repository = ref.read(grammarRepositoryProvider);
      final response = await repository.getAllArticles(
        search: state.searchKeyword,
        category: category,
        difficulty: state.selectedDifficulty,
      );

      state = state.copyWith(
        status: ViewSuccess(null),
        articles: response.items,
        hasMore: response.items.length >= response.limit,
        currentPage: 1,
        isFiltering: state.searchKeyword != null ||
            category != null ||
            state.selectedDifficulty != null,
      );
    } catch (e) {
      state = state.copyWith(
        status: ViewError(500, e.toString()),
        error: e.toString(),
      );
    }
  }

  Future<void> filterByDifficulty(String? difficulty) async {
    try {
      state = state.copyWith(
        status: ViewLoading(),
        selectedDifficulty: difficulty,
        isFiltering: true,
      );

      final repository = ref.read(grammarRepositoryProvider);
      final response = await repository.getAllArticles(
        search: state.searchKeyword,
        category: state.selectedCategory,
        difficulty: difficulty,
      );

      state = state.copyWith(
        status: ViewSuccess(null),
        articles: response.items,
        hasMore: response.items.length >= response.limit,
        currentPage: 1,
        isFiltering: state.searchKeyword != null ||
            state.selectedCategory != null ||
            difficulty != null,
      );
    } catch (e) {
      state = state.copyWith(
        status: ViewError(500, e.toString()),
        error: e.toString(),
      );
    }
  }

  Future<void> resetFilters() async {
    try {
      state = state.copyWith(
        status: ViewLoading(),
        searchKeyword: null,
        selectedCategory: null,
        selectedDifficulty: null,
        isFiltering: false,
      );

      final repository = ref.read(grammarRepositoryProvider);
      final response = await repository.getAllArticles();

      state = state.copyWith(
        status: ViewSuccess(null),
        articles: response.items,
        hasMore: response.items.length >= response.limit,
        currentPage: 1,
      );
    } catch (e) {
      state = state.copyWith(
        status: ViewError(500, e.toString()),
        error: e.toString(),
      );
    }
  }

  Future<void> getArticleDetails(int id) async {
    try {
      state = state.copyWith(status: ViewLoading());

      final repository = ref.read(grammarRepositoryProvider);
      final article = await repository.getArticleById(id);

      state = state.copyWith(
        status: ViewSuccess(null),
        selectedArticle: article,
      );
    } catch (e) {
      state = state.copyWith(
        status: ViewError(500, e.toString()),
        error: e.toString(),
      );
    }
  }
}
