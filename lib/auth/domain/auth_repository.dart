import 'package:lexigo/auth/domain/sign_up_request.dart';

mixin AuthRepository {
  Future<String> signIn(String email, String password);
  Future<SignUpResponse> signUp(
    String username,
    String email,
    String password,
    String fullName,
  );
  Future<SignUpResponse> verifyRegistration(String email, String code);
}
