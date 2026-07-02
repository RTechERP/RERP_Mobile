import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_verify_model.freezed.dart';
part 'pin_verify_model.g.dart';

@freezed
class CheckPinResponse with _$CheckPinResponse {
  const factory CheckPinResponse({
    @JsonKey(name: 'hasPin') bool? hasPin,
  }) = _CheckPinResponse;

  factory CheckPinResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckPinResponseFromJson(json);
}

@freezed
class SetPinResponse with _$SetPinResponse {
  const factory SetPinResponse({
    @JsonKey(name: 'data') dynamic data,
  }) = _SetPinResponse;

  factory SetPinResponse.fromJson(Map<String, dynamic> json) =>
      _$SetPinResponseFromJson(json);
}

@freezed
class VerifiedPinResponse with _$VerifiedPinResponse {
  const factory VerifiedPinResponse({
    @JsonKey(name: 'verified') bool? verified,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'attemptsLeft') int? attemptsLeft,
  }) = _VerifiedPinResponse;

  factory VerifiedPinResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifiedPinResponseFromJson(json);
}

@freezed
class RequestPinResponse with _$RequestPinResponse {
  const factory RequestPinResponse({
    @JsonKey(name: 'data') dynamic data,
  }) = _RequestPinResponse;

  factory RequestPinResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestPinResponseFromJson(json);
}
@freezed
class ValidateTokenResponse with _$ValidateTokenResponse {
  const factory ValidateTokenResponse({
    @JsonKey(name: 'data') dynamic data,
  }) = _ValidateTokenResponse;

  factory ValidateTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateTokenResponseFromJson(json);
}

@freezed
class ResetPinResponse with _$ResetPinResponse {
  const factory ResetPinResponse({
    @JsonKey(name: 'data') dynamic data,
  }) = _ResetPinResponse;

  factory ResetPinResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPinResponseFromJson(json);
}