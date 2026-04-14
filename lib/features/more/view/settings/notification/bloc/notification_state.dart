// Date: 14/04/2026 - Dev: Claude
// Nội dung/Chức năng: State cho notification settings - quản lý notification types từ API

part of 'notification_bloc.dart';

@CopyWith()
class NotificationState extends BaseBlocState {
  /// Danh sách loại thông báo từ API (TypeNotiItem có IsSelected để toggle).
  final List<TypeNotiItem> notification;

  /// Trạng thái quyền notification hệ thống.
  final bool systemPermissionEnabled;

  /// Số lượng notification types đang được bật.
  final int selectedCount;

  const NotificationState({
    required super.status,
    super.message,
    this.notification = const [],
    this.systemPermissionEnabled = false,
    this.selectedCount = 0,
  });

  factory NotificationState.init() => const NotificationState(
        status: BaseStateStatus.init,
        notification: [],
        systemPermissionEnabled: false,
        selectedCount: 0,
      );

  @override
  List get props => [
        status,
        message,
        notification,
        systemPermissionEnabled,
        selectedCount,
      ];
}
