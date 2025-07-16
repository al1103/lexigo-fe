import 'package:lexigo/screen/level_selection/data/level_lesson_repository_impl.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'level_lesson_controller.g.dart';

@riverpod
class LevelLessonController extends _$LevelLessonController {
  @override
  Future<List<LessonsModel>?> build() async {
    return getLessons();
  }

  Future<List<LessonsModel>?> getLessons() async {
    try {
      final response =
          await ref.read(levelLessonRepositoryImplProvider).getListLessons();

      if (response.data != null) {
        return response.data;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
