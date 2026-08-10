import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/bloc_status.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/approve_timesheet_model.dart';
import '../bloc/approve_timesheet_bloc.dart';
import '../widgets/approve_timesheet_content_parser.dart';
import '../widgets/approve_timesheet_file_attachment.dart';
import '../widgets/approve_timesheet_pipeline_status.dart';

/// Màn hình chi tiết phiếu duyệt timesheet.
///
/// Hiển thị đầy đủ thông tin từ [ApproveTimesheetItem] và cho phép duyệt /
/// huỷ duyệt / từ chối ngay tại chỗ (không cần back ra list rồi mới chọn
/// hàng loạt).
///
/// Flow duyệt (Senior hay TBP) lấy theo `bloc.state.role` — chi tiết màn
/// này dùng chung cho cả hai luồng (route detail của Senior và TBP cùng trỏ
/// về screen này, bloc cũng nằm chung ở ShellRoute cha).
class ApproveTimesheetDetailScreen extends StatefulWidget {
  const ApproveTimesheetDetailScreen({super.key, required this.item});

  final ApproveTimesheetItem item;

  @override
  State<ApproveTimesheetDetailScreen> createState() =>
      _ApproveTimesheetDetailScreenState();
}

class _ApproveTimesheetDetailScreenState
    extends State<ApproveTimesheetDetailScreen> {
  /// `true` sau khi user dispatch Approve/Unapprove/Decline — dùng để
  /// biết khi nào status thay đổi là kết quả action của mình (để pop về
  /// list) thay vì từ init/refresh khác.
  bool _awaitingResult = false;

  ApproveTimesheetBloc get _bloc => context.read<ApproveTimesheetBloc>();

  /// Flow duyệt đang dùng: lấy từ bloc state để quyết định event Senior/TBP.
  ApproveTimesheetRole get _role => _bloc.state.role;

  /// Phiếu đã được duyệt cấp hiện tại chưa (để disable nút "Duyệt").
  bool get _isAlreadyApproved {
    if (_role == ApproveTimesheetRole.senior) {
      return (widget.item.isSeniorApproved ?? 0) == 1;
    }
    return (widget.item.isApprovedTP ?? 0) == 1;
  }

  /// Phiếu chưa duyệt cấp hiện tại (để disable nút "Huỷ duyệt").
  bool get _isNotYetApproved => !_isAlreadyApproved;

  Future<void> _onApprove() async {
    final confirmed = await DialogService.showConfirmSeniorApprove(
      context: context,
      count: 1,
      isApproved: true,
    );
    if (!confirmed) return;
    if (!mounted) return;
    setState(() => _awaitingResult = true);
    _role == ApproveTimesheetRole.tbp
        ? _bloc.add(const ApproveTimesheetEvent.tbpApprove())
        : _bloc.add(const ApproveTimesheetEvent.seniorApprove());
  }

  Future<void> _onUnapprove() async {
    final confirmed = await DialogService.showConfirmSeniorApprove(
      context: context,
      count: 1,
      isApproved: false,
    );
    if (!confirmed) return;
    if (!mounted) return;
    setState(() => _awaitingResult = true);
    _role == ApproveTimesheetRole.tbp
        ? _bloc.add(const ApproveTimesheetEvent.tbpUnapprove())
        : _bloc.add(const ApproveTimesheetEvent.seniorUnapprove());
  }

  Future<void> _onDecline() async {
    final reason = _role == ApproveTimesheetRole.tbp
        ? await DialogService.showTBPDeclineReason(context: context, count: 1)
        : await DialogService.showSeniorDeclineReason(
            context: context,
            count: 1,
          );
    if (reason == null || reason.trim().isEmpty) return;
    if (!mounted) return;
    setState(() => _awaitingResult = true);
    _role == ApproveTimesheetRole.tbp
        ? _bloc.add(ApproveTimesheetEvent.tbpDecline(reason.trim()))
        : _bloc.add(ApproveTimesheetEvent.seniorDecline(reason.trim()));
  }

  /// Lắng nghe status bloc: sau khi dispatch, success → pop, failed → toast.
  void _onBlocChange(BuildContext context, ApproveTimesheetState state) {
    if (!_awaitingResult) return;
    if (state.status == BaseStateStatus.success) {
      setState(() => _awaitingResult = false);
      // Dùng rootNavigator để pop đúng route detail (tránh trường hợp có
      // dialog/inner navigator).
      if (mounted) {
        DialogService.showMessage(
          context: context,
          message: 'Thao tác thành công',
        );
        context.pop();
      }
    } else if (state.status == BaseStateStatus.failed) {
      setState(() => _awaitingResult = false);
      if (mounted && (state.message ?? '').isNotEmpty) {
        DialogService.showToastFailed(
          context: context,
          mess: state.message!,
        );
      }
    }
  }

  /// Phiếu phải được thêm vào selection trước khi gọi event approve — bloc
  /// đọc `state.selectedItems` để biết duyệt cái nào.
  ///
  /// Ở màn detail không có selection bar, nên ta chọn sẵn id của phiếu
  /// đang xem (nếu chưa có trong selection).
  void _ensureItemSelected() {
    final id = widget.item.id;
    if (id == null) return;
    if (!_bloc.state.selectedIds.contains(id)) {
      _bloc.add(ApproveTimesheetEvent.toggleSelection(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailLines = ApproveTimesheetContentParser.parse(widget.item.noiDung);

    return BlocListener<ApproveTimesheetBloc, ApproveTimesheetState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.message != curr.message,
      listener: _onBlocChange,
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: Text(
            widget.item.typeText?.isNotEmpty == true
                ? widget.item.typeText!
                : 'Chi tiết phiếu',
            style: AppStyles.headingTitle2,
          ),
          onBackTap: () => onBack(context),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _PipelineCard(item: widget.item),
                    const SizedBox(height: 16),
                    _EmployeeCard(item: widget.item),
                    const SizedBox(height: 16),
                    if (detailLines.isNotEmpty) _ContentCard(lines: detailLines),
                    if (detailLines.isNotEmpty) const SizedBox(height: 16),
                    if ((widget.item.reason ?? '').trim().isNotEmpty)
                      _ReasonCard(reason: widget.item.reason!),
                    if ((widget.item.reason ?? '').trim().isNotEmpty)
                      const SizedBox(height: 16),
                    if ((widget.item.evaluateResults ?? '').trim().isNotEmpty)
                      _InfoCard(
                        icon: Icons.star_outline,
                        iconColor: AppColors.orangeA500,
                        title: 'Đánh giá công việc',
                        body: widget.item.evaluateResults!,
                      ),
                    if ((widget.item.evaluateResults ?? '').trim().isNotEmpty)
                      const SizedBox(height: 16),
                    if ((widget.item.reasonHREdit ?? '').trim().isNotEmpty)
                      _InfoCard(
                        icon: Icons.edit_note,
                        iconColor: AppColors.orangeA500,
                        title: 'Lý do HR sửa',
                        body: widget.item.reasonHREdit!,
                      ),
                    if ((widget.item.reasonHREdit ?? '').trim().isNotEmpty)
                      const SizedBox(height: 16),
                    if ((widget.item.reasonDeciline ?? '').trim().isNotEmpty)
                      _InfoCard(
                        icon: Icons.cancel_outlined,
                        iconColor: AppColors.stateErrorColor,
                        title: widget.item.decilineApproveSenior == 1
                            ? 'Lý do Senior không duyệt'
                            : 'Lý do không duyệt',
                        body: widget.item.reasonDeciline!,
                      ),
                    if ((widget.item.reasonDeciline ?? '').trim().isNotEmpty)
                      const SizedBox(height: 16),
                    if (widget.item.checkIn != null || widget.item.checkOut != null)
                      _CheckTimeCard(
                        checkIn: widget.item.checkIn,
                        checkOut: widget.item.checkOut,
                      ),
                    if (widget.item.checkIn != null || widget.item.checkOut != null)
                      const SizedBox(height: 16),
                    if (_hasFile)
                      ApproveTimesheetFileAttachment(
                        fileName: widget.item.fileName!,
                        filePath: widget.item.filePath!,
                      ),
                  ],
                ),
              ),
            ),
            BlocBuilder<ApproveTimesheetBloc, ApproveTimesheetState>(
              buildWhen: (p, n) =>
                  p.isSeniorApproving != n.isSeniorApproving ||
                  p.isTbpApproving != n.isTbpApproving,
              builder: (context, state) {
                final isProcessing = _role == ApproveTimesheetRole.tbp
                    ? state.isTbpApproving
                    : state.isSeniorApproving;
                return _ActionBar(
                  isProcessing: isProcessing,
                  canApprove: _isNotYetApproved,
                  canUnapprove: _isAlreadyApproved,
                  onApprove: () {
                    _ensureItemSelected();
                    _onApprove();
                  },
                  onUnapprove: () {
                    _ensureItemSelected();
                    _onUnapprove();
                  },
                  onDecline: () {
                    _ensureItemSelected();
                    _onDecline();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool get _hasFile =>
      (widget.item.fileName?.isNotEmpty ?? false) &&
      (widget.item.filePath?.isNotEmpty ?? false);
}

// ===== Action bar =====

/// Thanh action cố định ở dưới cùng cho phép duyệt / huỷ duyệt / từ chối
/// phiếu đang xem.
class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.isProcessing,
    required this.canApprove,
    required this.canUnapprove,
    required this.onApprove,
    required this.onUnapprove,
    required this.onDecline,
  });

  final bool isProcessing;
  final bool canApprove;
  final bool canUnapprove;
  final VoidCallback onApprove;
  final VoidCallback onUnapprove;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        12,
        8,
        12,
        8 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: isProcessing ? null : onDecline,
              icon: const Icon(Icons.cancel_outlined, size: 18),
              label: const Text('Từ chối'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.stateErrorColor,
                side: const BorderSide(color: AppColors.stateErrorColor),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: (isProcessing || !canUnapprove) ? null : onUnapprove,
              icon: const Icon(Icons.undo, size: 18),
              label: const Text('Huỷ duyệt'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.stateWarningColor,
                side: const BorderSide(color: AppColors.stateWarningColor),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: (isProcessing || !canApprove) ? null : onApprove,
              icon: isProcessing
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.check, size: 18),
              label: const Text('Duyệt'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.stateSuccessColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
          // Loại phiếu đẩy lên đầu, làm header nổi bật cho người duyệt.
          _InfoRow(
            icon: Icons.checklist_outlined,
            label: 'Loại phiếu',
            value: (item.typeText ?? '').trim().isEmpty
                ? '—'
                : item.typeText!.trim(),
            valueStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.primaryERP,
              fontWeight: FontWeight.w700,
            ),
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
          // Mã phiếu đã được lược bỏ khỏi UI theo yêu cầu.
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
    this.valueStyle,
  });

  final IconData icon;
  final String label;
  final String value;
  final TextStyle? valueStyle;

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
                style: valueStyle ??
                    const TextStyle(
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
