import 'package:flutter/services.dart';

/// Mở các trang cài đặt hệ thống cần thiết cho notification trên ROM
/// Trung Quốc (Xiaomi/MIUI, Huawei, OPPO, Vivo).
///
/// Trên các thiết bị này, mặc định hệ thống sẽ:
/// - Kill app khi background
/// - Không cho phép nhận push notification
/// - Không cho phép autostart
///
/// User phải bật thủ công thông qua các trang này.
class VendorSettingsHelper {
  VendorSettingsHelper._();

  static const MethodChannel _channel =
      MethodChannel('vn.rtc.erp/battery');

  /// Mở trang Battery Optimization Settings.
  /// Cần thiết để MIUI không kill app khi standby.
  static Future<bool> openBatteryOptimizationSettings() async {
    try {
      final ok = await _channel.invokeMethod<bool>(
        'openBatteryOptimizationSettings',
      );
      return ok ?? false;
    } on PlatformException {
      return false;
    }
  }

  /// Mở trang Notification Settings của app hiện tại.
  static Future<bool> openAppNotificationSettings() async {
    try {
      final ok = await _channel.invokeMethod<bool>(
        'openAppNotificationSettings',
      );
      return ok ?? false;
    } on PlatformException {
      return false;
    }
  }

  /// Mở trang Autostart Settings trên ROM Trung Quốc.
  /// Thử Xiaomi → Huawei → OPPO → Vivo → fallback app details.
  static Future<bool> openAutostartSettings() async {
    try {
      final ok = await _channel.invokeMethod<bool>(
        'openAutostartSettings',
      );
      return ok ?? false;
    } on PlatformException {
      return false;
    }
  }
}
