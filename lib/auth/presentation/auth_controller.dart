import 'package:lexigo/auth/domain/value_objects.dart';
import 'package:lexigo/auth/infrastructure/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> signIn(Username username, Password password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signIn(
            username.value,
            password.value,
          ),
    );
  }
}
