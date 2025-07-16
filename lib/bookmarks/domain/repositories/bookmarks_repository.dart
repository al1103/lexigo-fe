import 'package:lexigo/bookmarks/domain/entities/bookmark.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';

abstract class BookmarksRepository {
  Future<ApiResponse<PayloadPageableDto<QuizBookmark>>> getBookmarks({
    int page = 1,
    int limit = 10,
    String? type,
    String? search,
  });

  Future<void> deleteBookmark(String id);
}
