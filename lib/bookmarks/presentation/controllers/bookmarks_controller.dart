import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/bookmarks/domain/entities/bookmark.dart';

class BookmarksController extends StateNotifier<AsyncValue<List<Bookmark>>> {
  BookmarksController() : super(const AsyncValue.loading()) {
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    try {
      state = const AsyncValue.loading();

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Mock data
      final bookmarks = [
        Bookmark(
          id: '1',
          word: 'Serendipity',
          pronunciation: 'ser-ən-ˈdi-pə-tē',
          definition:
              'The occurrence and development of events by chance in a happy or beneficial way.',
          example:
              'A fortunate stroke of serendipity brought the two old friends together.',
          wordType: 'noun',
          difficultyLevel: 'medium',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          userId: 'user123',
        ),
        Bookmark(
          id: '2',
          word: 'Ephemeral',
          pronunciation: 'ə-ˈfe-mə-rəl',
          definition: 'Lasting for a very short time.',
          example: 'The beauty of cherry blossoms is ephemeral.',
          wordType: 'adjective',
          difficultyLevel: 'hard',
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
          userId: 'user123',
        ),
        Bookmark(
          id: '3',
          word: 'Ubiquitous',
          pronunciation: 'yo͞o-ˈbi-kwə-təs',
          definition: 'Present, appearing, or found everywhere.',
          example: 'Smartphones have become ubiquitous in modern society.',
          wordType: 'adjective',
          difficultyLevel: 'medium',
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
          userId: 'user123',
        ),
      ];

      state = AsyncValue.data(bookmarks);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> removeBookmark(String bookmarkId) async {
    final currentBookmarks = state.value ?? [];
    final updatedBookmarks =
        currentBookmarks.where((b) => b.id != bookmarkId).toList();
    state = AsyncValue.data(updatedBookmarks);
  }

  Future<void> addBookmark(Bookmark bookmark) async {
    final currentBookmarks = state.value ?? [];
    final updatedBookmarks = [...currentBookmarks, bookmark];
    state = AsyncValue.data(updatedBookmarks);
  }
}

final bookmarksControllerProvider =
    StateNotifierProvider<BookmarksController, AsyncValue<List<Bookmark>>>(
  (ref) => BookmarksController(),
);
