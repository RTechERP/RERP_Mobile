import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Quản lý hiển thị local notification khi nhận FCM message.
/// Singleton – truy cập qua [NotificationService.instance].
class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  /// Android notification channel cho FCM high-priority messages.
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'rtc_erp_high_importance_channel',
    'RTC ERP Notifications',
    description: 'Kênh thông báo chính của ứng dụng RTC ERP.',
    importance: Importance.high,
    enableVibration: true,
    playSound: true,
  );

  /// Callback được gọi khi người dùng tap vào notification.
  /// Inject từ ngoài (ví dụ từ router) để navigate đúng màn hình.
  void Function(RemoteMessage message)? onNotificationTap;

  /// Khởi tạo plugin và tạo Android channel.
  Future<void> init() async {
    // ── Android settings ──────────────────────────────────────────────────
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // ── iOS / macOS settings ──────────────────────────────────────────────
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false, // quyền đã xin qua FirebaseMessaging
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
    );

    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          _onBackgroundNotificationResponse,
    );

    // Tạo Android notification channel
    if (Platform.isAndroid) {
      await _localNotifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(_channel);
    }
  }

  /// Hiển thị local notification từ một [RemoteMessage] FCM.
  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final androidDetails = AndroidNotificationDetails(
      _channel.id,
      _channel.name,
      channelDescription: _channel.description,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
    );

    await _localNotifications.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: details,
      payload: message.data.toString(),
    );
  }

  /// Xử lý khi người dùng tap vào notification (router / deeplink).
  void handleNotificationTap(RemoteMessage message) {
    if (kDebugMode) {
      print('[Notification] Tap – data: ${message.data}');
    }
    onNotificationTap?.call(message);
  }

  // ── Private handlers ────────────────────────────────────────────────────

  void _onDidReceiveNotificationResponse(NotificationResponse response) {
    if (kDebugMode) {
      print('[Notification] Response: ${response.payload}');
    }
  }

  @pragma('vm:entry-point')
  static void _onBackgroundNotificationResponse(NotificationResponse response) {
    if (kDebugMode) {
      print('[Notification] Background response: ${response.payload}');
    }
  }
}
