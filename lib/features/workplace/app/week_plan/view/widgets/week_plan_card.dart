import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../bloc/week_plan_approval_bloc.dart';
import '../week_plan_helper.dart';

//---(Card)---//

class WeekPlanCard extends StatefulWidget {
  const WeekPlanCard({
    super.key,
    required this.task,
    required this.approvalBloc,
    this.isAssigned = false,
    this.showCheckIn = true,
    this.showApproval = false,
    this.viewNumber = 1,
    this.onTap,
  });

  final WeekPlanTaskItem task;
  final WeekPlanApprovalBloc approvalBloc;
  final bool isAssigned;
  final bool showCheckIn;
  final bool showApproval;
  final int viewNumber;
  final VoidCallback? onTap;

  static final DateFormat _df = DateFormat('dd/MM/yyyy');

  @override
  State<WeekPlanCard> createState() => _WeekPlanCardState();
}

class _WeekPlanCardState extends State<WeekPlanCard> {
  String _fmt(DateTime? dt) =>
      dt == null ? '--/--/----' : WeekPlanCard._df.format(dt);

  @override
  Widget build(BuildContext context) {
    final statusColor = weekPlanStatusColor(widget.task);
    final statusLabel = weekPlanStatusLabel(widget.task);
    final isOverdue = weekPlanIsOverdue(widget.task);
    final isCheckedIn = widget.task.isCheck == true;
    final typeColor = weekPlanTypeColor(widget.task);
    final typeName = widget.task.projectTaskTypeName ?? '';

    final inner = FormLeftBorderCard(
      borderColor: statusColor,
      backgroundColor: AppColors.white,
      borderWidth: 4,
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTopBar(
            statusColor,
            statusLabel,
            typeColor,
            typeName,
            isCheckedIn,
            widget.showCheckIn,
          ),
          if ((widget.task.projectCode ?? '').isNotEmpty ||
              (widget.task.projectName ?? '').isNotEmpty) ...[
            const SizedBox(height: 6),
            _buildProjectInfo(),
          ],
          const SizedBox(height: 6),
          _buildTaskName(),

          const SizedBox(height: 6),
          _buildDeadline(isOverdue),
          if (widget.showApproval) ...[
            const SizedBox(height: 8),
            _buildReceiver(),
          ],
          if (widget.viewNumber == 1 &&
              (widget.task.fullName ?? '').isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildAssigneer(),
          ],
          if (widget.isAssigned &&
              (widget.task.departmentAssigneeName ?? '').isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildDepartmentAssignee(),
          ],
          if (widget.viewNumber == 1 &&
              (widget.task.reviewCompletionRating ?? 0) > 0) ...[
            const SizedBox(height: 8),
            _buildRating(),
          ],
        ],
      ),
    );

    return widget.onTap == null
        ? inner
        : Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: widget.onTap,
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
    bool showCheckIn,
  ) {
    final approvalStatus = widget.task.approvalStatus;
    final isDone = widget.task.status == 2;

    String label;
    Color color;
    bool isApprovedOrRejected = false;

    if (isDone && approvalStatus == true) {
      label = 'Done';
      color = AppColors.stateSuccessColor;
      isApprovedOrRejected = true;
    } else if (isDone && approvalStatus == false) {
      label = 'Reject';
      color = AppColors.stateErrorColor;
      isApprovedOrRejected = true;
    } else if (isDone) {
      label = 'Awaiting Approval';
      color = AppColors.stateSuccessColor;
    } else {
      label = statusLabel;
      color = statusColor;
    }

    final showApprovalButtons = widget.showApproval && !isApprovedOrRejected;

    return Column(
      children: [
        Row(
          children: [
            _StatusChip(color: color, label: label),
            const SizedBox(width: 4),
            if (typeName.isNotEmpty)
              _TypeBadge(text: typeName, color: typeColor),
            const Spacer(),
            if (showApprovalButtons) ...[
              _ApprovalButton(
                label: 'Từ chối',
                color: AppColors.stateErrorColor,
                onTap: () {
                  DialogService.showRejectTask(
                    context: context,
                    onConfirm: (reason) {
                      widget.approvalBloc.add(
                        WeekPlanApprovalEvent.rejectTask(
                          taskId: widget.task.id ?? 0,
                          reason: reason,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 8),
              _ApprovalButton(
                label: 'Duyệt',
                color: AppColors.stateSuccessColor,
                onTap: () {
                  DialogService.showApproveTask(
                    context: context,
                    onConfirm: (rating, comment) {
                      widget.approvalBloc.add(
                        WeekPlanApprovalEvent.approveTask(
                          taskId: widget.task.id ?? 0,
                          completionRating: rating,
                          review: comment,
                        ),
                      );
                    },
                  );
                },
              ),
            ] else if (showCheckIn)
              _CheckinButton(task: widget.task, isCheckedIn: isCheckedIn),
          ],
        ),
      ],
    );
  }

  //---(_TaskName)---//
  Widget _buildTaskName() {
    final name = widget.task.mission ?? widget.task.taskName ?? '';
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
        if ((widget.task.code ?? '').isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.supportBtn,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              widget.task.code!,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondaryColor,
              ),
            ),
          ),
          if ((widget.task.projectName ?? '').isNotEmpty)
            const SizedBox(width: 6),
        ],
        if ((widget.task.projectName ?? '').isNotEmpty)
          Flexible(
            child: Text(
              widget.task.projectName!,
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
          _fmt(widget.task.deadline),
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
  Widget _buildDepartmentAssignee() {
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
            widget.task.departmentAssigneeName!,
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

  Widget _buildAssigneer() {
    final assigneerName = widget.task.fullName ?? '';
    if (assigneerName.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        Icon(
          Icons.people_outline,
          size: 13,
          color: AppColors.textTertiaryColor,
        ),
        const SizedBox(width: 5),
        Text(
          'Người giao: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textTertiaryColor,
          ),
        ),
        Expanded(
          child: Text(
            assigneerName,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  //---(_Receiver)---//
  Widget _buildReceiver() {
    final receiverName =
        widget.task.asigneeEmployeeFullName ?? widget.task.assigneeName ?? '';
    if (receiverName.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        Icon(
          Icons.people_outline,
          size: 13,
          color: AppColors.textTertiaryColor,
        ),
        const SizedBox(width: 5),
        Text(
          'Người nhận: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textTertiaryColor,
          ),
        ),
        Expanded(
          child: Text(
            receiverName,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  //---(_Rating)---//
  Widget _buildRating() {
    final rating = widget.task.reviewCompletionRating ?? 0;
    return Row(
      children: [
        Icon(Icons.star_outline, size: 13, color: AppColors.textTertiaryColor),
        const SizedBox(width: 5),
        Text(
          'Đánh giá: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textTertiaryColor,
          ),
        ),
        ...List.generate(5, (index) {
          return Icon(
            index < rating ? Icons.star_rounded : Icons.star_border_rounded,
            size: 16,
            color: AppColors.stateWarningColor,
          );
        }),
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
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
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

//---(_ApprovalButton)---//
class _ApprovalButton extends StatelessWidget {
  const _ApprovalButton({required this.label, required this.color, this.onTap});

  final String label;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.5)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
          ),
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
    final isPending = task.status == 3;
    final isDone = task.status == 2;
    final isActive = isCheckedIn || isDone;

    return GestureDetector(
      onTap: isPending
          ? null
          : () {
              if (task.id == null) return;
              context.read<WeekPlanBloc>().add(
                WeekPlanEvent.checkIn(task.id!, !isCheckedIn),
              );
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: isPending
              ? AppColors.stateWarningColor.withValues(alpha: 0.1)
              : isActive
              ? AppColors.stateSuccessColor.withValues(alpha: 0.1)
              : AppColors.primaryERP,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isPending || isActive
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
              : isPending
              ? 'Pending'
              : isDone
              ? 'Hoàn thành'
              : 'Điểm danh',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isPending
                ? AppColors.stateWarningColor
                : isActive
                ? AppColors.stateSuccessColor
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
