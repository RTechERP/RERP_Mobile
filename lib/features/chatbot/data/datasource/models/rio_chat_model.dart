import 'package:freezed_annotation/freezed_annotation.dart';

part 'rio_chat_model.freezed.dart';
part 'rio_chat_model.g.dart';

@freezed
class RioChatResponse with _$RioChatResponse {
  const factory RioChatResponse({
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'answer') String? answer,
  }) = _RioChatResponse;

  factory RioChatResponse.fromJson(Map<String, dynamic> json) =>
      _$RioChatResponseFromJson(json);
}

@freezed
class RioChatMessage with _$RioChatMessage {
  const factory RioChatMessage({
    required String question,
    required String answer,
  }) = _RioChatMessage;

  factory RioChatMessage.fromJson(Map<String, dynamic> json) =>
      _$RioChatMessageFromJson(json);
}
