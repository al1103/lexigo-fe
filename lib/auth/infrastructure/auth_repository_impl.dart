import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/auth/domain/auth_repository.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/injection/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<String> signIn(String username, String password) async {
    // final result = await apiService.login(username, password);
    // return result.data ?? '';
    return '';
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    AuthRepositoryImpl(ref.read(apiServiceProvider));
