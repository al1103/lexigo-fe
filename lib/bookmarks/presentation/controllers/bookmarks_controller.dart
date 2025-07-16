import 'package:lexigo/bookmarks/data/repositories/bookmarks_repository_impl.dart';
import 'package:lexigo/bookmarks/domain/entities/bookmark.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarks_controller.g.dart';

@riverpod
class BookmarksController extends _$BookmarksController {
  @override
  FutureOr<List<QuizBookmark>> build() {
    return getBookmarks();
  }

  Future<List<QuizBookmark>> getBookmarks({
    int page = 1,
    int limit = 10,
    String? type,
    String? search,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final response =
            await ref.read(bookmarksRepositoryProvider).getBookmarks(
                  page: page,
                  limit: limit,
                  type: type,
                  search: search,
                );
        return response.data?.contents ?? [];
      },
    );
    return state.value ?? [];
  }

  Future<void> removeBookmark(int bookmarkId) async {
    try {
      await ref
          .read(bookmarksRepositoryProvider)
          .deleteBookmark(bookmarkId.toString());

      ref.invalidateSelf();
    } catch (e) {
      rethrow;
    }
  }
}
