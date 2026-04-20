import 'package:intl/intl.dart';

import '../../data/datasource/models/leave_model.dart';

/// Trùng [FormDateTimePicker.nameTimePicker] — chỉ sync UI.
const kLeaveRegDateInnerUnused = 'leave_add_reg_date_inner_unused';

/// Gửi API `ApprovedTP` — ưu tiên `EmployeeID` người duyệt.
int approvedLeavePayloadValue(ApproverItem item) =>
    item.employeeId ?? item.id;

bool _leaveApproverRawMatches(ApproverItem a, int raw) {
  if (raw <= 0) return false;
  if (a.id == raw) return true;
  if (a.employeeId == raw) return true;
  final u = a.usersId;
  if (u != null && u == raw) return true;
  return approvedLeavePayloadValue(a) == raw;
}

/// [rawFromApi]: ApprovedTP / ApprovedID / IDApprovedTP / UsersID từ Phase hoặc Detail.
/// Trả về giá trị ghi form (chuẩn [approvedLeavePayloadValue]) và dòng hiển thị.
({int payloadForForm, String displayLine}) leaveResolveApproverForForm(
  List<ApproverItem> items,
  int rawFromApi,
) {
  if (rawFromApi <= 0) {
    return (payloadForForm: 0, displayLine: '');
  }
  for (final a in items) {
    if (a.isDeleted == true) continue;
    if (_leaveApproverRawMatches(a, rawFromApi)) {
      final p = approvedLeavePayloadValue(a);
      final line = '${a.code ?? ''} - ${a.fullName ?? ''}'.trim();
      return (payloadForForm: p, displayLine: line);
    }
  }
  return (payloadForForm: rawFromApi, displayLine: '');
}

/// Hiển thị khoảng nghỉ: `dd/MM/yyyy - dd/MM/yyyy` (StartDate–EndDate, lịch local).
String leaveDateRangeDisplayText(DateTime startCalendar, DateTime endCalendar) {
  final df = DateFormat('dd/MM/yyyy');
  return '${df.format(startCalendar)} - ${df.format(endCalendar)}';
}

/// Map nhãn loại nghỉ từ [TypeIsReal] và [Type] (thử TypeIsReal trước, rồi Type).
String leaveTypeDisplayLabel({
  required int? typeIsReal,
  required int? typePlain,
}) {
  for (final code in <int?>[typeIsReal, typePlain]) {
    if (code == null || code <= 0) continue;
    for (final o in kLeaveTypeOptions) {
      if (o.value == code) return o.label;
    }
  }
  return '—';
}

class LeaveSessionOption {
  const LeaveSessionOption({required this.value, required this.label});

  final int value;
  final String label;
}

const kLeaveSessionOptions = <LeaveSessionOption>[
  LeaveSessionOption(value: 1, label: 'Buổi sáng'),
  LeaveSessionOption(value: 2, label: 'Buổi chiều'),
  LeaveSessionOption(value: 3, label: 'Cả ngày'),
];

class LeaveTypeOption {
  const LeaveTypeOption({required this.value, required this.label});

  final int value;
  final String label;
}

/// 1: không lương, 2: phép, 3: việc riêng có lương
const kLeaveTypeOptions = <LeaveTypeOption>[
  LeaveTypeOption(value: 1, label: 'Nghỉ không lương'),
  LeaveTypeOption(value: 2, label: 'Nghỉ phép'),
  LeaveTypeOption(value: 3, label: 'Nghỉ việc riêng có hưởng lương'),
];
