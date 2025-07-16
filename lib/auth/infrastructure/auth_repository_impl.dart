import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/auth/domain/auth_repository.dart';
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
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    AuthRepositoryImpl(ref.read(apiServiceProvider));
