import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/screen/profile/profile_repository.dart';
import 'package:lexigo/screen/profile/user_info_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResponse<UserInfoModel>> getUserProfile() async {
    return _apiService.getUserProfile();
  }

  @override
  Future<ApiResponse<void>> updateUserProfile({
    String? fullName,
    String? avatarUrl,
    String? username, // Add username if your model supports it
  }) async {
    return _apiService.updateUserProfile(
      username: username,
      fullName: fullName,
      avatarUrl: avatarUrl,
    );
  }
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl(ref.watch(apiServiceProvider));
}
