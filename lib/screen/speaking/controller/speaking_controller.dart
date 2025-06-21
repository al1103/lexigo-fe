import 'dart:io';

import 'package:lexigo/screen/speaking/data/speaking_repository_impl.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'speaking_controller.g.dart';

@riverpod
class SpeakingController extends _$SpeakingController {
  @override
  FutureOr<SpeakingResult?> build() async {
    return null;
  }

  Future<SpeakingResult?> checkSpeaking(
    File audioFile,
    String referenceText,
  ) async {
    // Set loading state
    state = const AsyncValue.loading();

    try {
      final response = await ref
          .read(speakingRepositoryProvider)
          .checkSpeaking(audioFile, referenceText);

      final result = response.data;

      // Update state with result
      state = AsyncValue.data(result);

      return result;
    } catch (error, stackTrace) {
      // Update state with error
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  void resetState() {
    state = const AsyncValue.data(null);
  }
}
