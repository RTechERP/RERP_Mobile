// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Service quản lý FCM notifications và cài đặt thông báo
//
// Chức năng:
// - Hiển thị FCM notifications
// - Quản lý cài đặt thông báo (bật/tắt từng loại)
// - Lưu trữ cài đặt vào SharedPreferences
// - Điều khiển âm thanh, rung, kiểu âm thanh, kiểu rung

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void Function(RemoteMessage message)? onNotificationTap;

  // Keys cho SharedPreferences
  static const String _keyLeaveNotifications = 'notif_leave_enabled';
  static const String _keyMeetingNotifications = 'notif_meeting_enabled';
  static const String _keyReminderNotifications = 'notif_reminder_enabled';
  static const String _keyMessageNotifications = 'notif_message_enabled';
  static const String _keyReportNotifications = 'notif_report_enabled';
  static const String _keySystemNotifications = 'notif_system_enabled';
  static const String _keySoundEnabled = 'notif_sound_enabled';
  static const String _keySoundType = 'notif_sound_type';
  static const String _keyVibrateEnabled = 'notif_vibrate_enabled';
  static const String _keyVibratePattern = 'notif_vibrate_pattern';

  /// Trạng thái các cài đặt (cached).
  Map<String, bool>? _cachedSettings;

  /// Khởi tạo plugin, tạo Android channel và tải cài đặt.
  Future<void> init() async {
    // ── Android settings ──────────────────────────────────────────────────
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // ── iOS / macOS settings ──────────────────────────────────────────────
    // Bật notification permissions để FCM có thể nhận push notifications
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
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
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_channel);
    }

    // Tải cài đặt đã lưu
    await _loadSettings();
  }

  /// Tải cài đặt từ SharedPreferences.
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    _cachedSettings = {
      'leave': prefs.getBool(_keyLeaveNotifications) ?? true,
      'meeting': prefs.getBool(_keyMeetingNotifications) ?? true,
      'reminder': prefs.getBool(_keyReminderNotifications) ?? true,
      'message': prefs.getBool(_keyMessageNotifications) ?? true,
      'report': prefs.getBool(_keyReportNotifications) ?? false,
      'system': prefs.getBool(_keySystemNotifications) ?? true,
      'sound': prefs.getBool(_keySoundEnabled) ?? true,
      'vibrate': prefs.getBool(_keyVibrateEnabled) ?? true,
    };
  }

  /// Lấy trạng thái tất cả cài đặt.
  Future<Map<String, bool>> getAllSettings() async {
    if (_cachedSettings == null) {
      await _loadSettings();
    }
    return _cachedSettings!;
  }

  //═══════════════════════════════════════════════════════════════════════════
  // PERMISSION HANDLING - Dùng permission_handler trực tiếp
  //═══════════════════════════════════════════════════════════════════════════

  /// Kiểm tra xem có quyền notification không.
  Future<PermissionStatus> getNotificationStatus() async {
    return await Permission.notification.status;
  }

  /// Kiểm tra xem đã được cấp quyền notification chưa.
  Future<bool> hasNotificationPermission() async {
    final status = await Permission.notification.status;
    return status.isGranted;
  }

  /// Yêu cầu quyền notification.
  /// Trả về trạng thái permission sau khi request.
  Future<PermissionStatus> requestNotificationPermission() async {
    return await Permission.notification.request();
  }

  /// Mở cài đặt notification của ứng dụng trong hệ thống.
  Future<void> openAppNotificationSettings() async {
    await openAppSettings();
  }

  /// Kiểm tra xem notification permission có bị từ chối vĩnh viễn không.
  Future<bool> isNotificationPermanentlyDenied() async {
    final status = await Permission.notification.status;
    return status.isPermanentlyDenied;
  }

  /// Mở app settings (nơi có toggle notification).
  /// Dùng cho cả bật và tắt notification.
  Future<bool> openNotificationSettings() async {
    return await openAppSettings();
  }

  //═══════════════════════════════════════════════════════════════════════════
  // NOTIFICATION TYPE SETTINGS
  //═══════════════════════════════════════════════════════════════════════════

  Future<void> setLeaveNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLeaveNotifications, enabled);
    _cachedSettings?['leave'] = enabled;
    await _updateNativeNotificationSettings();
  }

  Future<bool> getLeaveNotifications() async {
    await getAllSettings();
    return _cachedSettings?['leave'] ?? true;
  }

  Future<void> setMeetingNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyMeetingNotifications, enabled);
    _cachedSettings?['meeting'] = enabled;
    await _updateNativeNotificationSettings();
  }

  Future<bool> getMeetingNotifications() async {
    await getAllSettings();
    return _cachedSettings?['meeting'] ?? true;
  }

  Future<void> setReminderNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyReminderNotifications, enabled);
    _cachedSettings?['reminder'] = enabled;
    await _updateNativeNotificationSettings();
  }

  Future<bool> getReminderNotifications() async {
    await getAllSettings();
    return _cachedSettings?['reminder'] ?? true;
  }

  Future<void> setMessageNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyMessageNotifications, enabled);
    _cachedSettings?['message'] = enabled;
    await _updateNativeNotificationSettings();
  }

  Future<bool> getMessageNotifications() async {
    await getAllSettings();
    return _cachedSettings?['message'] ?? true;
  }

  Future<void> setReportNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyReportNotifications, enabled);
    _cachedSettings?['report'] = enabled;
    await _updateNativeNotificationSettings();
  }

  Future<bool> getReportNotifications() async {
    await getAllSettings();
    return _cachedSettings?['report'] ?? false;
  }

  Future<void> setSystemNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keySystemNotifications, enabled);
    _cachedSettings?['system'] = enabled;
    await _updateNativeNotificationSettings();
  }

  Future<bool> getSystemNotifications() async {
    await getAllSettings();
    return _cachedSettings?['system'] ?? true;
  }

  //═══════════════════════════════════════════════════════════════════════════
  // SOUND & VIBRATION SETTINGS
  //═══════════════════════════════════════════════════════════════════════════

  Future<void> setSoundEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keySoundEnabled, enabled);
    _cachedSettings?['sound'] = enabled;
  }

  Future<bool> getSoundEnabled() async {
    await getAllSettings();
    return _cachedSettings?['sound'] ?? true;
  }

  /// Đặt kiểu âm thanh. 0: Mặc định, 1: Ngắn, 2: Dài.
  Future<void> setSoundType(int type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keySoundType, type);
  }

  Future<int> getSoundType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keySoundType) ?? 0;
  }

  Future<void> setVibrateEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyVibrateEnabled, enabled);
    _cachedSettings?['vibrate'] = enabled;
  }

  Future<bool> getVibrateEnabled() async {
    await getAllSettings();
    return _cachedSettings?['vibrate'] ?? true;
  }

  /// Đặt kiểu rung. 0: Mặc định, 1: Ngắn, 2: Dài.
  Future<void> setVibratePattern(int pattern) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyVibratePattern, pattern);
  }

  Future<int> getVibratePattern() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyVibratePattern) ?? 0;
  }

  //═══════════════════════════════════════════════════════════════════════════
  // INTERNAL METHODS
  //═══════════════════════════════════════════════════════════════════════════

  Future<void> _updateNativeNotificationSettings() async {
    final settings = await getAllSettings();

    final anyNotificationEnabled = settings['leave'] == true ||
        settings['meeting'] == true ||
        settings['reminder'] == true ||
        settings['message'] == true ||
        settings['report'] == true ||
        settings['system'] == true;

    if (!anyNotificationEnabled) {
      await _disableNotifications();
    } else {
      await _ensureNotificationPermission();
    }
  }

  Future<void> _disableNotifications() async {
    if (Platform.isAndroid) {
      await _localNotifications.cancelAll();
    }
  }

  Future<void> _ensureNotificationPermission() async {
    final status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    }
  }

  /// Reset tất cả cài đặt về mặc định.
  Future<void> resetToDefault() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLeaveNotifications, true);
    await prefs.setBool(_keyMeetingNotifications, true);
    await prefs.setBool(_keyReminderNotifications, true);
    await prefs.setBool(_keyMessageNotifications, true);
    await prefs.setBool(_keyReportNotifications, false);
    await prefs.setBool(_keySystemNotifications, true);
    await prefs.setBool(_keySoundEnabled, true);
    await prefs.setInt(_keySoundType, 0);
    await prefs.setBool(_keyVibrateEnabled, true);
    await prefs.setInt(_keyVibratePattern, 0);
    await _loadSettings();
  }

  /// Kiểm tra xem có nên hiển thị notification không.
  Future<bool> shouldShowNotification(String type) async {
    final settings = await getAllSettings();

    switch (type) {
      case 'leave':
        return settings['leave'] ?? true;
      case 'meeting':
        return settings['meeting'] ?? true;
      case 'reminder':
        return settings['reminder'] ?? true;
      case 'message':
        return settings['message'] ?? true;
      case 'report':
        return settings['report'] ?? false;
      case 'system':
        return settings['system'] ?? true;
      default:
        return true;
    }
  }

  /// Hiển thị local notification từ FCM message.
  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final type = message.data['type'] ?? 'system';
    final shouldShow = await shouldShowNotification(type);
    if (!shouldShow) return;

    final soundEnabled = _cachedSettings?['sound'] ?? true;
    final vibrateEnabled = _cachedSettings?['vibrate'] ?? true;

    final androidDetails = AndroidNotificationDetails(
      _channel.id,
      _channel.name,
      channelDescription: _channel.description,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      playSound: soundEnabled,
      enableVibration: vibrateEnabled,
      // Dùng default system sound (đáng tin cậy trên mọi thiết bị,
      // kể cả Xiaomi/MIUI). Nếu muốn custom sound thì phải add file
      // .mp3/.ogg vào android/app/src/main/res/raw/ trước.
      sound: null,
      // Ticker text hiển thị trên status bar khi heads-up.
      ticker: notification.title,
      // Xiaomi/MIUI: thêm visibility & autoCancel để heads-up hiển thị
      // đúng trên ROM Trung Quốc.
      visibility: NotificationVisibility.public,
      autoCancel: true,
      category: AndroidNotificationCategory.message,
      // Full-screen intent (chỉ dùng cho incoming call/message quan trọng).
      fullScreenIntent: false,
    );

    final darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: soundEnabled,
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

  void handleNotificationTap(RemoteMessage message) {
    if (kDebugMode) {
      print('[Notification] Tap - data: ${message.data}');
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
