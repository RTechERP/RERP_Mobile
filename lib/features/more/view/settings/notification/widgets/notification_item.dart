// Date: 14/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Widget item đơn giản - text + nút bấm cho notification settings

import 'package:flutter/material.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../data/datasource/models/notification_model.dart';
import 'notification_switch.dart';

class NotificationItem extends StatelessWidget {
  final TypeNotiItem item;
  final ValueChanged<bool> onChanged;

  const NotificationItem({
    super.key,
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.typeName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.heading,
              ),
            ),
          ),
          NotificationSwitch(
            value: item.isSelected,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
