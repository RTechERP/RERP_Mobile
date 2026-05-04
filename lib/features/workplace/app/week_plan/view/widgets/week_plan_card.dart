// Date: 28/04/2026
// Nội dung/Chức năng: Week Plan card - hiển thị công việc theo trạng thái

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../week_plan_helper.dart';

//---(Card)---//

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

  static final DateFormat _df = DateFormat('dd/MM/yyyy');
  static final DateFormat _tf = DateFormat('dd/MM/yyyy');

  String _fmt(DateTime? dt) => dt == null ? '-' : _df.format(dt);
  String _fmts(DateTime? dt) => dt == null ? '-' : _tf.format(dt);

  @override
  Widget build(BuildContext context) {
    final statusColor = weekPlanStatusColor(task);
    final statusLabel = weekPlanStatusLabel(task);
    final isOverdue = weekPlanIsOverdue(task);
    final isCheckedIn = task.isCheck == true;
    final typeColor = weekPlanTypeColor(task);
    final typeName = task.projectTaskTypeName ?? '';

    final inner = Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Left accent bar
              Container(width: 4, color: statusColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(statusColor, statusLabel, typeColor, typeName, isCheckedIn),
                      const SizedBox(height: 12),
                      _buildTaskName(),
                      const SizedBox(height: 14),
                      _buildTimeline(),
                      if (isAssigned && (task.departmentAssigneeName ?? '').isNotEmpty) ...[
                        const SizedBox(height: 14),
                        _buildAssignee(),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return onTap == null
        ? inner
        : Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTap,
              child: inner,
            ),
          );
  }

  //---(_Header)---//
  Widget _buildHeader(Color statusColor, String statusLabel, Color typeColor, String typeName, bool isCheckedIn) {
    return Row(
      children: [
        // Icon
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            isAssigned ? Icons.person_outline : Icons.assignment_outlined,
            size: 18,
            color: statusColor,
          ),
        ),
        const SizedBox(width: 10),

        // Project info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if ((task.projectName ?? '').isNotEmpty)
                Text(
                  task.projectName!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondaryColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              if ((task.projectCode ?? '').isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    task.projectCode!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textTertiaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),

        // Type badge
        if (typeName.isNotEmpty) ...[
          _TypeBadge(text: typeName, color: typeColor),
          const SizedBox(width: 8),
        ],

        // Checkin button
        _CheckinButton(task: task, isCheckedIn: isCheckedIn),
      ],
    );
  }

  //---(_TaskName)---//
  Widget _buildTaskName() {
    final name = task.mission ?? task.taskName ?? '';
    if (name.isEmpty) return const SizedBox.shrink();

    return Text(
      name,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.heading,
        height: 1.3,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  //---(_Timeline)---//
  Widget _buildTimeline() {
    final planStart = task.planStartDate ?? task.startDate;
    final planEnd = task.planEndDate ?? task.endDate;
    final actualStart = task.actualStartDate;
    final actualEnd = task.actualEndDate;
    final deadline = task.deadline;
    final isOverdue = weekPlanIsOverdue(task);

    final hasPlan = planStart != null || planEnd != null;
    final hasActual = actualStart != null || actualEnd != null;
    final hasOnlyDates = !hasPlan && !hasActual;

    return Column(
      children: [
        // Deadline row (if exists)
        if (deadline != null) ...[
          _buildMetaRow(
            icon: isOverdue ? Icons.warning_amber_rounded : Icons.event,
            iconColor: isOverdue ? AppColors.alert : AppColors.textTertiaryColor,
            label: 'Thời hạn',
            value: _fmt(deadline),
            valueColor: isOverdue ? AppColors.alert : AppColors.heading,
          ),
          const SizedBox(height: 8),
        ],

        // Status badge
        _buildMetaRow(
          icon: Icons.flag_outlined,
          iconColor: weekPlanStatusColor(task),
          label: 'Trạng thái',
          value: weekPlanStatusLabel(task),
          valueColor: weekPlanStatusColor(task),
        ),

        // Date rows
        if (hasPlan) ...[
          const SizedBox(height: 8),
          _buildTimelineRow(
            label: 'Dự kiến',
            start: planStart,
            end: planEnd,
            color: AppColors.stateInfoColor,
          ),
        ],
        if (hasActual) ...[
          const SizedBox(height: 6),
          _buildTimelineRow(
            label: 'Thực tế',
            start: actualStart,
            end: actualEnd,
            color: AppColors.stateSuccessColor,
          ),
        ],
        if (hasOnlyDates) ...[
          const SizedBox(height: 8),
          _buildTimelineRow(
            label: 'Ngày',
            start: task.startDate,
            end: task.endDate,
            color: AppColors.textTertiaryColor,
          ),
        ],
      ],
    );
  }

  Widget _buildMetaRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 14, color: iconColor),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textTertiaryColor,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: valueColor ?? AppColors.heading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineRow({
    required String label,
    required DateTime? start,
    required DateTime? end,
    required Color color,
  }) {
    return Row(
      children: [
        // Timeline dot
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        // Label
        SizedBox(
          width: 56,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textTertiaryColor,
            ),
          ),
        ),
        // Start
        _TimelineChip(label: 'Bắt đầu', value: _fmts(start), color: color),
        const SizedBox(width: 8),
        // Arrow
        Icon(Icons.arrow_forward, size: 12, color: AppColors.textTertiaryColor),
        const SizedBox(width: 8),
        // End
        _TimelineChip(label: 'Kết thúc', value: _fmts(end), color: color),
      ],
    );
  }

  //---(_Assignee)---//
  Widget _buildAssignee() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.supportBtn,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.person_outline,
            size: 14,
            color: AppColors.textTertiaryColor,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              task.departmentAssigneeName!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondaryColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

//---(_TypeBadge)---//
class _TypeBadge extends StatelessWidget {
  const _TypeBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

//---(_TimelineChip)---//
class _TimelineChip extends StatelessWidget {
  const _TimelineChip({required this.label, required this.value, required this.color});

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.15)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 9,
                      color: color.withValues(alpha: 0.8),
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//---(_CheckinButton)---//
class _CheckinButton extends StatelessWidget {
  const _CheckinButton({required this.task, required this.isCheckedIn});

  final WeekPlanTaskItem task;
  final bool isCheckedIn;

  @override
  Widget build(BuildContext context) {
    final isDone = task.status == 3 || task.status == 2;
    final isActive = isCheckedIn || isDone;

    return GestureDetector(
      onTap: () => _onCheckIn(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.stateSuccessColor.withValues(alpha: 0.1)
              : AppColors.primaryERP,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? null
              : [
                  BoxShadow(
                    color: AppColors.primaryERP.withValues(alpha: 0.25),
                    blurRadius: 6,
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
            color: isActive ? AppColors.stateSuccessColor : Colors.white,
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
