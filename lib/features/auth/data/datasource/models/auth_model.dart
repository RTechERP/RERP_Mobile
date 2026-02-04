import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

/// ==========================
/// 🔹 Login Request Payload
/// ==========================
@freezed
class LoginPayload with _$LoginPayload {
  const factory LoginPayload({
    @JsonKey(name: 'LoginName') required String loginName,
    @JsonKey(name: 'PasswordHash') required String passwordHash,
  }) = _LoginPayload;

  factory LoginPayload.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadFromJson(json);
}

/// ==========================
/// 🔹 Login Response
/// ==========================
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    DateTime? expires, // ISO string -> DateTime tự parse
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}