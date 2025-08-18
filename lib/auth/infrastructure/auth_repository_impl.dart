import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/auth/domain/auth_repository.dart';
import 'package:lexigo/auth/domain/sign_up_request.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<String> signIn(String email, String password) async {
    final result = await apiService.login(email, password);
    // Trả về token từ response
    return result.data?.token ?? '';
  }

  @override
  Future<SignUpResponse> signUp(
    String username,
    String email,
    String password,
    String fullName,
  ) async {
    final result =
        await apiService.register(username, email, password, fullName);

    // Server trả về response flat, không wrap trong data field
    // Tạo SignUpResponse từ top-level fields
    return SignUpResponse(
      status: result.status == 'success' ? result.status : '200',
      message: result.message ?? 'Vui lòng kiểm tra email để lấy mã xác nhận',
      data: result.data is Map<String, dynamic> ? result.data! : null,
    );
  }

  @override
  Future<SignUpResponse> verifyRegistration(String email, String code) async {
    final result = await apiService.verifyRegistration(email, code);

    // Tạo SignUpResponse từ top-level fields (tương tự signUp)
    return SignUpResponse(
      status: result.status == 'success' ? result.status : '200',
      message: result.message ?? 'Xác thực thành công',
      data: result.data is Map<String, dynamic> ? result.data! : null,
    );
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    AuthRepositoryImpl(ref.read(apiServiceProvider));
