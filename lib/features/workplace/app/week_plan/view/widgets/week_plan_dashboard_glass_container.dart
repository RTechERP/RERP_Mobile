import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

/// Glass-style container dùng chung cho các card trong dashboard.
///
/// Hỗ trợ 2 biến thể:
///  - Mặc định: nền trắng trong suốt + border + shadow + blur (glassmorphism)
///  - Có [gradient]: dùng cho hero card (gradient cam, không blur)
class WeekPlanDashboardGlassContainer extends StatelessWidget {
  const WeekPlanDashboardGlassContainer({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.gradient,
    this.borderColor,
    this.borderRadius = 20,
    this.useBlur = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;
  final Color? borderColor;
  final double borderRadius;
  final bool useBlur;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final border = borderColor ?? Colors.white.withValues(alpha: 0.6);

    Widget content = Container(
      decoration: BoxDecoration(
        gradient: gradient ??
            const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xCCFFFFFF),
                Color(0xE6FFFFFF),
              ],
            ),
        borderRadius: radius,
        border: Border.all(color: border, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: padding,
      child: ClipRRect(
        borderRadius: radius,
        child: useBlur
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: child,
              )
            : child,
      ),
    );
    return content;
  }
}

/// Vòng tròn mờ dùng làm hiệu ứng trang trí cho hero card.
class WeekPlanDashboardBlurCircle extends StatelessWidget {
  const WeekPlanDashboardBlurCircle({
    super.key,
    required this.size,
    required this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            width: size,
            height: size,
            color: color,
          ),
        ),
      ),
    );
  }
}

/// Header cho mỗi section trong dashboard.
class WeekPlanDashboardSectionHeader extends StatelessWidget {
  const WeekPlanDashboardSectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryERP,
            size: 16,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.textTertiaryColor,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
