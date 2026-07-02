import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

/// Widget hiển thị một item checklist.
/// Cho phép toggle hoàn thành, xoá, chỉnh sửa.
class WeekPlanChecklistItem extends StatelessWidget {
  const WeekPlanChecklistItem({
    super.key,
    required this.index,
    required this.content,
    required this.isDone,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  final int index;
  final String content;
  final bool isDone;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDone ? AppColors.stateSuccessColor.withValues(alpha: 0.4) : AppColors.borderColor,
        ),
      ),
      child: Row(
        children: [
          // Checkbox
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: isDone ? AppColors.stateSuccessColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isDone ? AppColors.stateSuccessColor : AppColors.hintText,
                    width: 1.8,
                  ),
                ),
                child: isDone
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
            ),
          ),

          // Content
          Expanded(
            child: GestureDetector(
              onTap: onEdit,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDone ? AppColors.hintText : AppColors.heading,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            ),
          ),

          // Edit
          IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit_outlined, size: 18, color: AppColors.secondaryERP),
            tooltip: 'Chỉnh sửa',
          ),

          // Delete
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_outline, size: 18, color: AppColors.alert),
            tooltip: 'Xoá',
          ),
        ],
      ),
    );
  }
}
