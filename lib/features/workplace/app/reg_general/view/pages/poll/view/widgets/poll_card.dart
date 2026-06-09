import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/poll_model.dart';

class PollCard extends StatelessWidget {
  const PollCard({super.key, required this.item, required this.onTap});

  final PollItem item;
  final VoidCallback onTap;

  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  bool get _isOpen {
    final now = DateTime.now();
    final start = item.startDate;
    final end = item.endDate;
    if (start != null && now.isBefore(start)) return false;
    if (end != null && now.isAfter(end)) return false;
    return true;
  }

  bool get _isUpcoming {
    final now = DateTime.now();
    final start = item.startDate;
    if (start != null && now.isBefore(start)) return true;
    return false;
  }

  String get _startDateLabel =>
      item.startDate != null ? _dateFormat.format(item.startDate!) : '--';

  String get _endDateLabel =>
      item.endDate != null ? _dateFormat.format(item.endDate!) : '--';

  String? get _backgroundImageUrl {
    final path = item.backgroundImagePath?.trim();
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return path;
    }

    // final baseUrl = AppConfig.baseUrl.trim();
    final baseUrl = 'https://erp.rtc.edu.vn/api/api';
    if (baseUrl.isEmpty) return path;

    var normalizedBaseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    if (normalizedBaseUrl.endsWith('/api')) {
      normalizedBaseUrl = normalizedBaseUrl.substring(
        0,
        normalizedBaseUrl.length - 4,
      );
    }

    final normalizedPath = path.startsWith('/') ? path : '/$path';

    return '$normalizedBaseUrl$normalizedPath';
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _parseColor(item.titleColor);
    final backgroundImageUrl = _backgroundImageUrl;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
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
                    child: _PollCardBackground(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(),
                            if ((item.description ?? '').trim().isNotEmpty) ...[
                              const SizedBox(height: 10),
                              _buildDescription(),
                            ],
                            const SizedBox(height: 16),
                            _buildChips(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final accentColor = _parseColor(item.titleColor);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title ?? 'Chủ đề bình chọn',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: item.titleColor?.trim().isNotEmpty == true
                      ? accentColor
                      : AppColors.black,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 4),
              _buildStatusBadge(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge() {
    if (_isOpen) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.greenA500,
              AppColors.greenA500.withValues(alpha: 0.85),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.greenA500.withValues(alpha: 0.3),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'Đang mở',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      );
    }
    if (_isUpcoming) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.warning.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.schedule_rounded, size: 12, color: AppColors.warning),
            const SizedBox(width: 5),
            Text(
              'Sắp diễn ra',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.warning,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.gray.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            size: 12,
            color: AppColors.gray,
          ),
          const SizedBox(width: 5),
          Text(
            'Đã đóng',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.36),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.38)),
      ),
      child: Text(
        item.description!.trim(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          height: 1.5,
          color: AppColors.textSecondaryColor,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _InfoChip(
          icon: Icons.play_circle_outline_rounded,
          label: _startDateLabel,
          backgroundColor: const Color(0xFFE8F5E9),
          borderColor: const Color(0xFFC8E6C9),
          iconColor: const Color(0xFF2E7D32),
          textColor: const Color(0xFF2E7D32),
        ),
        const SizedBox(width: 12),
        _InfoChip(
          icon: Icons.event_available_rounded,
          label: _endDateLabel,
          backgroundColor: const Color(0xFFFFEBEE),
          borderColor: const Color(0xFFFFCDD2),
          iconColor: const Color(0xFFC62828),
          textColor: const Color(0xFFC62828),
        ),
      ],
    );
  }

  Color _parseColor(String? colorHex) {
    final value = (colorHex ?? '').replaceAll('#', '').trim();
    if (value.length == 6) {
      return Color(int.parse('FF$value', radix: 16));
    }
    if (value.length == 8) {
      return Color(int.parse(value, radix: 16));
    }
    return AppColors.primaryERP;
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
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

class _PollCardBackground extends StatelessWidget {
  const _PollCardBackground({
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
