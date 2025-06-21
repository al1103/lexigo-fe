mixin AuthRepository {
  Future<String> signIn(String email, String password);
}
