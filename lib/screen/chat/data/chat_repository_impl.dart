import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/screen/chat/model/chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repository_impl.g.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<String> chatAI(String message, {bool? isReset}) async {
    print('🔥 ChatRepositoryImpl.chatAI called with:');
    print(
        '   Message: ${message.substring(0, message.length.clamp(0, 100))}...');
    print('   isReset: $isReset');

    try {
      final result = await apiService.chatAI(message, isReset: isReset);

      print(
          '✅ ChatRepositoryImpl received result: ${result.data?.substring(0, result.data?.length.clamp(0, 100) ?? 0)}...');
      return result.data ?? '';
    } catch (e) {
      print('❌ ChatRepositoryImpl error: $e');
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
ChatRepository chatRepository(Ref ref) =>
    ChatRepositoryImpl(ref.read(apiServiceProvider));
