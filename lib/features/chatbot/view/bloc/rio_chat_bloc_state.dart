part of 'rio_chat_bloc.dart';

/// Một cặp câu hỏi - trả lời.
class ChatMessage extends Equatable {
  final String question;
  final String? answer;

  const ChatMessage({required this.question, this.answer});

  bool get isCompleted => answer != null;
  bool get isPending => answer == null;

  @override
  List get props => [question, answer];
}

/// Một session trong lịch sử chat.
class ChatHistorySessionModel extends Equatable {
  final int sessionId;
  final DateTime createdDate;
  final DateTime updatedDate;

  const ChatHistorySessionModel({
    required this.sessionId,
    required this.createdDate,
    required this.updatedDate,
  });

  @override
  List get props => [sessionId, createdDate, updatedDate];
}

/// State cho RioChatBloc.
@CopyWith()
class RioChatState extends BaseBlocState {
  /// Danh sách tin nhắn hoàn chỉnh (đã có answer).
  final List<ChatMessage> messages;

  /// Tin nhắn đang chờ trả lời (question đã gửi, answer chưa về).
  final ChatMessage? pendingMessage;

  /// Danh sách session lịch sử chat.
  final List<ChatHistorySessionModel> chatHistory;

  const RioChatState({
    required super.status,
    super.message,
    this.messages = const [],
    this.pendingMessage,
    this.chatHistory = const [],
  });

  factory RioChatState.initial() =>
      const RioChatState(status: BaseStateStatus.init);

  /// Tất cả tin nhắn (hoàn chỉnh + đang chờ).
  List<ChatMessage> get allMessages => [
    ...messages,
    if (pendingMessage != null) pendingMessage!,
  ];

  /// Có lịch sử chat cũ.
  bool get hasHistory => messages.isNotEmpty;

  /// Có session trong lịch sử chat.
  bool get hasChatHistory => chatHistory.isNotEmpty;

  /// Đang chờ bot trả lời.
  bool get isWaiting => pendingMessage != null;

  @override
  List get props => [status, message, messages, pendingMessage, chatHistory];
}
