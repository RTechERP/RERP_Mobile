import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/week_plan_model.dart';

/// Card read-only hiển thị 1 công việc con trong danh sách.
/// Tap vào card → mở bottom sheet chỉnh sửa.
class WeekPlanSubTaskCard extends StatelessWidget {
  const WeekPlanSubTaskCard({
    super.key,
    required this.index,
    required this.subTask,
    required this.onTap,
    required this.onDelete,
  });

  final int index;
  final WeekPlanSubTaskItem subTask;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: số thứ tự + content + delete
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.primaryERP.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryERP,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        subTask.content ?? 'Không có nội dung',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.heading,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: Icon(Icons.delete_outline,
                          size: 18, color: AppColors.alert),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 28, minHeight: 28),
                      tooltip: 'Xoá công việc con',
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Row 2: người thực hiện + người giao
                Row(
                  children: [
                    _InfoChip(
                      icon: Icons.person_outline,
                      label: subTask.assigneeName ?? 'Chưa chọn',
                      isPlaceholder: subTask.assigneeName == null,
                    ),
                    const SizedBox(width: 8),
                    _InfoChip(
                      icon: Icons.assignment_ind_outlined,
                      label: subTask.assignerName ?? 'Chưa chọn',
                      isPlaceholder: subTask.assignerName == null,
                    ),
                  ],
                ),

                if (subTask.startDate != null || subTask.endDate != null) ...[
                  const SizedBox(height: 6),
                  _InfoChip(
                    icon: Icons.calendar_today,
                    label: _formatDateRange(subTask.startDate, subTask.endDate),
                  ),
                ],

                // Row 3: loại công việc + độ phức tạp
                if (subTask.workTypeName != null ||
                    subTask.taskCategoryName != null ||
                    subTask.complexity != null) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      if (subTask.taskCategoryName != null)
                        _TagChip(label: subTask.taskCategoryName!),
                      if (subTask.workTypeName != null) ...[
                        if (subTask.taskCategoryName != null)
                          const SizedBox(width: 6),
                        _TagChip(label: subTask.workTypeName!),
                      ],
                      if (subTask.complexity != null) ...[
                        if (subTask.taskCategoryName != null ||
                            subTask.workTypeName != null)
                          const SizedBox(width: 6),
                        _ComplexityTag(complexity: subTask.complexity!),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDateRange(DateTime? start, DateTime? end) {
    final fmt = DateFormat('dd/MM/yyyy');
    if (start != null && end != null) {
      return '${fmt.format(start)} - ${fmt.format(end)}';
    }
    if (start != null) return 'Từ ${fmt.format(start)}';
    if (end != null) return 'Đến ${fmt.format(end)}';
    return '';
  }
}

//---(_InfoChip)---//
class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    this.isPlaceholder = false,
  });

  final IconData icon;
  final String label;
  final bool isPlaceholder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColors.hintText),
        const SizedBox(width: 3),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isPlaceholder ? AppColors.hintText : AppColors.gray,
            fontWeight: isPlaceholder ? FontWeight.w400 : FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

//---(_TagChip)---//
class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.secondaryERP.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryERP,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

//---(_ComplexityTag)---//
class _ComplexityTag extends StatelessWidget {
  const _ComplexityTag({required this.complexity});

  final int complexity;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (complexity) {
      1 => ('Dễ', AppColors.stateSuccessColor),
      2 => ('Trung bình', AppColors.warning),
      3 => ('Khó', AppColors.alert),
      _ => ('?', AppColors.hintText),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.signal_cellular_alt, size: 10, color: color),
          const SizedBox(width: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
