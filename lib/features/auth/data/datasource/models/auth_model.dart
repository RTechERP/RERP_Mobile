// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Auth data models - LoginPayload, LoginResponse

// ignore_for_file: type=lint, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

/// Payload gửi lên API login.
@freezed
class LoginPayload with _$LoginPayload {
  const factory LoginPayload({
    @JsonKey(name: 'LoginName') required String loginName,
    @JsonKey(name: 'PasswordHash') required String passwordHash,
  }) = _LoginPayload;

  factory LoginPayload.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadFromJson(json);
}

/// Response từ API login - chứa accessToken và thời điểm hết hạn.
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    DateTime? expires,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
