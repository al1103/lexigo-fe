import 'package:lexigo/screen/word_learning/data/word_repository_impl.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_controller.g.dart';

@riverpod
class WordController extends _$WordController {
  @override
  Future<List<LessonsDetail>> build(int? id) async {
    final response =
        await ref.read(wordRepositoryImplProvider).getLessonDetails(id!);

    return response.data?.data ?? [];
  }
}
