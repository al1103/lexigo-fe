import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/screen/level_selection/data/level_lesson_repository_impl.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';

class LevelLessonController
    extends StateNotifier<AsyncValue<ApiResponse<List<LessonsModel>>?>> {
  LevelLessonController(this._repository) : super(const AsyncValue.loading()) {
    loadLessons();
  }

  final LevelLessonRepositoryImpl _repository;

  Future<void> loadLessons() async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.getListLessons();
      state = AsyncValue.data(response);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadLessons();
  }
}

// Provider
final levelLessonControllerProvider = StateNotifierProvider<
    LevelLessonController, AsyncValue<ApiResponse<List<LessonsModel>>?>>((ref) {
  final repository = ref.read(levelLessonRepositoryImplProvider);
  return LevelLessonController(repository);
});
