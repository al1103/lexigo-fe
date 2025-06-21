import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkController
    extends StateNotifier<AsyncValue<List<BookmarkedQuestion>>> {
  BookmarkController() : super(const AsyncValue.loading()) {
    _loadBookmarks();
  }

  final List<BookmarkedQuestion> _bookmarks = [];

  Future<void> _loadBookmarks() async {
    try {
      // Load from local storage or API
      // For now, using mock data
      await Future.delayed(const Duration(milliseconds: 500));

      state = AsyncValue.data(_bookmarks);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void addBookmark(BookmarkedQuestion bookmark) {
    _bookmarks.add(bookmark);
    state = AsyncValue.data(List.from(_bookmarks));
  }

  void removeBookmark(String id) {
    _bookmarks.removeWhere((bookmark) => bookmark.id == id);
    state = AsyncValue.data(List.from(_bookmarks));
  }

  void updateNote(String id, String note) {
    final index = _bookmarks.indexWhere((bookmark) => bookmark.id == id);
    if (index != -1) {
      _bookmarks[index] = _bookmarks[index].copyWith(note: note);
      state = AsyncValue.data(List.from(_bookmarks));
    }
  }

  void clearAll() {
    _bookmarks.clear();
    state = const AsyncValue.data([]);
  }
}

final bookmarkControllerProvider = StateNotifierProvider<BookmarkController,
    AsyncValue<List<BookmarkedQuestion>>>(
  (ref) => BookmarkController(),
);

// Data Model
class BookmarkedQuestion {
  BookmarkedQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.userAnswerIndex,
    required this.wasCorrect,
    required this.createdAt,
    this.explanation,
    this.note,
  });
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final int userAnswerIndex;
  final bool wasCorrect;
  final String? explanation;
  final String? note;
  final DateTime createdAt;

  BookmarkedQuestion copyWith({
    String? id,
    String? question,
    List<String>? options,
    int? correctAnswerIndex,
    int? userAnswerIndex,
    bool? wasCorrect,
    String? explanation,
    String? note,
    DateTime? createdAt,
  }) {
    return BookmarkedQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
      userAnswerIndex: userAnswerIndex ?? this.userAnswerIndex,
      wasCorrect: wasCorrect ?? this.wasCorrect,
      explanation: explanation ?? this.explanation,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
