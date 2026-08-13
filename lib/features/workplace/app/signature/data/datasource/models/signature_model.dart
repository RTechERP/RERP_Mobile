import 'package:freezed_annotation/freezed_annotation.dart';

part 'signature_model.freezed.dart';
part 'signature_model.g.dart';

@freezed
class SignatureRoutePayload with _$SignatureRoutePayload {
  const factory SignatureRoutePayload({
    String? signatureData,
  }) = _SignatureRoutePayload;

  factory SignatureRoutePayload.fromJson(Map<String, dynamic> json) =>
      _$SignatureRoutePayloadFromJson(json);
}
