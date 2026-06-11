import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import 'poll_status_widgets.dart';

class PollDetailHeroCard extends StatelessWidget {
  const PollDetailHeroCard({
    super.key,
    required this.title,
    required this.description,
    required this.startDateText,
    required this.endDateText,
    required this.backgroundImageUrl,
    required this.accentColor,
    required this.titleColorValue,
    required this.status,
  });

  final String title;
  final String description;
  final String startDateText;
  final String endDateText;
  final String? backgroundImageUrl;
  final Color accentColor;
  final String? titleColorValue;
  final PollStatusData status;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withValues(alpha: 0.24),
                blurRadius: 4,
                offset: const Offset(-1, -1),
              ),
              BoxShadow(
                color: accentColor.withValues(alpha: 0.14),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: AppColors.secondaryERP.withValues(alpha: 0.08),
                blurRadius: 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: PollBackgroundImage(
                  imageUrl: backgroundImageUrl,
                  accentColor: accentColor,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.white.withValues(alpha: 0.72),
                        AppColors.white.withValues(alpha: 0.52),
                      ],
                    ),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.7),
                      width: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.white.withValues(alpha: 0.18),
                        Colors.transparent,
                        accentColor.withValues(alpha: 0.04),
                      ],
                      stops: const [0, 0.45, 1],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: titleColorValue?.trim().isNotEmpty == true
                            ? accentColor
                            : AppColors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    if (description.trim().isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.36),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.38),
                          ),
                        ),
                        child: Text(
                          description.trim(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: AppColors.textSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        PollStatusChip(status: status),
                        _DetailInfoChip(
                          icon: Icons.play_circle_outline_rounded,
                          label: startDateText,
                          backgroundColor: const Color(0xFFE8F5E9),
                          borderColor: const Color(0xFFC8E6C9),
                          iconColor: const Color(0xFF2E7D32),
                          textColor: const Color(0xFF2E7D32),
                        ),
                        _DetailInfoChip(
                          icon: Icons.event_available_rounded,
                          label: endDateText,
                          backgroundColor: const Color(0xFFFFEBEE),
                          borderColor: const Color(0xFFFFCDD2),
                          iconColor: const Color(0xFFC62828),
                          textColor: const Color(0xFFC62828),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailInfoChip extends StatelessWidget {
  const _DetailInfoChip({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PollBackgroundImage extends StatelessWidget {
  const PollBackgroundImage({
    super.key,
    required this.imageUrl,
    required this.accentColor,
  });

  final String? imageUrl;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              accentColor.withValues(alpha: 0.18),
              AppColors.secondaryERP.withValues(alpha: 0.1),
              AppColors.white.withValues(alpha: 0.12),
            ],
          ),
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    accentColor.withValues(alpha: 0.18),
                    AppColors.secondaryERP.withValues(alpha: 0.1),
                    AppColors.white.withValues(alpha: 0.12),
                  ],
                ),
              ),
            );
          },
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(color: Colors.transparent),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.white.withValues(alpha: 0.08),
                AppColors.white.withValues(alpha: 0.2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
