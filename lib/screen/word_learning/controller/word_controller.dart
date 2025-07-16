import 'package:lexigo/screen/word_learning/data/word_repository_impl.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_controller.g.dart';

@riverpod
class WordController extends _$WordController {
  @override
  Future<List<LessonsDetail>> build(int? id) async {
    try {
      final response =
          await ref.read(wordRepositoryImplProvider).getLessonDetails(id!);
      return response.data?.contents ?? [];
    } catch (e) {
      return [];
    }
  }

  Future<void> submitAnswer({
    required int sessionId,
    required int questionId,
    required int selectedOptionId,
  }) async {
    await ref.read(wordRepositoryImplProvider).submitAnswer(
          sessionId: sessionId,
          questionId: questionId,
          selectedOptionId: selectedOptionId,
        );
  }

  Future<void> bookmarkWord({
    required int wordId,
    String? notes,
  }) async {
    await ref.read(wordRepositoryImplProvider).bookmarkWord(
          wordId: wordId,
          notes: notes,
        );
  }
}
