import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/approve_timesheet_model.dart';
import '../widgets/approve_timesheet_content_parser.dart';
import '../widgets/approve_timesheet_file_attachment.dart';
import '../widgets/approve_timesheet_pipeline_status.dart';

/// Màn hình chi tiết phiếu duyệt timesheet.
///
/// Hiển thị đầy đủ thông tin từ [ApproveTimesheetItem]:
/// - Pipeline 4 giai đoạn (Senior → HR → TBP → BGD).
/// - Thông tin phiếu (Mã phiếu, nhân viên, ngày tạo).
/// - Nội dung (parse từ HTML).
/// - Lý do.
/// - Đánh giá, lý do HR sửa, lý do không duyệt.
/// - File bổ sung + check-in / check-out.
class ApproveTimesheetDetailScreen extends StatelessWidget {
  const ApproveTimesheetDetailScreen({super.key, required this.item});

  final ApproveTimesheetItem item;

  @override
  Widget build(BuildContext context) {
    final detailLines = ApproveTimesheetContentParser.parse(item.noiDung);

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(
          item.typeText?.isNotEmpty == true ? item.typeText! : 'Chi tiết phiếu',
          style: AppStyles.headingTitle2,
        ),
        onBackTap: () => onBack(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PipelineCard(item: item),
            const SizedBox(height: 16),
            _EmployeeCard(item: item),
            const SizedBox(height: 16),
            if (detailLines.isNotEmpty) _ContentCard(lines: detailLines),
            if (detailLines.isNotEmpty) const SizedBox(height: 16),
            if ((item.reason ?? '').trim().isNotEmpty)
              _ReasonCard(reason: item.reason!),
            if ((item.reason ?? '').trim().isNotEmpty) const SizedBox(height: 16),
            if ((item.evaluateResults ?? '').trim().isNotEmpty)
              _InfoCard(
                icon: Icons.star_outline,
                iconColor: AppColors.orangeA500,
                title: 'Đánh giá công việc',
                body: item.evaluateResults!,
              ),
            if ((item.evaluateResults ?? '').trim().isNotEmpty)
              const SizedBox(height: 16),
            if ((item.reasonHREdit ?? '').trim().isNotEmpty)
              _InfoCard(
                icon: Icons.edit_note,
                iconColor: AppColors.orangeA500,
                title: 'Lý do HR sửa',
                body: item.reasonHREdit!,
              ),
            if ((item.reasonHREdit ?? '').trim().isNotEmpty)
              const SizedBox(height: 16),
            if ((item.reasonDeciline ?? '').trim().isNotEmpty)
              _InfoCard(
                icon: Icons.cancel_outlined,
                iconColor: AppColors.stateErrorColor,
                title: item.decilineApproveSenior == 1
                    ? 'Lý do Senior không duyệt'
                    : 'Lý do không duyệt',
                body: item.reasonDeciline!,
              ),
            if ((item.reasonDeciline ?? '').trim().isNotEmpty)
              const SizedBox(height: 16),
            if (item.checkIn != null || item.checkOut != null)
              _CheckTimeCard(checkIn: item.checkIn, checkOut: item.checkOut),
            if (item.checkIn != null || item.checkOut != null)
              const SizedBox(height: 16),
            if (_hasFile)
              ApproveTimesheetFileAttachment(
                fileName: item.fileName!,
                filePath: item.filePath!,
              ),
          ],
        ),
      ),
    );
  }

  bool get _hasFile =>
      (item.fileName?.isNotEmpty ?? false) &&
      (item.filePath?.isNotEmpty ?? false);
}

// ===== Header cards =====

class _PipelineCard extends StatelessWidget {
  const _PipelineCard({required this.item});

  final ApproveTimesheetItem item;

  @override
  Widget build(BuildContext context) {
    return FormCard(
      title: 'Quy trình duyệt',
      child: _Pipeline(item: item),
    );
  }
}

class _EmployeeCard extends StatelessWidget {
  const _EmployeeCard({required this.item});

  final ApproveTimesheetItem item;

  String _formatDate(DateTime? d) {
    if (d == null) return '—';
    return DateFormat('dd/MM/yyyy').format(d);
  }

  @override
  Widget build(BuildContext context) {
    final code = (item.code ?? '').trim();
    final fullName = (item.fullName ?? '').trim();
    final header = code.isNotEmpty
        ? '$code - ${fullName.isEmpty ? '—' : fullName}'
        : (fullName.isEmpty ? '—' : fullName);

    return FormCard(
      title: 'Thông tin phiếu',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _InfoRow(
            icon: Icons.badge_outlined,
            label: 'Mã phiếu',
            value: code.isEmpty ? '—' : code,
          ),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.person_outline,
            label: 'Nhân viên',
            value: header,
          ),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Ngày tạo',
            value: _formatDate(item.ngayDangKy),
          ),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.checklist_outlined,
            label: 'Loại phiếu',
            value: (item.typeText ?? '').trim().isEmpty
                ? '—'
                : item.typeText!.trim(),
          ),
        ],
      ),
    );
  }
}

// ===== Content / reason =====

class _ContentCard extends StatelessWidget {
  const _ContentCard({required this.lines});

  final List<ApproveContentLine> lines;

