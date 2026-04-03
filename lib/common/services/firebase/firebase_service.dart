import 'package:firebase_messaging/firebase_messaging.dart';

/// Wrapper tiện ích để làm việc với Firebase Messaging.
/// Sử dụng thông qua [FirebaseService.instance].
class FirebaseService {
  FirebaseService._();

  static final FirebaseService instance = FirebaseService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  /// Lấy FCM token hiện tại của thiết bị.
  Future<String?> getToken() => _messaging.getToken();

  /// Subscribe vào một topic FCM.
  Future<void> subscribeToTopic(String topic) =>
      _messaging.subscribeToTopic(topic);

  /// Unsubscribe khỏi một topic FCM.
  Future<void> unsubscribeFromTopic(String topic) =>
      _messaging.unsubscribeFromTopic(topic);

  /// Xoá FCM token (ví dụ khi logout).
  Future<void> deleteToken() => _messaging.deleteToken();

  /// Trạng thái quyền notification hiện tại.
  Future<NotificationSettings> getNotificationSettings() =>
      _messaging.getNotificationSettings();
}
