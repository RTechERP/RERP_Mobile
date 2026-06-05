// Date: 04/06/2026

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/stamp_model.dart';

class StampCard extends StatelessWidget {
  const StampCard({super.key, required this.item, this.onTap});

  final StampItem item;
  final VoidCallback? onTap;

  static final _dateFormat = DateFormat('dd/MM/yyyy');

  Color get _statusColor {
    switch (item.status) {
      case 1:
        return AppColors.success;
      case 2:
        return AppColors.alert;
      default:
        return AppColors.warning;
    }
  }

  String get _statusText {
    final approvedText = item.approvedText?.trim();
    if (approvedText != null && approvedText.isNotEmpty) {
      return approvedText;
    }

    switch (item.status) {
      case 1:
        return 'Đã duyệt';
      case 2:
        return 'Đã hủy';
      default:
        return 'Chờ duyệt';
    }
  }

  Color get _accentColor {
    return item.status == 2 ? AppColors.gray : _statusColor;
  }

  bool get _isUrgentApproval => item.deadline != null;

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    return _dateFormat.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: _accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.approval_outlined, color: _accentColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.documentName?.trim().isNotEmpty == true
                          ? item.documentName!
                          : 'Đăng ký dấu',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.documentTypeName?.trim().isNotEmpty == true) ...[
                      const SizedBox(height: 4),
                      Text(
                        item.documentTypeName!,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: AppColors.gray,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Đăng ký: ${_formatDate(item.registerDate)} - Hạn: ${_formatDate(item.deadline)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _Badge(text: _statusText, color: _statusColor),
                        if (_isUrgentApproval)
                          const _Badge(
                            text: 'Gấp',
                            color: AppColors.alert,
                            icon: Icons.bolt_rounded,
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        _MetaItem(
                          icon: Icons.person_outline,
                          value: item.employeeName ?? '-',
                        ),
                        const SizedBox(height: 4),

                        _MetaItem(
                          icon: Icons.business_outlined,
                          value: item.departmentName ?? '-',
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

class _Badge extends StatelessWidget {
  const _Badge({required this.text, required this.color, this.icon});

  final String text;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondaryColor,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
