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

/// Session trong lịch sử chat.
@freezed
class ChatHistorySession with _$ChatHistorySession {
  const factory ChatHistorySession({
    @JsonKey(name: 'SessionID') required int sessionId,
    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'UpdatedDate') required DateTime updatedDate,
  }) = _ChatHistorySession;

  factory ChatHistorySession.fromJson(Map<String, dynamic> json) =>
      _$ChatHistorySessionFromJson(json);
}

/// Một cặp câu hỏi - trả lời trong chi tiết session.
@freezed
class ChatHistoryMessage with _$ChatHistoryMessage {
  const factory ChatHistoryMessage({
    @JsonKey(name: 'Question') required String question,
    @JsonKey(name: 'Answer') required String answer,
  }) = _ChatHistoryMessage;

  factory ChatHistoryMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryMessageFromJson(json);
}

/// Chi tiết một session chat: thông tin + messages.
@freezed
class ChatSessionDetail with _$ChatSessionDetail {
  const factory ChatSessionDetail({
    @JsonKey(name: 'SessionID') required int sessionId,
    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'UpdatedDate') required DateTime updatedDate,
    @JsonKey(name: 'Messages') required List<ChatHistoryMessage> messages,
  }) = _ChatSessionDetail;

  factory ChatSessionDetail.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionDetailFromJson(json);
}
