import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme/index.dart';
import '../../../common_ui.dart';
import '../../../constants/app_image.dart';
import '../../../services/device_type_helper.dart';
import '../../../widgets/buttons/custom_circle_button.dart';
import '../../../widgets/buttons/custom_text_button.dart';
import '../../../widgets/custom_animation_widget.dart';
import '../../navigation/navigation_utils.dart';

class BaseDialog {
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: AppColors.black.withValues(alpha: 0.1),
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

    /// Hiển thị logo RTC + "RTC Thông báo" ở góc trái thay vì icon ở giữa.
    bool showRtcHeader = false,

    /// Logo công ty (thay thế icon ở giữa khi showCompanyHeader = true)
    Widget? logo,

    /// Tên công ty (thay thế text "RTC Thông báo" khi showCompanyHeader = true)
    String? companyName,
    TextStyle? companyNameStyle,

    /// Hiển thị logo + tên công ty ở góc trái
    bool showCompanyHeader = false,
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
                              showRtcHeader: showRtcHeader,
                              showCompanyHeader: showCompanyHeader,
                              logo: logo,
                              companyName: companyName,
                              companyNameStyle: companyNameStyle,
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
    Widget? image,
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

    /// Hiển thị logo RTC + "RTC Thông báo" ở góc trái thay vì icon ở giữa.
    bool showRtcHeader = false,
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
      showRtcHeader: showRtcHeader,
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

  static Future<dynamic> twoOptionHorizontalDialogWithCompany({
    required BuildContext context,
    Widget? logo,
    String? companyName,
    TextStyle? companyNameStyle,
    String? title,
    TextStyle? titleStyle,
    Widget? descriptionWidget,
    String? description,
    TextStyle? descriptionStyle,

    /// Nút bên trái
    required Function()? leftButtonFunc,
    String? contentLeftButton,
    Color? colorTextLeftButton,
    Color? colorLeftButton,

    /// Nút bên phải
    required Function()? rightButtonFunc,
    String? contentRightButton,
    Color? colorTextRightButton,
    Color? colorRightButton,
    Border? borderRightButton,
    bool haveCancelBottomBtn = false,
  }) {
    return baseDialog(
      context: context,
      logo: logo,
      companyName: companyName,
      companyNameStyle: companyNameStyle,
      showCompanyHeader: true,
      title: title,
      titleStyle: titleStyle,
      description: description,
      descriptionStyle: descriptionStyle,
      descriptionWidget: descriptionWidget,
      haveCancelBottomBtn: haveCancelBottomBtn,
      buttonWidget: Row(
        children: [
          Expanded(
            child: CustomTextButton(
              width: double.maxFinite,
              text: contentLeftButton ?? '',
              colorText: colorTextLeftButton ?? AppColors.white,
              bgColor: colorLeftButton ?? AppColors.main,
              borderRadius: AppUICommons.largeRadius,
              buttonFn: leftButtonFunc ?? () => onBack(context),
            ),
          ),
          SizedBox(width: AppUICommons.mediumHorizontalSpacing),
          Expanded(
            child: CustomTextButton(
              width: double.maxFinite,
              text: contentRightButton ?? 'common.cancel'.tr(),
              colorText: colorTextRightButton ?? AppColors.main,
              bgColor: colorRightButton ?? Colors.transparent,
              border: borderRightButton,
              borderRadius: AppUICommons.largeRadius,
              buttonFn: rightButtonFunc ?? () => onBack(context),
            ),
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
    String? leftAssetPath,
    String? rightAssetPath,

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
          CustomCircleButton(
            icon: leftIcon,
            assetPath: leftAssetPath,
            label: contentLeftButton ?? '',
            bgColor: leftBgColor,
            onTap: () async {
              if (leftButtonFunc != null) {
                await leftButtonFunc();
              } else {
                onBack(context);
              }
            },
          ),

          CustomCircleButton(
            icon: rightIcon,
            assetPath: rightAssetPath,
            label: contentRightButton ?? '',
            bgColor: rightBgColor,
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
    bool showRtcHeader = false,
    bool showCompanyHeader = false,
    Widget? logo,
    String? companyName,
    TextStyle? companyNameStyle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (showRtcHeader)
          _buildRtcHeader(),
        if (showCompanyHeader)
          _buildCompanyHeader(
            logo: logo,
            companyName: companyName,
            companyNameStyle: companyNameStyle,
          ),
        if (showRtcHeader || showCompanyHeader)
          SizedBox(height: AppUICommons.mediumVerticalSpacing),
        if (!showRtcHeader && heading != null)
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
        if (!showRtcHeader && image != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: AppUICommons.mediumVerticalSpacing,
            ),
            child: image,
          ),
        if (showRtcHeader && title != null)
          Padding(
            padding: EdgeInsets.only(
              left: AppUICommons.smallHorizontalSpacing,
              right: AppUICommons.smallHorizontalSpacing,
              bottom: AppUICommons.smallVerticalSpacing,
            ),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: titleStyle ?? AppStyles.headingTitle6.copyWith(),
            ),
          ),
        if (!showRtcHeader && title != null)
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
                  textAlign: showRtcHeader ? TextAlign.left : TextAlign.center,
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

  /// Widget hiển thị logo RTC + "RTC Thông báo" ở góc trái dialog.
  static Widget _buildRtcHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          AppImages.logo_login,
          width: 32,
          height: 32,
        ),
        const SizedBox(width: 8),
        Text(
          'RTC',
          style: AppStyles.headingTitle6.copyWith(
            color: AppColors.main,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  /// Widget hiển thị logo công ty + tên công ty ở góc trái dialog.
  static Widget _buildCompanyHeader({
    Widget? logo,
    String? companyName,
    TextStyle? companyNameStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (logo != null) logo,
        if (logo != null && companyName != null) const SizedBox(width: 8),
        if (companyName != null)
          Text(
            companyName,
            style: companyNameStyle ??
                AppStyles.headingTitle6.copyWith(
                  color: AppColors.main,
                  fontWeight: FontWeight.w600,
                ),
          ),
      ],
    );
  }
}
