import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app_theme/app_colors.dart';
import '../app_theme/app_styles.dart';

class CustomToast {
  static FToast myToast = FToast();
  //static Timer _timer = Timer(const Duration(seconds: 2), () {});
  static BuildContext? _buildContext;

  static void init(BuildContext context) {
    if (context != _buildContext) {
      _buildContext = context;
      myToast.init(context);
    }
  }

  static void removeToast() {
    myToast.removeCustomToast();
    // myToast.removeQueuedCustomToasts();
  }

  static void showToast({
    required BuildContext context,
    ToastGravity? gravity,
    required Widget child,
    Duration fadeDuration = const Duration(milliseconds: 350),
    Duration toastDuration = const Duration(seconds: 2),
    bool ignorePointer = false,
    bool isDismissable = false,
    PositionedToastBuilder? positionedToastBuilder,
  }) {
    if (_buildContext != null) {
      removeToast();
    }
    init(context);
    myToast.showToast(
      child: child,
      gravity: gravity,
      toastDuration: toastDuration,
      fadeDuration: fadeDuration,
      ignorePointer: ignorePointer,
      isDismissible: isDismissable,
      positionedToastBuilder: positionedToastBuilder,
    );
    // _timer = Timer(toastDuration + fadeDuration, () {
    //   removeToast();
    // });
  }

  static void showToastWithAppIcon({
    required BuildContext context,
    ToastGravity? gravity,
    Duration fadeDuration = const Duration(milliseconds: 350),
    Duration toastDuration = const Duration(seconds: 2),
    bool ignorePointer = false,
    bool isDismissable = false,
    String? message,
    PositionedToastBuilder? positionedToastBuilder,
  }) {
    if (message?.isNotEmpty == true) {
      showToast(
        context: context,
        gravity: gravity,
        toastDuration: toastDuration,
        fadeDuration: fadeDuration,
        ignorePointer: ignorePointer,
        isDismissable: isDismissable,
        positionedToastBuilder: positionedToastBuilder,
        child: Text(message!),
      );
    }
  }

  static void showToastWithoutAppIcon({
    required BuildContext context,
    ToastGravity? gravity,
    Duration fadeDuration = const Duration(milliseconds: 350),
    Duration toastDuration = const Duration(seconds: 2),
    bool ignorePointer = false,
    bool isDismissable = false,
    String? message,
    PositionedToastBuilder? positionedToastBuilder,
  }) {
    if (message?.isNotEmpty == true) {
      try {
        showToast(
          context: context,
          gravity: gravity,
          toastDuration: toastDuration,
          fadeDuration: fadeDuration,
          ignorePointer: ignorePointer,
          isDismissable: isDismissable,
          positionedToastBuilder: positionedToastBuilder,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                  offset: Offset(0.0, 4.0),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            child: Text(
              message!,
              textAlign: TextAlign.center,
              style: AppStyles.hintText.copyWith(color: AppColors.black),
            ),
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print('error show toast: $e');
        }
      }
    }
  }

  static showToastNoContext({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      textColor: AppColors.black,
      fontSize: 16.sp,
      backgroundColor: AppColors.white,
    );
  }

  static void showCustomToast({
    required BuildContext? context,
    required String message,
    int? toastDuration,
  }) {
    if (Platform.isIOS) {
      if (context != null && context.mounted) {
        CustomToast.showToastWithoutAppIcon(
          context: context,
          message: message,
          toastDuration: Duration(seconds: toastDuration ?? 2),
          gravity: ToastGravity.TOP,
        );
      }
    } else {
      CustomToast.showToastNoContext(message: message);
    }
  }

  static void showToastOnTop({
    required BuildContext context,
    required Widget child,
    Duration fadeDuration = const Duration(milliseconds: 350),
    Duration toastDuration = const Duration(seconds: 2),
    bool ignorePointer = false,
    bool isDismissable = false,
    PositionedToastBuilder? positionedToastBuilder,
    ToastGravity? gravity,
  }) {
    showToast(
      context: context,
      child: child,
      fadeDuration: fadeDuration,
      toastDuration: toastDuration,
      ignorePointer: ignorePointer,
      isDismissable: isDismissable,
      positionedToastBuilder: positionedToastBuilder,
      gravity: gravity,
    );
  }

}
