import '../../data/datasource/models/overtime_model.dart';

/// Payload id gửi API từ [ApproverItem].
int approvedOvertimePayloadValue(ApproverItem item) =>
    item.employeeId ?? item.id;

class OvertimeLocationOption {
  const OvertimeLocationOption({required this.value, required this.label});

  final int value;
  final String label;
}

const kOvertimeLocationOptions = <OvertimeLocationOption>[
  OvertimeLocationOption(value: 1, label: 'Văn phòng'),
  OvertimeLocationOption(value: 4, label: 'Nhà máy RTC'),
  OvertimeLocationOption(value: 2, label: 'Địa điểm công tác'),
  OvertimeLocationOption(value: 3, label: 'Tại nhà'),
];
