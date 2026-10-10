part of 'rio_chat_bloc.dart';

/// Event cho RioChatBloc.
class RioChatEvent {
  const RioChatEvent();
}

/// Load/Init messages.
class InitChat extends RioChatEvent {
  const InitChat();
}

/// Gửi tin nhắn.
class SendMessage extends RioChatEvent {
  final String message;
  const SendMessage(this.message);
}

/// Xóa lịch sử chat.
class ClearChat extends RioChatEvent {
  const ClearChat();
}
