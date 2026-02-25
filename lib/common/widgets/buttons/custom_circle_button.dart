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
    this.assetPath, // ✅ thêm
    this.label,
    this.labelStyle,
    this.spacing,
    this.onAnimation = true,
    this.minScaleAnimation,
  });

  final VoidCallback? onTap;
  final double? size;
  final Color? bgColor;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  final IconData? icon;
  final Widget? child;
  final String? assetPath; // ✅ thêm

  final String? label;
  final TextStyle? labelStyle;
  final double? spacing;

  final bool onAnimation;
  final double? minScaleAnimation;

  @override
  Widget build(BuildContext context) {
    final double circleSize = size ?? 56.w;

    Widget buildContent() {
      if (child != null) return child!;

      if (assetPath?.isNotEmpty == true) {
        return Image.asset(
          assetPath!,
          width: circleSize * 0.55,
          height: circleSize * 0.55,
          fit: BoxFit.contain,
        );
      }

      if (icon != null) {
        return Icon(
          icon,
          color: Colors.white,
          size: circleSize * 0.45,
        );
      }

      return const SizedBox.shrink();
    }

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
                child: buildContent(),
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