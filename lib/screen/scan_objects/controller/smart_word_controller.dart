import 'package:lexigo/screen/scan_objects/data/smart_word_repository_impl.dart';
import 'package:lexigo/screen/scan_objects/models/smart_word_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'smart_word_controller.g.dart';

@riverpod
class SmartWordController extends _$SmartWordController {
  @override
  FutureOr<SmartWord?> build(String word) async {
    return getWordDetails(word);
  }

  Future<SmartWord?> getWordDetails(String word) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final response = await ref
            .read(smartWordRepositoryImplProvider)
            .getWordDetails(word);
        return response.data;
      },
    );
    return state.value;
  }
}
