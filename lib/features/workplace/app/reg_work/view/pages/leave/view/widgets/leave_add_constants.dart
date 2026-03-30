import '../../data/datasource/models/leave_model.dart';

/// Trùng [FormDateTimePicker.nameTimePicker] — chỉ sync UI.
const kLeaveRegDateInnerUnused = 'leave_add_reg_date_inner_unused';

/// Gửi API `ApprovedTP` — ưu tiên `EmployeeID` người duyệt.
int approvedLeavePayloadValue(ApproverItem item) =>
    item.employeeId ?? item.id;

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
