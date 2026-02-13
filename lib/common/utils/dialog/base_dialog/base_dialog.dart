import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme/index.dart';
import '../../../common_ui.dart';
import '../../../services/device_type_helper.dart';
import '../../../widgets/buttons/custom_circle_button.dart';
import '../../../widgets/buttons/custom_text_button.dart';
import '../../../widgets/custom_animation_widget.dart';
import '../../navigation/navigation_utils.dart';

class BaseDialog {
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: AppColors.black.withOpacity(0.1),
      spreadRadius: 8.h,
      blurRadius: 8.h,
      offset: const Offset(0, 4),
    ),
  ];

  static Future<dynamic> baseDialog({
    required BuildContext context,
    String? heading,
    TextStyle? headingStyle,
    Widget? image,
    String? title,
    TextStyle? titleStyle,
    Widget? descriptionWidget,
    String? description,
    TextStyle? descriptionStyle,
    Widget? buttonWidget,
    bool haveCancelBottomBtn = false,
    bool? hiddenShadowDialog,
    EdgeInsetsGeometry? padding,
    Widget? contentWidget,
    bool? barrierDismissible,
    Color? backgroundColor,
    double? elevation,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppUICommons.largeRadius),
          ),
          elevation: haveCancelBottomBtn || hiddenShadowDialog == true
              ? 0
              : (elevation ?? 8.h),
          insetPadding: EdgeInsets.symmetric(
            horizontal: AppUICommons.mediumHorizontalPadding,
          ),
          backgroundColor: backgroundColor ?? Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppUICommons.largeRadius),
                  child: Container(
                    width: double.maxFinite,
                    padding:
                        padding ??
                        EdgeInsets.symmetric(
                          vertical: AppUICommons.mediumVerticalPadding,
                          horizontal: AppUICommons.mediumHorizontalPadding,
                        ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: haveCancelBottomBtn ? boxShadow : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        contentWidget ??
                            _contentWidget(
                              context: context,
                              heading: heading,
                              headingStyle: headingStyle,
                              image: image,
                              title: title,
                              titleStyle: titleStyle,
                              descriptionWidget: descriptionWidget,
                              description: description,
                              descriptionStyle: descriptionStyle,
                            ),
                        if (buttonWidget != null) buttonWidget,
                      ],
                    ),
                  ),
                ),
                if (haveCancelBottomBtn)
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Center(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => onBack(context),
                        child: CustomAnimationWidget(
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                boxShadow: haveCancelBottomBtn
                                    ? boxShadow
                                    : null,
                              ),
                              child: Icon(
                                size: 28.sp,
                                Icons.cancel_rounded,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> yesNoDialog({
    required BuildContext context,
    String? heading,
    TextStyle? headingStyle,
    required Widget image,
    String? title,
    TextStyle? titleStyle,
    Widget? descriptionWidget,
    String? description,
    TextStyle? descriptionStyle,
    required Function()? noFunc,
    String? contentNoFunc,
    Color? colorTextNoButton,
    Color? colorNoButton,
    required Function()? yesFunc,
    String? contentYesFunc,
    Color? colorYesButton,
    Color? colorTextYesButton,
    bool? hiddenShadowDialog,
    TextScaler? textScaler,
  }) {
    return baseDialog(
      context: context,
      heading: heading,
      headingStyle: headingStyle,
      image: image,
      title: title,
      titleStyle: titleStyle,
      description: description,
      descriptionWidget: descriptionWidget,
      descriptionStyle: descriptionStyle,
      hiddenShadowDialog: hiddenShadowDialog ?? false,
      buttonWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!DeviceTypeHandler.isMobile) const Spacer(),
          Expanded(
            flex: 1,
            child: CustomTextButton(
              text: contentNoFunc ?? 'common.cancel'.tr(),
              colorText: colorTextNoButton ?? AppColors.primaryERP,
              bgColor: colorNoButton ?? AppColors.primaryERPlight,
              borderRadius: AppUICommons.largeRadius,
              buttonFn: () {
                if (noFunc != null) {
                  noFunc.call();
                } else {
                  onBack(context);
                }
              },
              textScaler: textScaler,
            ),
          ),
          DeviceTypeHandler.isMobile
              ? SizedBox(width: AppUICommons.mediumHorizontalSpacing)
              : const Spacer(),
          Expanded(
            flex: 1,
            child: CustomTextButton(
              text: contentYesFunc ?? 'common.done'.tr(),
              colorText: colorTextYesButton ?? AppColors.white,
              bgColor: colorYesButton ?? AppColors.main,
              borderRadius: AppUICommons.largeRadius,
              buttonFn: () {
                if (yesFunc != null) {
                  yesFunc.call();
                } else {
                  onBack(context);
                }
              },
              textScaler: textScaler,
            ),
          ),
          if (!DeviceTypeHandler.isMobile) const Spacer(),
        ],
      ),
    );
  }

  static Future<dynamic> oneOptionDialog({
    required BuildContext context,
    bool? barrierDismissible,
    String? heading,
    TextStyle? headingStyle,
    Widget? contentWidget,
    Widget? image,
    String? title,
    TextStyle? titleStyle,
    String? description,
    TextStyle? descriptionStyle,
    Widget? descriptionWidget,
    required Function()? onTapFunc,
    String? contentButton,
    Color? colorTextButton,
    Gradient? gradientButton,
    Color? colorButton,
    bool haveCancelBottomBtn = false,
  }) {
    return baseDialog(
      context: context,
      heading: heading,
      contentWidget: contentWidget,
      headingStyle: headingStyle,
      image: image,
      title: title,
      titleStyle: titleStyle,
      descriptionWidget: descriptionWidget,
      description: description,
      descriptionStyle: descriptionStyle,
      haveCancelBottomBtn: haveCancelBottomBtn,
      barrierDismissible: barrierDismissible,
      buttonWidget: CustomTextButton(
        width: double.maxFinite,
        text: contentButton ?? 'common.cancel'.tr(),
        colorText: colorTextButton ?? AppColors.white,
        bgColor: colorButton ?? AppColors.primaryERP,
        borderRadius: AppUICommons.largeRadius,
        gradient: gradientButton,
        buttonFn: () {
          if (onTapFunc != null) {
            onTapFunc.call();
          } else {
            onBack(context);
          }
        },
      ),
    );
  }

  static Future<dynamic> twoOptionVerticalDialog({
    required BuildContext context,
    String? heading,
    TextStyle? headingStyle,
    required Widget image,
    String? title,
    TextStyle? titleStyle,
    Widget? descriptionWidget,
    String? description,
    TextStyle? descriptionStyle,
    Widget? displayIconAndText,
    required Function()? topButtonFunc,
    String? contentTopButton,
    Color? colorTextTopButton,
    Color? colorTopButton,
    required Function()? bottomButtonFunc,
    String? contentBottomButton,
    Color? colorTextBottomButton,
    Color? colorBottomButton,
    Border? colorBorder,
    bool haveCancelBottomBtn = false,
  }) {
    return baseDialog(
      context: context,
      heading: heading,
      headingStyle: headingStyle,
      image: image,
      title: title,
      titleStyle: titleStyle,
      description: description,
      descriptionStyle: descriptionStyle,
      descriptionWidget: descriptionWidget,
      haveCancelBottomBtn: haveCancelBottomBtn,
      buttonWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextButton(
            width: double.maxFinite,
            text: contentTopButton ?? 'common.done'.tr(),
            colorText: colorTextTopButton ?? AppColors.white,
            bgColor: colorTopButton ?? AppColors.main,
            borderRadius: AppUICommons.largeRadius,
            buttonFn: topButtonFunc ?? () => onBack(context),
          ),
          SizedBox(height: AppUICommons.mediumVerticalSpacing),
          CustomTextButton(
            width: double.maxFinite,
            text: contentBottomButton ?? 'common.cancel'.tr(),
            colorText: colorTextBottomButton ?? AppColors.main,
            bgColor: colorBottomButton ?? Colors.transparent,
            border: colorBorder,
            borderRadius: AppUICommons.largeRadius,
            buttonFn: bottomButtonFunc ?? () => onBack(context),
          ),
        ],
      ),
    );
  }

  static Future<dynamic> twoOptionHorizontalDialog({
    required BuildContext context,
    String? heading,
    TextStyle? headingStyle,
    Widget? image,
    String? title,
    TextStyle? titleStyle,
    Widget? descriptionWidget,
    String? description,
    TextStyle? descriptionStyle,
    Widget? displayIconAndText,

    /// LEFT
    required Future<Object?> Function()? leftButtonFunc,
    String? contentLeftButton,
    IconData? leftIcon,
    Color? leftBgColor,
    Color? leftIconColor,

    /// RIGHT
    required Future<Object?> Function()? rightButtonFunc,
    String? contentRightButton,
    IconData? rightIcon,
    Color? rightBgColor,
    Color? rightIconColor,

    Border? colorBorder,
    bool haveCancelBottomBtn = false,
  }) {
    return baseDialog(
      context: context,
      heading: heading,
      headingStyle: headingStyle,
      image: image,
      title: title,
      titleStyle: titleStyle,
      description: description,
      descriptionStyle: descriptionStyle,
      descriptionWidget: descriptionWidget,
      haveCancelBottomBtn: haveCancelBottomBtn,
      buttonWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// 🔵 LEFT
          CustomCircleButton(
            icon: leftIcon ?? Icons.admin_panel_settings_outlined,
            label: contentLeftButton ?? '',
            bgColor: leftBgColor ?? AppColors.grey_bg,
            onTap: () async {
              if (leftButtonFunc != null) {
                await leftButtonFunc();
              } else {
                onBack(context);
              }
            },
            // optional style
            // boxShadow: AppUICommons.cardShadow,
          ),

          /// 🟢 RIGHT
          CustomCircleButton(
            icon: rightIcon ?? Icons.people_alt_outlined,
            label: contentRightButton ?? '',
            bgColor: rightBgColor ?? AppColors.main,
            onTap: () async {
              if (rightButtonFunc != null) {
                await rightButtonFunc();
              } else {
                onBack(context);
              }
            },
          ),
        ],
      ),
    );
  }

  static Widget _contentWidget({
    required BuildContext context,
    String? heading,
    TextStyle? headingStyle,
    Widget? image,
    String? title,
    TextStyle? titleStyle,
    Widget? descriptionWidget,
    String? description,
    TextStyle? descriptionStyle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (heading != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: AppUICommons.mediumVerticalSpacing,
            ),
            child: Text(
              heading,
              textAlign: TextAlign.center,
              style: headingStyle ?? AppStyles.headingTitle5.copyWith(),
            ),
          ),
        if (image != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: AppUICommons.mediumVerticalSpacing,
            ),
            child: image,
          ),
        if (title != null)
          Padding(
            padding: EdgeInsets.only(bottom: AppUICommons.smallVerticalSpacing),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: titleStyle ?? AppStyles.headingTitle6.copyWith(),
            ),
          ),
        if (description != null || descriptionWidget != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: AppUICommons.largeHorizontalSpacing,
            ),
            child:
                descriptionWidget ??
                Text(
                  description ?? '',
                  textAlign: TextAlign.center,
                  style:
                      descriptionStyle ??
                      AppStyles.body2.copyWith(
                        color: AppColors.textSecondaryColor,
                      ),
                ),
          ),
      ],
    );
  }
}
