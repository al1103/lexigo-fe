import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/injection/di.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';
import 'package:lexigo/screen/level_selection/model/level_lesson_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'level_lesson_repository_impl.g.dart';

class LevelLessonRepositoryImpl implements LevelLessonRepository {
  const LevelLessonRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResponse<List<LessonsModel>>> getListLessons() async {
    return _apiService.getListLessons();
  }
}

@riverpod
LevelLessonRepositoryImpl levelLessonRepositoryImpl(
  LevelLessonRepositoryImplRef ref, // Fix: Đổi tham số thành Ref
) {
  return LevelLessonRepositoryImpl(ref.watch(apiServiceProvider));
}
