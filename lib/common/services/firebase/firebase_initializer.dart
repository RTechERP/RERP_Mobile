import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../notification/notification_service.dart';
import '../../constants.dart';

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

    // Khởi tạo Firebase Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

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
    try {
      if (Platform.isIOS) {
        // Trên iOS (đặc biệt là simulator), cần đợi hệ thống cấp APNS token trước khi lấy FCM token
        await FirebaseMessaging.instance.getAPNSToken();
      }
      final token = await FirebaseMessaging.instance.getToken();
      if (kDebugMode) {
        print('[FCM] Token: $token');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FCM] Lỗi lấy token (Thường xảy ra trên iOS Simulator): $e');
      }
    }

    // Lắng nghe khi token được refresh — lưu vào SharedPreferences.
    // AuthBloc sẽ gửi token này lên server khi user login tiếp theo.
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      if (kDebugMode) {
        print('[FCM] Token refreshed: $newToken');
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(SharedKeys.savedFcmToken, newToken);
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
