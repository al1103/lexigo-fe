import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';

abstract class LevelLessonRepository {
  Future<ApiResponse<List<LessonsModel>>> getListLessons();
}
