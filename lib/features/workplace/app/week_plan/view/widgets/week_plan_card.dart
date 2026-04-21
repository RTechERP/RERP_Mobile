// Date: 21/04/2026
// Nội dung/Chức năng: Week Plan card - hiển thị công việc theo trạng thái

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../week_plan_helper.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';

/// Lấy màu border trái dựa trên trạng thái.
Color weekPlanStatusColor(WeekPlanTaskItem task) {
  final status = (task.statusText ?? '').trim();
  final lower = status.toLowerCase();

  if (lower.contains('hoàn thành') || lower.contains('done') || lower.contains('completed')) {
    return AppColors.stateSuccessColor;
  }
  if (lower.contains('đang') || lower.contains('in progress')) {
    return AppColors.stateInfoColor;
  }
  if (lower.contains('từ chối') || lower.contains('quá hạn') || lower.contains('rejected') || lower.contains('overdue')) {
    return AppColors.alert;
  }
  if (lower.contains('chưa') || lower.contains('pending') || lower.contains('not started')) {
    return AppColors.gray;
  }
  return AppColors.warning;
}

/// Kiểm tra task có quá hạn không.
bool weekPlanIsOverdue(WeekPlanTaskItem task) {
  if (task.deadline == null) return false;
  return DateTime.now().isAfter(task.deadline!) && task.status != 3;
}

class WeekPlanCard extends StatelessWidget {
  const WeekPlanCard({
    super.key,
    required this.task,
    this.isAssigned = false,
    this.onTap,
  });

  final WeekPlanTaskItem task;
  final bool isAssigned;
  final VoidCallback? onTap;

  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final statusColor = weekPlanStatusColor(task);
    final statusLabel = weekPlanStatusLabel(task);
    final isOverdue = weekPlanIsOverdue(task);
    final isCheckedIn = task.isCheckedIn;

    final inner = Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Row 1: icon + project name + status badge + check-in button / overdue badge
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            isAssigned
                                ? Icons.person_outline
                                : Icons.assignment_outlined,
                            size: 20,
                            color: statusColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _TinyBadge(
                                text: statusLabel,
                                color: statusColor,
                              ),
                              if ((task.projectName ?? '').isNotEmpty) ...[
                                const SizedBox(height: 2),
                                Text(
                                  task.projectName!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textSecondaryColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (isOverdue)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.alert.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Không điểm danh',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.alert,
                              ),
                            ),
                          )
                        else
                          _CheckinButton(
                            task: task,
                            isCheckedIn: isCheckedIn,
                          ),
                      ],
                    ),

                    // Row 2: deadline icon + deadline date
                    const SizedBox(height: 6),
                    if (task.deadline != null)
                      Row(
                        children: [
                          Icon(
                            isOverdue
                                ? Icons.warning_amber_rounded
                                : Icons.schedule,
                            size: 14,
                            color: isOverdue
                                ? AppColors.alert
                                : AppColors.textTertiaryColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Thời hạn: ${_dateFormat.format(task.deadline!)}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isOverdue
                                  ? AppColors.alert
                                  : AppColors.textTertiaryColor,
                            ),
                          ),
                        ],
                      ),

                    // Divider
                    const SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: AppColors.borderColor.withValues(alpha: 0.6),
                    ),
                    const SizedBox(height: 10),

                    // Task name
                    if ((task.taskName ?? '').isNotEmpty)
                      Text(
                        task.taskName!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.heading,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    // Bottom: assignee info (only in assigned tab)
                    if (isAssigned && (task.assigneeName ?? '').isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            size: 14,
                            color: AppColors.textTertiaryColor,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              task.assigneeName!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.text,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return onTap == null
        ? inner
        : Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onTap,
              child: inner,
            ),
          );
  }
}

//---(_CheckinButton)---//

class _CheckinButton extends StatelessWidget {
  const _CheckinButton({
    required this.task,
    required this.isCheckedIn,
  });

  final WeekPlanTaskItem task;
  final bool isCheckedIn;

  @override
  Widget build(BuildContext context) {
    final isDone = (task.statusText ?? '').toLowerCase().contains('hoàn thành') ||
        task.status == 2;

    return GestureDetector(
      onTap: () => _onCheckIn(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isCheckedIn
              ? AppColors.stateSuccessColor.withValues(alpha: 0.1)
              : isDone
                  ? AppColors.stateSuccessColor.withValues(alpha: 0.1)
                  : AppColors.primaryERP,
          borderRadius: BorderRadius.circular(20),
          boxShadow: (isCheckedIn || isDone)
              ? null
              : [
                  BoxShadow(
                    color: AppColors.primaryERP.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Text(
          isCheckedIn
              ? 'Đã điểm danh'
              : isDone
                  ? 'Hoàn thành'
                  : 'Điểm danh',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: (isCheckedIn || isDone)
                ? AppColors.stateSuccessColor
                : Colors.white,
          ),
        ),
      ),
    );
  }

  void _onCheckIn(BuildContext context) {
    if (task.id == null || isCheckedIn) return;
    context.read<WeekPlanBloc>().add(WeekPlanEvent.checkIn(task.id!));
  }
}

//---(_TinyBadge)---//

class _TinyBadge extends StatelessWidget {
  const _TinyBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final safeText = text.trim().isEmpty ? '-' : text.trim();
    final bg = color.withValues(alpha: 0.12);
    final border = color.withValues(alpha: 0.4);

    return Container(
      constraints: const BoxConstraints(maxWidth: 100),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: border),
      ),
      child: Text(
        safeText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
