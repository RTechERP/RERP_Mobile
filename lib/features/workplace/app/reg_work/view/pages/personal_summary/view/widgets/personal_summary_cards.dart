// 7 card widget cho các tab của Personal Summary.
// Mỗi card là một StatelessWidget nhận item tương ứng và hiển thị theo spec UI.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/extensions/number_extension.dart';
import '../../data/datasource/models/personal_summary_model.dart';
import 'personal_summary_card_parts.dart';

final _dateFmt = DateFormat('dd/MM/yyyy');
final _dateTimeFmt = DateFormat('dd/MM/yyyy - HH:mm');
final _timeFmt = DateFormat('HH:mm');

// ════════════════════════════════════════════════════════════════════════════
// 1. Đăng ký nghỉ (Leave)
// ════════════════════════════════════════════════════════════════════════════

/// Card cho tab "Đăng ký nghỉ".
/// Hiển thị: TBP+HR chip - Người xin nghỉ - Trưởng BP - (Nhân sự nếu có) -
/// Loại nghỉ - Thời gian nghỉ - Bắt đầu - Kết thúc -
/// Lý do - Lý do không duyệt - Lý do huỷ - Ngày huỷ.
class PersonalLeaveCard extends StatelessWidget {
  const PersonalLeaveCard({super.key, required this.item});
  final PersonalLeaveItem item;

  ApprovalStatus _tbpStatus() => mapStatusFromInt(
        item.statusTbp,
        item.statusTbpText,
      );

  ApprovalStatus _hrStatus() => mapStatusFromInt(
        item.statusHr,
        item.statusHrText,
      );

  String _dateText(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final tbp = _tbpStatus();
    final hr = _hrStatus();
    final hrName = _nonEmpty(item.employeeHr);

    return GlassCardShell(
      badges: [
        ApprovalBadge(role: 'TBP', status: tbp),
        ApprovalBadge(role: 'HR', status: hr),
      ],
      chips: [
        SummaryTypeChip(
          label: 'Loại nghỉ',
          value: item.typeIsRealText ?? item.typeText ?? '—',
          color: AppColors.blueMain,
          icon: Icons.category_outlined,
        ),
        SummaryTypeChip(
          label: 'Thời gian nghỉ',
          value: item.timeOnLeaveText ?? '—',
          color: AppColors.orangeA500,
          icon: Icons.schedule_outlined,
        ),
      ],
      children: [
        InfoRow(
          icon: Icons.person_outline,
          label: 'Người xin nghỉ',
          value: item.employeeLeave ?? '—',
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.supervisor_account_outlined,
          label: 'Trưởng BP',
          value: _nonEmpty(item.employeeTp) ?? '—',
          indentTop: true,
        ),
        if (hrName != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.badge_outlined,
            label: 'Nhân sự',
            value: hrName,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRowRange(
          icon: Icons.event_outlined,
          startLabel: 'Bắt đầu',
          startValue: _dateText(item.startDate),
          endLabel: 'Kết thúc',
          endValue: _dateText(item.endDate),
          indentTop: true,
        ),
        if (_nonEmpty(item.reason) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.notes_outlined,
            label: 'Lý do nghỉ',
            value: item.reason!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.reasonDeciline) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.block_outlined,
            label: 'Lý do không duyệt',
            value: item.reasonDeciline!,
            valueColor: AppColors.redA500,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.reasonCancel) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.do_not_disturb_on_outlined,
            label: 'Lý do huỷ',
            value: item.reasonCancel!,
            valueColor: AppColors.orangeA500,
            indentTop: true,
          ),
        ],
        if (item.dateCancel != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Ngày huỷ',
            value: _dateTimeFmt.format(item.dateCancel!.toLocal()),
            indentTop: true,
          ),
        ],
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// 2. Đi muộn / về sớm (EarlyLate)
// ════════════════════════════════════════════════════════════════════════════

/// Card cho tab "Đi muộn về sớm".
/// Hiển thị: TBP+HR chip - Họ tên - Trưởng BP - (Nhân sự nếu có) -
/// Loại - Ngày đăng ký - Bắt đầu - Kết thúc - Tổng thời gian (phút) -
/// Lý do - Lý do không duyệt.
class PersonalEarlyLateCard extends StatelessWidget {
  const PersonalEarlyLateCard({super.key, required this.item});
  final PersonalEarlyLateItem item;

