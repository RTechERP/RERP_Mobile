import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/app_colors.dart';
import '../../data/datasource/models/approve_timesheet_model.dart';
import 'approve_timesheet_content_parser.dart';
import 'approve_timesheet_pipeline_status.dart';

/// 1 section = 1 khung việc chứa header (TypeText + count + chọn tất cả nhóm)
/// và danh sách item.
class ApproveTimesheetSection extends StatelessWidget {
  const ApproveTimesheetSection({
    super.key,
    required this.typeText,
    required this.tType,
    required this.count,
    required this.items,
    required this.isGroupAllSelected,
    required this.isGroupSomeSelected,
    required this.selectedIds,
    required this.onToggleGroup,
    required this.onItemTap,
    required this.onItemCheckboxTap,
    this.showSeniorStage = true,
  });

  final String typeText;
  final int tType;
  final int count;
  final List<ApproveTimesheetItem> items;
  final bool isGroupAllSelected;
  final bool isGroupSomeSelected;
  final Set<int> selectedIds;
  final VoidCallback onToggleGroup;
  final bool showSeniorStage;

  /// Tap vào phần thân card (trừ checkbox) — thường dùng để mở chi tiết.
  final void Function(ApproveTimesheetItem item) onItemTap;

  /// Tap vào checkbox của card — thường dùng để toggle chọn.
  final void Function(ApproveTimesheetItem item) onItemCheckboxTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.primaryERP.withValues(alpha: 0.18),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.heading.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SectionHeader(
            typeText: typeText,
            count: count,
            isAllSelected: isGroupAllSelected,
            isSomeSelected: isGroupSomeSelected,
            onToggle: onToggleGroup,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.borderColor,
          ),
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0)
              const Divider(
                height: 1,
                thickness: 1,
                color: AppColors.borderColor,
              ),
            _ItemInSection(
              child: ApproveTimesheetCard(
                item: items[i],
                isSelected: items[i].id != null &&
                    selectedIds.contains(items[i].id),
                showSeniorStage: showSeniorStage,
                onTap: () => onItemTap(items[i]),
                onCheckboxTap: () => onItemCheckboxTap(items[i]),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Bọc card bên trong section: padding để card con tách khỏi header / divider.
class _ItemInSection extends StatelessWidget {
  const _ItemInSection({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.typeText,
    required this.count,
    required this.isAllSelected,
    required this.isSomeSelected,
    required this.onToggle,
  });

  final String typeText;
  final int count;
  final bool isAllSelected;
  final bool isSomeSelected;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
      ),
      child: Row(
        children: [
          _GroupCheckBox(
            isAll: isAllSelected,
            isSome: isSomeSelected,
            onTap: onToggle,
          ),
          const SizedBox(width: 8),
          Container(
            width: 3,
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.primaryERP,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              typeText,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryERP,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupCheckBox extends StatelessWidget {
  const _GroupCheckBox({
    required this.isAll,
    required this.isSome,
    required this.onTap,
  });

  final bool isAll;
  final bool isSome;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final filled = isAll || isSome;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: filled ? AppColors.primaryERP : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: filled
                ? AppColors.primaryERP
                : AppColors.primaryERP.withValues(alpha: 0.4),
            width: 1.5,
          ),
        ),
        child: Center(
          child: isAll
              ? const Icon(Icons.check, size: 16, color: Colors.white)
              : isSome
                  ? Container(
                      width: 10,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

// ====================================================================
// Card
// ====================================================================

/// Card phân khu rõ ràng: header (checkbox + pipeline + tên NV), body (nội dung),
/// footer (lý do + thời gian).
///
/// Tap vào **checkbox** → gọi [onCheckboxTap] (dùng để toggle chọn).
/// Tap vào phần còn lại của card → gọi [onTap] (mặc định mở chi tiết).
class ApproveTimesheetCard extends StatelessWidget {
  const ApproveTimesheetCard({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.onCheckboxTap,
    this.showSeniorStage = true,
  });

  final ApproveTimesheetItem item;
  final bool isSelected;
  final bool showSeniorStage;
  final VoidCallback onTap;
  final VoidCallback onCheckboxTap;

  @override
  Widget build(BuildContext context) {
    final detailLines = ApproveTimesheetContentParser.parse(item.noiDung);
    final reasonTrim = (item.reason ?? '').trim();
    final hasContent = detailLines.isNotEmpty;
    final hasReason = reasonTrim.isNotEmpty;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryERP.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.primaryERP,
              width: 1.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CardHeader(
                item: item,
                isSelected: isSelected,
                onCheckboxTap: onCheckboxTap,
                showSeniorStage: showSeniorStage,
              ),
              if (hasContent) ...[
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.borderColor,
                ),
                _ContentBlock(
                  lines: detailLines,
                  isInvalid: item.isNotValid == 1,
                ),
              ],
              if (hasReason) ...[
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.borderColor,
                ),
                _ReasonBlock(reason: reasonTrim),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ===== Header (checkbox + pipeline + tên NV) =====

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.item,
    required this.isSelected,
    required this.onCheckboxTap,
    required this.showSeniorStage,
  });

  final ApproveTimesheetItem item;
  final bool isSelected;
  final bool showSeniorStage;
  final VoidCallback onCheckboxTap;

  String get _employeeLine {
    final code = (item.code ?? '').trim();
    final name = (item.fullName ?? '').trim();
    if (code.isNotEmpty && name.isNotEmpty) return '$code - $name';
    if (name.isNotEmpty) return name;
    if (code.isNotEmpty) return code;
    if (item.employeeId != null) return 'NV #${item.employeeId}';
    return '—';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _CheckBox(checked: isSelected, onTap: onCheckboxTap),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _employeeLine,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                _Pipeline(item: item, showSeniorStage: showSeniorStage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckBox extends StatelessWidget {
  const _CheckBox({required this.checked, required this.onTap});

  final bool checked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: checked ? AppColors.primaryERP : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: checked
                ? AppColors.primaryERP
                : AppColors.gray.withValues(alpha: 0.6),
            width: 1.5,
          ),
        ),
        child: checked
            ? const Icon(Icons.check, size: 16, color: Colors.white)
            : const SizedBox.shrink(),
      ),
    );
  }
}

// ===== Pipeline =====

class _Pipeline extends StatelessWidget {
  const _Pipeline({
    required this.item,
    this.showSeniorStage = true,
  });

  final ApproveTimesheetItem item;
  final bool showSeniorStage;

  @override
  Widget build(BuildContext context) {
    final stages = ApproveTimesheetStages.fromItem(item);
    if (!showSeniorStage) {
      return Row(
        children: [
          _PipelineStage(
            label: 'HR',
            shortLabel: 'H',
            state: stages.hr,
            statusText: item.statusHRText,
          ),
          _PipelineConnector(approved: stages.hr == ApproveTimesheetStageState.approved),
          _PipelineStage(
            label: 'TBP',
            shortLabel: 'T',
            state: stages.tbp,
            statusText: item.statusText,
          ),
          _PipelineConnector(approved: stages.tbp == ApproveTimesheetStageState.approved),
          _PipelineStage(
            label: 'BGD',
            shortLabel: 'B',
            state: stages.bgd,
            statusText: item.statusBGDText,
          ),
        ],
      );
    }
    return Row(
      children: [
        _PipelineStage(
          label: 'Senior',
          shortLabel: 'S',
          state: stages.senior,
          statusText: item.isSeniorApprovedText,
        ),
        _PipelineConnector(approved: stages.senior == ApproveTimesheetStageState.approved),
        _PipelineStage(
          label: 'HR',
          shortLabel: 'H',
          state: stages.hr,
          statusText: item.statusHRText,
        ),
        _PipelineConnector(approved: stages.hr == ApproveTimesheetStageState.approved),
        _PipelineStage(
          label: 'TBP',
          shortLabel: 'T',
          state: stages.tbp,
          statusText: item.statusText,
        ),
        _PipelineConnector(approved: stages.tbp == ApproveTimesheetStageState.approved),
        _PipelineStage(
          label: 'BGD',
          shortLabel: 'B',
          state: stages.bgd,
          statusText: item.statusBGDText,
        ),
      ],
    );
  }
}

class _PipelineStage extends StatelessWidget {
  const _PipelineStage({
    required this.label,
    required this.shortLabel,
    required this.state,
    required this.statusText,
  });

  final String label;
  final String shortLabel;
  final ApproveTimesheetStageState state;
  final String? statusText;

  bool get isPending => state == ApproveTimesheetStageState.pending;

  Color get _color {
    switch (state) {
      case ApproveTimesheetStageState.approved:
        return AppColors.stateSuccessColor;
      case ApproveTimesheetStageState.declined:
        return AppColors.stateErrorColor;
      case ApproveTimesheetStageState.pending:
        return AppColors.stateWarningColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _color;
    final tooltipMsg = statusText?.trim().isNotEmpty == true
        ? '$label - $statusText'
        : '$label - ${state == ApproveTimesheetStageState.approved ? "Đã duyệt" : state == ApproveTimesheetStageState.declined ? "Không duyệt" : "Chờ duyệt"}';
    return Tooltip(
      message: tooltipMsg,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: isPending
              ? AppColors.stateWarningColor.withValues(alpha: 0.15)
              : color.withValues(alpha: 0.15),
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 1.2),
        ),
        child: Center(
          child: Text(
            shortLabel,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class _PipelineConnector extends StatelessWidget {
  const _PipelineConnector({required this.approved});

  final bool approved;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1.5,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        color: AppColors.gray.withValues(alpha: 0.3),
      ),
    );
  }
}

// ===== Body blocks =====

class _ContentBlock extends StatelessWidget {
  const _ContentBlock({required this.lines, required this.isInvalid});

  final List<ApproveContentLine> lines;
  final bool isInvalid;

  @override
  Widget build(BuildContext context) {
    final bg = isInvalid
        ? const Color(0xFFFFF8E1)
        : Colors.transparent;
    final border = isInvalid
        ? const Color(0xFFE6B800)
        : Colors.transparent;
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border, width: 1),
      ),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isInvalid ? Icons.warning_amber_rounded : Icons.description_outlined,
                size: 13,
                color: isInvalid
                    ? const Color(0xFFB7860B)
                    : AppColors.primaryERP,
              ),
              const SizedBox(width: 5),
              Text(
                isInvalid ? 'Nội dung' : 'Nội dung',
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                  color: isInvalid
                      ? const Color(0xFFB7860B)
                      : AppColors.primaryERP,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          for (var i = 0; i < lines.length; i++) ...[
            if (i > 0) const SizedBox(height: 4),
            _ContentLineText(line: lines[i]),
          ],
        ],
      ),
    );
  }
}

class _ReasonBlock extends StatelessWidget {
  const _ReasonBlock({required this.reason});

  final String reason;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel(icon: Icons.info_outline, text: 'Lý do'),
          const SizedBox(height: 4),
          Text(
            reason,
            style: const TextStyle(
              fontSize: 12.5,
              color: AppColors.heading,
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: AppColors.primaryERP),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
            color: AppColors.primaryERP,
          ),
        ),
      ],
    );
  }
}

class _ContentLineText extends StatelessWidget {
  const _ContentLineText({required this.line});

  final ApproveContentLine line;

  @override
  Widget build(BuildContext context) {
    final text =
        line.label.isEmpty ? line.value : '${line.label}: ${line.value}';
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.5,
        height: 1.4,
        color: line.isHighlighted
            ? ApproveTimesheetContentParser.highlightColor
            : AppColors.heading,
        fontWeight: line.isHighlighted ? FontWeight.w700 : FontWeight.w500,
      ),
    );
  }
}
