import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/custom_toast.dart';

class PermissionHelper {
  static Future<bool?> getStoragePermission() async {
    var plugin = DeviceInfoPlugin();
    var android = await plugin.androidInfo;
    if (android.version.sdkInt < 33) {
      if (await Permission.storage.request().isGranted) {
        return true;
      } else if (await Permission.storage.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.audio.request().isDenied) {
        return false;
      }
    } else {
      if (await Permission.photos.request().isGranted) {
        return true;
      } else if (await Permission.photos.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.photos.request().isDenied) {
        return false;
      }
    }
    return null;
  }

  static Future<bool> haveStoragePermission() async {
    var plugin = DeviceInfoPlugin();
    var android = await plugin.androidInfo;

    if ((android.version.sdkInt < 33 && await Permission.storage.isGranted) ||
        (android.version.sdkInt >= 33 && await Permission.photos.isGranted)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> requestMicrophonePermission(BuildContext context,
      {bool canOpenAppSetting = true}) async {
    bool isGranted = await Permission.microphone.status.then(
          (status) async {
        if (status.isGranted) {
          return true;
        } else if (status.isDenied) {
          // Nếu người dùng từ chối cấp quyền
          CustomToast.showToastWithoutAppIcon(
            context: context,
            message:
            'toast_msg.you_need_to_grant_microphone_permission_to_use_this_feature'
                .tr(),
          );
          await Future.delayed(const Duration(seconds: 2));

          // Thử yêu cầu quyền lần nữa
          status = await Permission.microphone.request();
          if (status.isPermanentlyDenied) {
            // Nếu người dùng từ chối vĩnh viễn (và chọn "Don't ask again")
            // await openAppSettings(); // Mở cài đặt ứng dụng
            return false;
          } else if (status.isGranted) {
            return true;
          }
          return false;
        } else if (status.isPermanentlyDenied) {
          // Nếu quyền đã bị từ chối vĩnh viễn
          CustomToast.showToastWithoutAppIcon(
            context: context,
            message:
            'toast_msg.go_to_settings_to_enable_microphone_permission'.tr(),
          );
          await Future.delayed(const Duration(seconds: 2));
          if (canOpenAppSetting) {
            await openAppSettings(); // Mở cài đặt ứng dụng
          }
          return false;
        } else {
          return false;
        }
      },
    );
    return isGranted;
  }

  static Future<bool> requestCameraPermission(BuildContext context,
      {bool canOpenAppSetting = true, bool showToastWarning = true}) async {
    bool isGranted = await Permission.camera.status.then(
          (status) async {
        if (status.isGranted) {
          return true;
        } else if (status.isDenied) {
          // Nếu người dùng từ chối cấp quyền
          if (showToastWarning) {
            CustomToast.showToastWithoutAppIcon(
              context: context,
              message: 'toast_msg.camera_permission_required'.tr(),
              toastDuration: Duration(seconds: 3),
            );
            await Future.delayed(const Duration(seconds: 3));
          }

          // Thử yêu cầu quyền lần nữa
          status = await Permission.camera.request();
          if (status.isPermanentlyDenied) {
            // Nếu người dùng từ chối vĩnh viễn (và chọn "Don't ask again")
            // await openAppSettings(); // Mở cài đặt ứng dụng
            return false;
          } else if (status.isGranted) {
            return true;
          }
          return false;
        } else if (status.isPermanentlyDenied) {
          // Nếu quyền đã bị từ chối vĩnh viễn
          CustomToast.showToastWithoutAppIcon(
              context: context,
              message: 'toast_msg.camera_permission_settings'.tr(),
              toastDuration: Duration(seconds: 4));
          await Future.delayed(const Duration(seconds: 4));
          if (canOpenAppSetting) {
            await openAppSettings(); // Mở cài đặt ứng dụng
          }
          return false;
        } else {
          return false;
        }
      },
    );
    return isGranted;
  }
}
