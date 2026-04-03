import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../notification/notification_service.dart';
import '../../../di/injection.dart';
import '../../../features/auth/data/repository/auth_repo.dart';

/// Background message handler – phải là top-level function.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationService.instance.showNotification(message);
}

class FirebaseInitializer {
  FirebaseInitializer._();

  /// Khởi tạo Firebase và FCM.
  /// Gọi trong [bootstrap] sau [WidgetsFlutterBinding.ensureInitialized].
  static Future<void> init() async {
    await Firebase.initializeApp();

    // Đăng ký background handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Khởi tạo local notifications
    await NotificationService.instance.init();

    // Xin quyền notification (iOS / Android 13+)
    await _requestPermission();

    // Lắng nghe foreground messages
    FirebaseMessaging.onMessage.listen((message) async {
      if (kDebugMode) {
        print('[FCM] Foreground message: ${message.messageId}');
      }
      await NotificationService.instance.showNotification(message);
    });

    // App opened from background notification tap
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (kDebugMode) {
        print('[FCM] onMessageOpenedApp: ${message.messageId}');
      }
      NotificationService.instance.handleNotificationTap(message);
    });

    // App launched from terminated state via notification
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      NotificationService.instance.handleNotificationTap(initialMessage);
    }

    // Lấy & in FCM token
    final token = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) {
      print('[FCM] Token: $token');
    }

    // Lắng nghe khi token được refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      if (kDebugMode) {
        print('[FCM] Token refreshed: $newToken');
      }
      try {
        getIt<AuthRepo>().updateDeviceToken(newToken);
      } catch (e) {
        if (kDebugMode) {
          print('[FCM] Lỗi cập nhật token mới lên server: $e');
        }
      }
    });
  }

  static Future<void> _requestPermission() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );
    } else {
      // Android 13+ – flutter_local_notifications xử lý quyền
      final localNotifs = FlutterLocalNotificationsPlugin();
      final androidImpl =
          localNotifs.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      await androidImpl?.requestNotificationsPermission();
    }
  }
}
