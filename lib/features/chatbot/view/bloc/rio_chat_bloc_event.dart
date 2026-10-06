part of 'rio_chat_bloc.dart';

/// Sealed event cho RioChatBloc. Dùng `event.when(...)` để dispatch.
@freezed
class RioChatEvent with _$RioChatEvent {
  /// Khởi tạo bloc lần đầu và load messages đã cache.
  const factory RioChatEvent.init() = RioChatInit;

  /// Load danh sách session lịch sử chat từ server.
  const factory RioChatEvent.loadHistory() = RioChatLoadHistory;

  /// Chọn một session từ lịch sử: gọi API detail và fill messages ra màn chính.
  const factory RioChatEvent.selectSession({required int sessionId}) =
      RioChatSelectSession;

  /// Gửi tin nhắn tới Rio Chat.
  const factory RioChatEvent.sendMessage({required String message}) =
      RioChatSendMessage;

  /// Xóa lịch sử chat hiện tại.
  const factory RioChatEvent.clear() = RioChatClear;

  /// Bắt đầu cuộc hội thoại mới.
  const factory RioChatEvent.startNew() = RioChatStartNew;
}