  @override
  Widget build(BuildContext context) {
    return FormCard(
      title: 'Nội dung',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < lines.length; i++) ...[
            if (i > 0) const SizedBox(height: 6),
            _ContentLineText(line: lines[i]),
          ],
        ],
      ),
    );
  }
}

class _ReasonCard extends StatelessWidget {
  const _ReasonCard({required this.reason});

  final String reason;

  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      icon: Icons.info_outline,
      iconColor: AppColors.primaryERP,
      title: 'Lý do',
      body: reason,
    );
  }
}

// ===== Check in/out =====

class _CheckTimeCard extends StatelessWidget {
  const _CheckTimeCard({this.checkIn, this.checkOut});

  final String? checkIn;
  final String? checkOut;

  @override
  Widget build(BuildContext context) {
    return FormCard(
      title: 'Check-in / Check-out',
      child: Row(
        children: [
          Expanded(
            child: _CheckTimeCol(
              icon: Icons.login,
              label: 'Check-in',
              value: checkIn ?? '--:--',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _CheckTimeCol(
              icon: Icons.logout,
              label: 'Check-out',
              value: checkOut ?? '--:--',
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckTimeCol extends StatelessWidget {
  const _CheckTimeCol({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.primaryERP),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: AppColors.textTertiaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

// ===== Generic info card =====

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return FormCard(
      title: title,
      actions: [
        Icon(icon, size: 18, color: iconColor),
      ],
      child: Text(
        body,
        style: const TextStyle(
          fontSize: 14,
          height: 1.4,
          color: AppColors.heading,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.gray),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.heading,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ===== Pipeline =====

class _Pipeline extends StatelessWidget {
  const _Pipeline({required this.item});

  final ApproveTimesheetItem item;

  @override
  Widget build(BuildContext context) {
    final stages = ApproveTimesheetStages.fromItem(item);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        children: [
          Row(
            children: [
              _Stage(label: 'Senior', state: stages.senior),
              _Connector(approved: stages.senior == ApproveTimesheetStageState.approved),
              _Stage(label: 'HR', state: stages.hr),
              _Connector(approved: stages.hr == ApproveTimesheetStageState.approved),
              _Stage(label: 'TBP', state: stages.tbp),
              _Connector(approved: stages.tbp == ApproveTimesheetStageState.approved),
              _Stage(label: 'BGD', state: stages.bgd),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stage extends StatelessWidget {
  const _Stage({required this.label, required this.state});

  final String label;
  final ApproveTimesheetStageState state;

  bool get isApproved => state == ApproveTimesheetStageState.approved;
  bool get isDeclined => state == ApproveTimesheetStageState.declined;
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isPending
                ? AppColors.stateWarningColor.withValues(alpha: 0.1)
                : _color.withValues(alpha: 0.15),
            shape: BoxShape.circle,
            border: Border.all(color: _color, width: 1.5),
          ),
          child: Center(
            child: isApproved
                ? Icon(Icons.check, size: 16, color: _color)
                : isDeclined
                    ? Icon(Icons.close, size: 16, color: _color)
                    : Text(
                        label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: _color,
                        ),
                      ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: _color,
          ),
        ),
      ],
    );
  }
}

class _Connector extends StatelessWidget {
  const _Connector({required this.approved});

  final bool approved;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        color: AppColors.textTertiaryColor.withValues(alpha: 0.3),
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({required this.item, required this.stages});

  final ApproveTimesheetItem item;
  final ApproveTimesheetStages stages;

  String? _readStatusText(String? text) {
    final t = (text ?? '').trim();
    if (t.isEmpty) return null;
    if (t == '0' || t == '-1') return null;
    return t;
  }

  Color _color(ApproveTimesheetStageState state) {
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
    final entries = <(String, String, ApproveTimesheetStageState)>[];
    final senior = _readStatusText(item.isSeniorApprovedText);
    if (senior != null) {
      entries.add(('Senior', senior, stages.senior));
    }
    final hr = _readStatusText(item.statusHRText);
    if (hr != null) {
      entries.add(('HR', hr, stages.hr));
    }
    final bgd = _readStatusText(item.statusBGDText);
    if (bgd != null) {
      entries.add(('BGD', bgd, stages.bgd));
    }
    final tp = (item.statusText ?? '').trim();
    if (tp.isNotEmpty && tp != '0' && tp != '-1') {
      entries.add(('TBP', tp, stages.tbp));
    }

    if (entries.isEmpty) {
      return const Text(
        'Chưa có thông tin duyệt.',
        style: TextStyle(
          fontSize: 12,
          color: AppColors.textTertiaryColor,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: [
        for (final e in entries)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(6),
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 11.5),
                children: [
                  TextSpan(
                    text: '${e.$1}: ',
                    style: const TextStyle(
                      color: AppColors.textTertiaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: e.$2,
                    style: TextStyle(
                      color: _color(e.$3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// ===== Content line (highlighted) =====

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
        fontSize: 13.5,
        height: 1.4,
        color: line.isHighlighted
            ? ApproveTimesheetContentParser.highlightColor
            : AppColors.heading,
        fontWeight: line.isHighlighted ? FontWeight.w700 : FontWeight.w500,
      ),
    );
  }
}
