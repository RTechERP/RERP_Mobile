// Date: 28/04/2026
// Nội dung/Chức năng: Week Plan card - hiển thị công việc theo trạng thái

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/form_left_border_card.dart';
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

  String _fmt(DateTime? dt) => dt == null ? '--/--/----' : _df.format(dt);

  @override
  Widget build(BuildContext context) {
    final statusColor = weekPlanStatusColor(task);
    final statusLabel = weekPlanStatusLabel(task);
    final isOverdue = weekPlanIsOverdue(task);
    final isCheckedIn = task.isCheck == true;
    final typeColor = weekPlanTypeColor(task);
    final typeName = task.projectTaskTypeName ?? '';

    final inner = FormLeftBorderCard(
      borderColor: statusColor,
      backgroundColor: AppColors.white,
      borderWidth: 4,
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTopBar(statusColor, statusLabel, typeColor, typeName, isCheckedIn),
          if ((task.projectCode ?? '').isNotEmpty || (task.projectName ?? '').isNotEmpty) ...[
            const SizedBox(height: 6),
            _buildProjectInfo(),
          ],
          const SizedBox(height: 6),
          _buildTaskName(),

          const SizedBox(height: 6),
          _buildDeadline(isOverdue),
          if (isAssigned && (task.departmentAssigneeName ?? '').isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildAssignee(),
          ],
        ],
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

  //---(_TopBar)---//
  Widget _buildTopBar(
    Color statusColor,
    String statusLabel,
    Color typeColor,
    String typeName,
    bool isCheckedIn,
  ) {
    return Row(
      children: [
        // Status chip
        _StatusChip(color: statusColor, label: statusLabel),
        const SizedBox(width: 8),
        // Type badge
        if (typeName.isNotEmpty) ...[
          _TypeBadge(text: typeName, color: typeColor),
          const SizedBox(width: 8),
        ],
        const Spacer(),
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
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.heading,
        height: 1.3,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  //---(_ProjectInfo)---//
  Widget _buildProjectInfo() {
    return Row(
      children: [
        if ((task.projectCode ?? '').isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.supportBtn,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              task.projectCode!,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondaryColor,
              ),
            ),
          ),
          if ((task.projectName ?? '').isNotEmpty) const SizedBox(width: 6),
        ],
        if ((task.projectName ?? '').isNotEmpty)
          Flexible(
            child: Text(
              task.projectName!,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textTertiaryColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  //---(_Deadline)---//
  Widget _buildDeadline(bool isOverdue) {
    return Row(
      children: [
        Icon(
          isOverdue ? Icons.warning_amber_rounded : Icons.event_outlined,
          size: 13,
          color: isOverdue ? AppColors.alert : AppColors.textTertiaryColor,
        ),
        const SizedBox(width: 5),
        Text(
          'Thời hạn: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textTertiaryColor,
          ),
        ),
        Text(
          _fmt(task.deadline),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isOverdue ? AppColors.alert : AppColors.heading,
          ),
        ),
      ],
    );
  }

  //---(_Assignee)---//
  Widget _buildAssignee() {
    return Row(
      children: [
        Icon(
          Icons.person_outline,
          size: 13,
          color: AppColors.textTertiaryColor,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            task.departmentAssigneeName!,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondaryColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

//---(_StatusChip)---//
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.stateSuccessColor.withValues(alpha: 0.1)
              : AppColors.primaryERP,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isActive
              ? null
              : [
                  BoxShadow(
                    color: AppColors.primaryERP.withValues(alpha: 0.2),
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
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isActive ? AppColors.stateSuccessColor : Colors.white,
          ),
        ),
      ),
    );
  }

  void _onCheckIn(BuildContext context) {
    if (task.id == null) return;
    context.read<WeekPlanBloc>().add(WeekPlanEvent.checkIn(task.id!, !isCheckedIn));
  }
}
