import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Helper class để quản lý FCM push notifications.
/// Lưu ý: Background handler chính được đăng ký trong FirebaseInitializer.
/// File này chỉ cung cấp các utility methods cho push notifications.
@singleton
class PushNotificationHelper {
  late final FirebaseMessaging _firebaseMessaging;
  Function(String)? handleNotificationOnTap;
  String? pushToken;
  String? _payload;

  Future<void> initialize({
    Function(String)? handleNotificationOnTap,
  }) async {
    this.handleNotificationOnTap = handleNotificationOnTap;
    await _fcmInitialization();
  }

  Future<void> _fcmInitialization() async {
    try {
      _firebaseMessaging = FirebaseMessaging.instance;

      // Thiết lập foreground notification options cho iOS
      if (Platform.isIOS) {
        await _firebaseMessaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }

      // Lắng nghe khi app được mở từ notification (background -> foreground)
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        _payload = getNotificationContent(message);
        if (handleNotificationOnTap != null && _payload != null) {
          handleNotificationOnTap!(_payload!);
        }
      });

      // Lắng nghe foreground messages (app đang mở)
      // Lưu ý: Background handler đã được đăng ký trong FirebaseInitializer
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _payload = getNotificationContent(message);
        if (kDebugMode) {
          print('[FCM] Foreground message: ${message.notification?.title}');
        }
      });

      // Lắng nghe token refresh
      _firebaseMessaging.onTokenRefresh.listen((token) {
        pushToken = token;
        if (kDebugMode) {
          print('[FCM] Token refreshed: $pushToken');
        }
      });

      // Lấy initial message (khi app được cold start từ notification)
      final RemoteMessage? initMessage = await _firebaseMessaging.getInitialMessage();
      if (initMessage != null) {
        _payload = getNotificationContent(initMessage);
      }
    } catch (e) {
      if (kDebugMode) {
        print('[PushNotificationHelper] Initialization error: $e');
      }
    }
  }

  Future<String?> getPushToken() async {
    pushToken ??= await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print('[FCM] Token: $pushToken');
    }
    return pushToken;
  }

  Future<void> unSubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> deleteToken() async {
    pushToken = null;
    await _firebaseMessaging.deleteToken();
  }

  void removeBadgeCount() {
    if (Platform.isIOS) {
      // TODO: implement iOS badge removal
    } else if (Platform.isAndroid) {
      // TODO: implement Android badge removal
    }
  }
}

/// Chuyển đổi RemoteMessage thành JSON string.
String getNotificationContent(RemoteMessage? message) {
  if (message == null) return 'RemoteMessage is Null';
  final body = {
    'notification': {
      'title': message.notification?.title,
      'body': message.notification?.body,
    },
    'data': message.data,
    'collapse_key': message.collapseKey,
    'message_id': message.messageId,
    'sent_time': message.sentTime?.millisecondsSinceEpoch,
    'from': message.from,
    'ttl': message.ttl,
  };
  return jsonEncode(body);
}
