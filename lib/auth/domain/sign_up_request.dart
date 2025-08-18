import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.freezed.dart';
part 'sign_up_request.g.dart';

@freezed
class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'fullName') required String fullName,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}

@freezed
class SignUpResponse with _$SignUpResponse {
  const factory SignUpResponse({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Map<String, dynamic>? data,
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@freezed
class VerifyRegistrationRequest with _$VerifyRegistrationRequest {
  const factory VerifyRegistrationRequest({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'code') required String code,
  }) = _VerifyRegistrationRequest;

  factory VerifyRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyRegistrationRequestFromJson(json);
}
