import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfoHelper {
  DeviceInfoHelper._();

  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static Future<String> getDeviceId() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        // Sử dụng ID cho Android
        if(kDebugMode){
          print('Android ID: ${androidInfo.id}');
        }
        return androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        // Sử dụng identifierForVendor cho iOS
        if(kDebugMode){
          print('iOS Identifier: ${iosInfo.identifierForVendor}');

        }
        return iosInfo.identifierForVendor ?? 'unknown_ios_device';
      }
    } catch (e) {
      if(kDebugMode){
        print('Error getting device ID: $e');
      }
    }
    return 'unknown_device';
  }
}
