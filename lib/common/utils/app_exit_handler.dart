import 'dart:io';

import 'package:flutter/services.dart';

/// Utility để thoát app hoàn toàn trên Android.
///
/// Trên Android 10+, `SystemNavigator.pop()` chỉ đẩy activity vào background
/// thay vì kill process. Để đảm bảo app thoát hoàn toàn, dùng [exit(0)].
class AppExitHandler {
  AppExitHandler._();

  /// Thoát app ngay lập tức, hoàn toàn.
  static void exitApp() {
    if (Platform.isAndroid) {
      // SystemNavigator.pop() chỉ minimize app trên Android 10+
      // Cần gọi thêm SystemNavigator.pop() để thoát hoàn toàn
      SystemNavigator.pop();
      // Fallback: kill process hoàn toàn nếu SystemNavigator không đủ
      Future.delayed(const Duration(milliseconds: 100), () {
        exit(0);
      });
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}