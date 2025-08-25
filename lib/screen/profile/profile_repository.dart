import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/screen/profile/user_info_model.dart';

abstract class ProfileRepository {
  Future<ApiResponse<UserInfoModel>> getUserProfile();
  Future<ApiResponse<void>> updateUserProfile({
    String? fullName,
    String? avatarUrl,
    String? username, // Add username if your model supports it
  });
}
