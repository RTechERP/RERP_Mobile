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
/// Chỉ hiển thị notification khi message là data-only (không có notification payload).
/// Nếu message có notification payload, FCM SDK Android đã tự hiển thị rồi.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // Chỉ hiển thị notification thủ công khi là data-only message
  // (message.notification == null có nghĩa là không có notification payload)
  if (message.notification == null) {
    await NotificationService.instance.showNotification(message);
  }
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
        // print('[FCM] Foreground message: ${message.messageId}');
      }
      await NotificationService.instance.showNotification(message);
    });

    // App opened from background notification tap
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (kDebugMode) {
        // print('[FCM] onMessageOpenedApp: ${message.messageId}');
      }
      NotificationService.instance.handleNotificationTap(message);
    });

    // Lấy FCM token — iOS cần gọi getAPNSToken/getToken TRƯỚC getInitialMessage
    // để SDK hoàn tất registration với APNS.
    try {
      if (Platform.isIOS) {
        String? apnsToken;
        try {
          apnsToken = await FirebaseMessaging.instance.getAPNSToken();
          if (kDebugMode) {
            // print('[FCM] APNS Token: $apnsToken');
          }
        } catch (e) {
          if (kDebugMode) {
            // print('[FCM] Loi lay APNS token: $e');
          }
        }
        if (apnsToken == null) {
          if (kDebugMode) {
            // print('[FCM] APNS token null, cho 3s...');
          }
          await Future<void>.delayed(const Duration(seconds: 3));
          try {
            apnsToken = await FirebaseMessaging.instance.getAPNSToken();
            if (kDebugMode) {
              // print('[FCM] APNS Token (retry): $apnsToken');
            }
          } catch (e) {
            if (kDebugMode) {
              // print('[FCM] Loi lay APNS token (retry): $e');
            }
          }
        }

        // Check permission status
        final settings = await FirebaseMessaging.instance.getNotificationSettings();
        if (kDebugMode) {
          // print('[FCM] Notification settings: ${settings.authorizationStatus}');
        }
      }
      final token = await FirebaseMessaging.instance.getToken();
      if (kDebugMode) {
        // print('[FCM] FCM Token: $token');
      }
    } catch (e) {
      if (kDebugMode) {
        // print('[FCM] Loi lay token: $e');
      }
    }

    // App launched from terminated state via notification — gọi SAU khi có token
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      NotificationService.instance.handleNotificationTap(initialMessage);
    }

    // Lắng nghe khi token được refresh — lưu vào SharedPreferences.
    // AuthBloc sẽ gửi token này lên server khi user login tiếp theo.
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      if (kDebugMode) {
        // print('[FCM] Token refreshed: $newToken');
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
