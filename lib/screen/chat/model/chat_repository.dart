mixin ChatRepository {
  Future<String> chatAI(String message, {bool? isReset});
}
