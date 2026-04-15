// Date: 14/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Events cho notification settings - init, toggle notification từ API

part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  /// Khởi tạo - load notification types từ API + permission status.
  const factory NotificationEvent.init() = _Init;

  /// Toggle một loại notification - gọi API + cập nhật local state.
  const factory NotificationEvent.toggleNotification({
    required int typeLinkId,
    required int notificationTypeId,
    required bool isSelected,
  }) = _ToggleNotification;

  /// Toggle master switch hệ thống (bật/tắt tất cả).
  const factory NotificationEvent.toggleSystemPermission({
    required bool value,
  }) = _ToggleSystemPermission;
}
