import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/bookmarks/domain/entities/bookmark.dart';
import 'package:lexigo/bookmarks/domain/repositories/bookmarks_repository.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarks_repository_impl.g.dart';

class BookmarksRepositoryImpl implements BookmarksRepository {
  BookmarksRepositoryImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<void> deleteBookmark(String id) async {
    await apiService.deleteBookmark(int.parse(id));
  }

  @override
  Future<ApiResponse<PayloadPageableDto<QuizBookmark>>> getBookmarks({
    int page = 1,
    int limit = 10,
    String? type,
    String? search,
  }) async {
    final result = await apiService.getBookmarks(
      page: page,
      limit: limit,
      search: search,
    );
    return result;
  }
}

@Riverpod(keepAlive: true)
BookmarksRepository bookmarksRepository(Ref ref) =>
    BookmarksRepositoryImpl(ref.read(apiServiceProvider));
