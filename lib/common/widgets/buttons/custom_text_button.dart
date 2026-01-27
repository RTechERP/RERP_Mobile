import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme/index.dart';
import '../../common_ui.dart';
import '../custom_animation_widget.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.buttonFn,
    this.bgColor,
    this.height,
    this.width,
    this.text,
    this.colorText,
    this.textStyle,
    this.borderRadius,
    this.padding,
    this.margin,
    this.heightText,
    this.border,
    this.boxShadow,
    this.onAnimation = true,
    this.intrinsicWidth = true,
    this.textScaler,
    this.child,
    this.gradient,
    this.minWidth,
    this.maxLine,
    this.minScaleAnimation,
  });

  final Function()? buttonFn;
  final Color? bgColor;
  final double? height;
  final double? width;
  final String? text;
  final Color? colorText;
  final TextStyle? textStyle;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? heightText;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final bool onAnimation;
  final bool intrinsicWidth;
  final TextScaler? textScaler;
  final Widget? child;
  final Gradient? gradient;
  final double? minWidth;
  final int? maxLine;
  final double? minScaleAnimation;

  @override
  Widget build(BuildContext context) {
    double radius = borderRadius ?? AppUICommons.largeRadius;
    return Material(
      child: InkWell(
        onTap: buttonFn,
        borderRadius: BorderRadius.circular(radius),
        child: CustomAnimationWidget(
          onAnimation: onAnimation,
          minScale: minScaleAnimation ?? 0.96,
          child: intrinsicWidth
              ? IntrinsicWidth(
            child: _contentButton(radius),
          )
              : _contentButton(radius),
        ),
      ),
    );
  }

  Container _contentButton(double radius) {
    return Container(
      constraints:
      minWidth != null ? BoxConstraints(minWidth: minWidth!) : null,
      height: height,
      width: width,
      margin: margin,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: AppUICommons.extraSmallHorizontalPadding,
            vertical: 12.h,
          ),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.primaryERP,
        borderRadius: BorderRadius.circular(radius),
        border: border,
        boxShadow: boxShadow,
        gradient: gradient,
      ),
      child: Center(
        child: child ??
            Text(
              '$text',
              textScaler: textScaler,
              style: textStyle ??
                  AppStyles.button1
                      .copyWith(color: colorText, height: heightText),
              maxLines: maxLine,
            ),
      ),
    );
  }
}
