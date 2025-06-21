import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/injection/di.dart';
import 'package:lexigo/screen/chat/model/chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repository_impl.g.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<String> chatAI(String message, {bool? isReset}) async {
    final result = await apiService.chatAI(message, isReset: isReset);
    return result.data ?? '';
  }
}

@Riverpod(keepAlive: true)
ChatRepository chatRepository(Ref ref) =>
    ChatRepositoryImpl(ref.read(apiServiceProvider));
