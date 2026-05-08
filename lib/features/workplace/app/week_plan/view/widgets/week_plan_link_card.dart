import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/week_plan_model.dart';

class WeekPlanLinkCard extends StatelessWidget {
  const WeekPlanLinkCard({
    super.key,
    required this.index,
    required this.link,
    required this.onDelete,
  });

  final int index;
  final WeekPlanLinkItem link;
  final VoidCallback onDelete;

  void _copyLink(BuildContext context) {
    final url = link.filePath ?? '';
    if (url.isEmpty) return;
    Clipboard.setData(ClipboardData(text: url));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Đã copy link'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.secondaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.link,
              color: AppColors.secondaryERP,
              size: 24,
            ),
          ),

          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    link.fileName ?? 'Link không tên',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    link.filePath ?? '',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.secondaryERP,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          // Copy
          IconButton(
            onPressed: () => _copyLink(context),
            icon: Icon(
              Icons.copy,
              size: 20,
              color: AppColors.secondaryERP,
            ),
            tooltip: 'Copy link',
          ),

          // Delete
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_outline, size: 20, color: AppColors.alert),
            tooltip: 'Xoá link',
          ),
        ],
      ),
    );
  }
}