  ApprovalStatus _tbpStatus() => mapStatusFromInt(
        item.statusTbp,
        item.statusTbpText,
      );

  ApprovalStatus _hrStatus() => mapStatusFromInt(
        item.statusHr,
        item.statusHrText,
      );

  /// Chỉ hiển thị phần ngày (dd/MM/yyyy), bỏ giờ.
  String _dateOnlyText(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  /// Hiển thị ngày + giờ (dd/MM/yyyy HH:mm).
  String _dateTimeText(DateTime? d) {
    if (d == null) return '--/--/---- --:--';
    return _dateTimeFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final hrName = _nonEmpty(item.employeeApprovedHr);
    return GlassCardShell(
      badges: [
        ApprovalBadge(role: 'TBP', status: _tbpStatus()),
        ApprovalBadge(role: 'HR', status: _hrStatus()),
      ],
      chips: [
        SummaryTypeChip(
          label: 'Loại',
          value: item.typeText ?? '—',
          color: AppColors.purpleA500,
          icon: Icons.label_outline,
        ),
        SummaryTypeChip(
          label: 'Tổng (${item.unitText ?? 'phút'})',
          value: item.timeRegister != null
              ? item.timeRegister!.toStringAsFixed(0)
              : '—',
          color: AppColors.tealA400,
          icon: Icons.timer_outlined,
        ),
      ],
      children: [
        InfoRow(
          icon: Icons.person_outline,
          label: 'Họ tên',
          value: item.employeeEarlyLate ?? '—',
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.supervisor_account_outlined,
          label: 'Trưởng BP',
          value: _nonEmpty(item.employeeApprovedTp) ?? '—',
          indentTop: true,
        ),
        if (hrName != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.badge_outlined,
            label: 'Nhân sự',
            value: hrName,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Ngày đăng ký',
          value: _dateOnlyText(item.dateRegister),
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.play_circle_outline,
          label: 'Bắt đầu',
          value: _dateTimeText(item.dateStart),
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.stop_circle_outlined,
          label: 'Kết thúc',
          value: _dateTimeText(item.dateEnd),
          indentTop: true,
        ),
        if (_nonEmpty(item.reason) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.notes_outlined,
            label: 'Lý do',
            value: item.reason!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.reasonDeciline) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.block_outlined,
            label: 'Lý do không duyệt',
            value: item.reasonDeciline!,
            valueColor: AppColors.redA500,
            indentTop: true,
          ),
        ],
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// 3. Làm thêm (OverTime)
// ════════════════════════════════════════════════════════════════════════════

/// Card cho tab "Làm thêm".
/// Hiển thị: TBP+HR chip - chip Loại - chip Số giờ -
/// Họ tên - Trưởng BP - (Nhân sự nếu có) - Ngày -
/// Bắt đầu - Kết thúc - Dự án - Địa điểm - Lý do -
/// Lý do không duyệt - Ăn tối.
class PersonalOverTimeCard extends StatelessWidget {
  const PersonalOverTimeCard({super.key, required this.item});
  final PersonalOverTimeItem item;

  ApprovalStatus _tbpStatus() => mapStatusFromInt(
        item.statusTbp,
        item.statusTbpText,
      );

  ApprovalStatus _hrStatus() => mapStatusFromInt(
        item.statusHr,
        item.statusHrText,
      );

  String _dateText(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  String _timeText(DateTime? d) {
    if (d == null) return '--:--';
    return _timeFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final hasDinner = item.overnight == true;
    final hrName = _nonEmpty(item.approvedHr);
    return GlassCardShell(
      badges: [
        ApprovalBadge(role: 'TBP', status: _tbpStatus()),
        ApprovalBadge(role: 'HR', status: _hrStatus()),
      ],
      chips: [
        SummaryTypeChip(
          label: 'Loại',
          value: item.typeName ?? '—',
          color: AppColors.blueMain,
          icon: Icons.category_outlined,
        ),
        SummaryTypeChip(
          label: 'Số giờ',
          value: item.timeReality != null
              ? item.timeReality!.toStringAsFixed(2)
              : '—',
          color: AppColors.orangeA500,
          icon: Icons.schedule_outlined,
        ),
      ],
      children: [
        InfoRow(
          icon: Icons.person_outline,
          label: 'Họ tên',
          value: item.employeeFullName ?? '—',
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.supervisor_account_outlined,
          label: 'Trưởng BP',
          value: _nonEmpty(item.approvedTbp) ?? '—',
          indentTop: true,
        ),
        if (hrName != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.badge_outlined,
            label: 'Nhân sự',
            value: hrName,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Ngày',
          value: _dateText(item.dateRegister),
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRowRange(
          icon: Icons.event_outlined,
          startLabel: 'Bắt đầu',
          startValue: _timeText(item.timeStart),
          endLabel: 'Kết thúc',
          endValue: _timeText(item.endTime),
          indentTop: true,
        ),
        if (_nonEmpty(item.projectName) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.work_outline,
            label: 'Dự án',
            value: item.projectName!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.locationText) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Địa điểm',
            value: item.locationText!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.reason) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.notes_outlined,
            label: 'Lý do',
            value: item.reason!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.reasonDeciline) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.block_outlined,
            label: 'Lý do không duyệt',
            value: item.reasonDeciline!,
            valueColor: AppColors.redA500,
            indentTop: true,
          ),
        ],
        if (hasDinner) ...[
          const SizedBox(height: 8),
          _DinnerBadge(),
        ],
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// 4. Công tác (Bussiness)
// ════════════════════════════════════════════════════════════════════════════

/// Card cho tab "Công tác".
/// Hiển thị: TBP+HR chip - Họ tên - Trưởng BP - (Nhân sự nếu có) - Ngày -
/// Địa điểm - Loại - Phí công tác - Phương tiện - Ăn tối -
/// Xuất phát trước 7h15 - Chấm công - Lý do không duyệt - Ghi chú - Ngày tạo - Tổng chi phí.
class PersonalBussinessCard extends StatelessWidget {
  const PersonalBussinessCard({super.key, required this.item});
  final PersonalBussinessItem item;

  ApprovalStatus _tbpStatus() => mapStatusFromInt(
        item.statusTbp,
        item.statusTbpText,
      );

  ApprovalStatus _hrStatus() => mapStatusFromInt(
        item.statusHr,
        item.statusHrText,
      );

  String _dateText(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final hasDinner = item.overnight == true;
    final createdDate = item.createdDate != null
        ? _dateTimeFmt.format(item.createdDate!.toLocal())
        : null;
    final hrName = _nonEmpty(item.approvedHr);
    final workEarly = (item.costWorkEarly ?? 0) > 0;
    return GlassCardShell(
      badges: [
        ApprovalBadge(role: 'TBP', status: _tbpStatus()),
        ApprovalBadge(role: 'HR', status: _hrStatus()),
      ],
      chips: [
        SummaryTypeChip(
          label: 'Loại',
          value: item.typeName ?? '—',
          color: AppColors.blueMain,
          icon: Icons.category_outlined,
        ),
        SummaryTypeChip(
          label: 'Phí công tác',
          value: '${(item.costType ?? 0).toInt().formatVND} đ',
          color: AppColors.orangeA500,
          icon: Icons.attach_money_outlined,
        ),
      ],
      chipsColumn: true,
      children: [
        InfoRow(
          icon: Icons.person_outline,
          label: 'Họ tên',
          value: item.employeeName ?? '—',
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.supervisor_account_outlined,
          label: 'Trưởng BP',
          value: _nonEmpty(item.approvedName) ?? '—',
          indentTop: true,
        ),
        if (hrName != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.badge_outlined,
            label: 'Nhân sự',
            value: hrName,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Ngày',
          value: _dateText(item.dayBussiness),
          indentTop: true,
        ),
        if (_nonEmpty(item.location) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Địa điểm',
            value: item.location!,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.directions_car_outlined,
          label: 'Phương tiện',
          value: '${(item.costVehicle ?? 0).toInt().formatVND} đ'
              ' • ${item.vehicleName ?? '—'}',
          indentTop: true,
        ),
        if (hasDinner) ...[
          const SizedBox(height: 8),
          _DinnerBadge(),
        ],
        const SizedBox(height: 8),
        InfoRowCheck(
          icon: Icons.alarm_on_outlined,
          label: 'Xuất phát trước 7h15',
          checked: workEarly,
          checkedText: workEarly
              ? '${item.costWorkEarly!.toInt().formatVND} đ'
              : 'Có',
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.fingerprint_outlined,
          label: 'Chấm công',
          value: item.notChekInText ??
              (item.notChekIn == true ? 'Không chấm công' : 'Có chấm công'),
          indentTop: true,
        ),
        if (_nonEmpty(item.reasonDeciline) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.block_outlined,
            label: 'Lý do không duyệt',
            value: item.reasonDeciline!,
            valueColor: AppColors.redA500,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.note) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.edit_note_outlined,
            label: 'Ghi chú',
            value: item.note!,
            indentTop: true,
          ),
        ],
        if (createdDate != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.history_outlined,
            label: 'Ngày tạo',
            value: createdDate,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.calculate_outlined,
          label: 'Tổng chi phí',
          value: '${(item.totalMoney ?? 0).toInt().formatVND} đ',
          isBold: true,
          valueColor: AppColors.primaryERP,
          indentTop: true,
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// 5. Làm việc tại nhà (WFH)
// ════════════════════════════════════════════════════════════════════════════

/// Card cho tab "Làm việc ở nhà".
/// Hiển thị: TBP+HR chip - Họ tên - Người duyệt - (Nhân sự nếu có) - Ngày -
/// Khoảng thời gian - Lý do - Lý do không duyệt - Ghi chú.
class PersonalWfhCard extends StatelessWidget {
  const PersonalWfhCard({super.key, required this.item});
  final PersonalWfhItem item;

  ApprovalStatus _tbpStatus() => mapStatusFromInt(
        item.statusTbp,
        item.statusTbpText,
      );

  ApprovalStatus _hrStatus() => mapStatusFromInt(
        item.statusHr,
        item.statusHrText,
      );

  String _dateText(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final hrName = _nonEmpty(item.approvedHr);
    return GlassCardShell(
      badges: [
        ApprovalBadge(role: 'TBP', status: _tbpStatus()),
        ApprovalBadge(role: 'HR', status: _hrStatus()),
      ],
      chips: [
        SummaryTypeChip(
          label: 'Khoảng thời gian',
          value: item.timeWfhText ?? '—',
          color: AppColors.blueMain,
          icon: Icons.schedule_outlined,
        ),
      ],
      children: [
        InfoRow(
          icon: Icons.person_outline,
          label: 'Họ tên',
          value: item.employeeName ?? '—',
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.supervisor_account_outlined,
          label: 'Người duyệt',
          value: _nonEmpty(item.approvedName) ?? '—',
          indentTop: true,
        ),
        if (hrName != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.badge_outlined,
            label: 'Nhân sự',
            value: hrName,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Ngày',
          value: _dateText(item.dateWfh),
          indentTop: true,
        ),
        if (_nonEmpty(item.reason) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.notes_outlined,
            label: 'Lý do',
            value: item.reason!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.reasonDeciline) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.block_outlined,
            label: 'Lý do không duyệt',
            value: item.reasonDeciline!,
            valueColor: AppColors.redA500,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.note) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.edit_note_outlined,
            label: 'Ghi chú',
            value: item.note!,
            indentTop: true,
          ),
        ],
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// 6. Quên chấm công (ENF)
// ════════════════════════════════════════════════════════════════════════════

/// Card cho tab "Quên chấm công".
/// Hiển thị: TBP+HR chip - Họ tên - Trưởng BP - (Nhân sự nếu có) - Ngày -
/// Loại - Ghi chú - Lý do không duyệt.
class PersonalEnfCard extends StatelessWidget {
  const PersonalEnfCard({super.key, required this.item});
  final PersonalEnfItem item;

  ApprovalStatus _tbpStatus() => mapStatusFromInt(
        item.statusTbp,
        item.statusTbpText,
      );

  ApprovalStatus _hrStatus() => mapStatusFromInt(
        item.statusHr,
        item.statusHrText,
      );

  String _dateText(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final hrName = _nonEmpty(item.approvedHrName);
    return GlassCardShell(
      badges: [
        ApprovalBadge(role: 'TBP', status: _tbpStatus()),
        ApprovalBadge(role: 'HR', status: _hrStatus()),
      ],
      chips: [
        SummaryTypeChip(
          label: 'Loại',
          value: item.typeText ?? '—',
          color: AppColors.purpleA500,
          icon: Icons.label_outline,
        ),
      ],
      children: [
        InfoRow(
          icon: Icons.person_outline,
          label: 'Họ tên',
          value: item.employeeName ?? '—',
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.supervisor_account_outlined,
          label: 'Trưởng BP',
          value: _nonEmpty(item.approvedTpName) ?? '—',
          indentTop: true,
        ),
        if (hrName != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.badge_outlined,
            label: 'Nhân sự',
            value: hrName,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Ngày',
          value: _dateText(item.dayWork),
          indentTop: true,
        ),
        if (_nonEmpty(item.note) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.edit_note_outlined,
            label: 'Ghi chú',
            value: item.note!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.reasonDeciline) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.block_outlined,
            label: 'Lý do không duyệt',
            value: item.reasonDeciline!,
            valueColor: AppColors.redA500,
            indentTop: true,
          ),
        ],
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// 7. Làm đêm (NightShift)
// ════════════════════════════════════════════════════════════════════════════

/// Card cho tab "Làm đêm".
/// Hiển thị: TBP+HR chip - chip Bắt đầu/Kết thúc/Số giờ - Họ tên - Trưởng BP -
/// (Nhân sự nếu có) - Ngày - Địa điểm - Ghi chú - Lý do không duyệt.
class PersonalNightShiftCard extends StatelessWidget {
  const PersonalNightShiftCard({super.key, required this.item});
  final PersonalNightShiftItem item;

  ApprovalStatus _tbpStatus() =>
      mapStatusFromInt(item.isApprovedTbp, item.isApprovedTbpText);

  ApprovalStatus _hrStatus() =>
      mapStatusFromInt(item.isApprovedHr, item.isApprovedHrText);

  String _dateText(DateTime? d) {
    if (d == null) return '--/--/----';
    return _dateFmt.format(d.toLocal());
  }

  String _timeText(DateTime? d) {
    if (d == null) return '--:--';
    return _timeFmt.format(d.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final hrName = _nonEmpty(item.approvedHrName);
    return GlassCardShell(
      badges: [
        ApprovalBadge(role: 'TBP', status: _tbpStatus()),
        ApprovalBadge(role: 'HR', status: _hrStatus()),
      ],
      chips: [
        SummaryTypeChip.multi(
          color: AppColors.tealA400,
          extraFields: [
            MapEntry('Bắt đầu', _timeText(item.dateStart)),
            MapEntry('Kết thúc', _timeText(item.dateEnd)),
            MapEntry(
              'Số giờ',
              item.totalHours != null
                  ? item.totalHours!.toStringAsFixed(2)
                  : '—',
            ),
          ],
        ),
      ],
      children: [
        InfoRow(
          icon: Icons.person_outline,
          label: 'Họ tên',
          value: item.fullName ?? '—',
          indentTop: true,
        ),
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.supervisor_account_outlined,
          label: 'Trưởng BP',
          value: _nonEmpty(item.approvedTbpName) ?? '—',
          indentTop: true,
        ),
        if (hrName != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.badge_outlined,
            label: 'Nhân sự',
            value: hrName,
            indentTop: true,
          ),
        ],
        const SizedBox(height: 8),
        InfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Ngày',
          value: _dateText(item.dateStart),
          indentTop: true,
        ),
        if (_nonEmpty(item.location) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Địa điểm',
            value: item.location!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.note) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.edit_note_outlined,
            label: 'Ghi chú',
            value: item.note!,
            indentTop: true,
          ),
        ],
        if (_nonEmpty(item.reasonDeciline) != null) ...[
          const SizedBox(height: 8),
          InfoRow(
            icon: Icons.block_outlined,
            label: 'Lý do không duyệt',
            value: item.reasonDeciline!,
            valueColor: AppColors.redA500,
            indentTop: true,
          ),
        ],
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════════
// Phần tử chia sẻ nội bộ
// ════════════════════════════════════════════════════════════════════════════

/// Trả về `null` nếu chuỗi rỗng/null/whitespace, ngược lại trả chuỗi đã trim.
String? _nonEmpty(String? raw) {
  if (raw == null) return null;
  final t = raw.trim();
  return t.isEmpty ? null : t;
}

/// Dòng "Ăn tối" với tick xanh và icon đồ ăn.
class _DinnerBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoRow(
      icon: Icons.restaurant_outlined,
      label: 'Ăn tối',
      value: 'Có',
      isBold: true,
      valueColor: AppColors.greenA500,
      indentTop: true,
    );
  }
}
