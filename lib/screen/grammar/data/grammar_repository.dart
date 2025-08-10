import 'package:lexigo/screen/grammar/model/grammar_model.dart';

abstract class GrammarRepository {
  Future<GrammarResponse> getAllArticles({
    int page = 1,
    int limit = 10,
    String? difficulty,
    String? category,
    String? search,
  });
  Future<List<GrammarCategory>> getCategories();
  Future<List<GrammarModel>> getPopularArticles({int limit = 5});
  Future<GrammarModel> getArticleById(int id);
  Future<GrammarModel> getArticleDetails(int id);
  Future<GrammarResponse> searchArticles({
    required String keyword,
    int page = 1,
    int limit = 10,
  });
  Future<GrammarResponse> getArticlesByCategory({
    required String category,
    int page = 1,
    int limit = 10,
  });
  Future<GrammarResponse> getArticlesByDifficulty({
    required String difficulty,
    int page = 1,
    int limit = 10,
  });
}
