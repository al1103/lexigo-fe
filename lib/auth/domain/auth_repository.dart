import 'package:lexigo/auth/domain/sign_up_request.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';

mixin AuthRepository {
  Future<String> signIn(String email, String password);
  Future<void> forgotPassword(String email);
  Future<SignUpResponse> signUp(
    String username,
    String email,
    String password,
    String fullName,
  );
  Future<SignUpResponse> verifyRegistration(String email, String code);
  Future<ApiResponse<void>> verifyOtp(String email, String otp);
  Future<ApiResponse<void>> resetPassword(String email, String newPassword);
}
