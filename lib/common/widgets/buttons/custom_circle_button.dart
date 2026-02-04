import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme/index.dart';
import '../custom_animation_widget.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    this.onTap,
    this.size,
    this.bgColor,
    this.border,
    this.boxShadow,
    this.gradient,
    this.icon,
    this.child,
    this.label,
    this.labelStyle,
    this.spacing,
    this.onAnimation = true,
    this.minScaleAnimation,
  });

  final VoidCallback? onTap;

  /// size của hình tròn
  final double? size;

  final Color? bgColor;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  /// icon hoặc widget bên trong circle
  final IconData? icon;
  final Widget? child;

  /// text hiển thị dưới circle
  final String? label;
  final TextStyle? labelStyle;

  /// khoảng cách giữa circle và text
  final double? spacing;

  final bool onAnimation;
  final double? minScaleAnimation;

  @override
  Widget build(BuildContext context) {
    final double circleSize = size ?? 56.w;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: CustomAnimationWidget(
              onAnimation: onAnimation,
              minScale: minScaleAnimation ?? 0.94,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgColor ?? AppColors.primaryERP,
                  border: border,
                  boxShadow: boxShadow,
                  gradient: gradient,
                ),
                alignment: Alignment.center,
                child: child ??
                    Icon(
                      icon,
                      color: Colors.white,
                      size: circleSize * 0.45,
                    ),
              ),
            ),
          ),
        ),
        if (label?.isNotEmpty == true) ...[
          SizedBox(height: spacing ?? 8.h),
          Text(
            label!,
            textAlign: TextAlign.center,
            style: labelStyle ?? AppStyles.body2,
            maxLines: 2,
          ),
        ],
      ],
    );
  }
}