part of 'rio_chat_bloc.dart';

/// Một cặp câu hỏi - trả lời.
class ChatMessage {
  final String question;
  final String? answer;

  const ChatMessage({required this.question, this.answer});

  bool get isCompleted => answer != null;
  bool get isPending => answer == null;
}

/// State cho RioChatBloc.
class RioChatState extends BaseBlocState {
  /// Danh sách tin nhắn hoàn chỉnh (đã có answer).
  final List<ChatMessage> messages;

  /// Tin nhắn đang chờ trả lời (question đã gửi, answer chưa về).
  final ChatMessage? pendingMessage;

  /// Lỗi.
  final String? error;

  const RioChatState({
    required super.status,
    super.message,
    this.messages = const [],
    this.pendingMessage,
    this.error,
  });

  factory RioChatState.initial() => const RioChatState(
        status: BaseStateStatus.init,
        messages: [],
        pendingMessage: null,
        error: null,
      );

  /// Tất cả tin nhắn (hoàn chỉnh + đang chờ).
  List<ChatMessage> get allMessages => [...messages, if (pendingMessage != null) pendingMessage!];

  /// Có lịch sử chat cũ.
  bool get hasHistory => messages.isNotEmpty;

  /// Đang chờ bot trả lời.
  bool get isWaiting => pendingMessage != null;

  RioChatState copyWith({
    BaseStateStatus? status,
    String? message,
    List<ChatMessage>? messages,
    ChatMessage? pendingMessage,
    bool clearPending = false,
    String? error,
  }) {
    return RioChatState(
      status: status ?? this.status,
      message: message ?? this.message,
      messages: messages ?? this.messages,
      pendingMessage: clearPending ? null : (pendingMessage ?? this.pendingMessage),
      error: error,
    );
  }

  @override
  List get props => [status, message, messages, pendingMessage, error];
}
