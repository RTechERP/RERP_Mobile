import '../../data/datasource/models/approve_timesheet_model.dart';

/// Trạng thái pipeline duyệt timesheet — chia sẻ giữa list (section) và detail.
///
/// - [approved]: đã duyệt (xanh)
/// - [declined]: không duyệt (đỏ)
/// - [pending]:  chờ duyệt (vàng)
enum ApproveTimesheetStageState { approved, declined, pending }

/// Quy tắc chung cho mọi stage:
///
/// - Cờ decline (DecilineApproveXxx == 2) hoặc reason có nội dung → declined
/// - statusValue == 1 → approved
/// - statusValue == 2 → declined
/// - statusValue ∈ {-1, 0, null} → pending
///
/// Khi [useTextAsSourceOfTruth] = true (chỉ Senior), `*Text` phản ánh trạng
/// thái mới nhất nên ưu tiên hơn cờ decline — ví dụ khi senior từng từ chối
/// (DecilineApproveSenior == 2) rồi duyệt lại, IsSeniorApprovedText sẽ là
/// "Đã duyệt" và ta dùng text thay vì cờ cũ.
ApproveTimesheetStageState resolveApproveTimesheetStageState({
  required int? statusValue,
  required int? declineValue,
  required bool hasDeclineReason,
  required String? statusText,
  bool useTextAsSourceOfTruth = false,
}) {
  if (useTextAsSourceOfTruth) {
    final text = (statusText ?? '').trim().toLowerCase();
    final textIndicatesApproved = text.contains('đã duyệt') ||
        text.contains('da duyet') ||
        text.contains('phê duyệt') ||
        text.contains('phe duyet') ||
        text.contains('approved');
    final textIndicatesDeclined = text.contains('từ chối') ||
        text.contains('tu choi') ||
        text.contains('không duyệt') ||
        text.contains('khong duyet') ||
        text.contains('decline') ||
        text.contains('reject');
    if (textIndicatesApproved) return ApproveTimesheetStageState.approved;
    if (textIndicatesDeclined) return ApproveTimesheetStageState.declined;
  }

  if (declineValue == 2 || hasDeclineReason) {
    return ApproveTimesheetStageState.declined;
  }
  switch (statusValue) {
    case 1:
      return ApproveTimesheetStageState.approved;
    case 2:
      return ApproveTimesheetStageState.declined;
    case -1:
    case 0:
    case null:
      return ApproveTimesheetStageState.pending;
    default:
      return ApproveTimesheetStageState.pending;
  }
}

/// Trạng thái 4 giai đoạn duyệt của một [ApproveTimesheetItem].
class ApproveTimesheetStages {
  const ApproveTimesheetStages({
    required this.senior,
    required this.hr,
    required this.tbp,
    required this.bgd,
  });

  final ApproveTimesheetStageState senior;
  final ApproveTimesheetStageState hr;
  final ApproveTimesheetStageState tbp;
  final ApproveTimesheetStageState bgd;

  factory ApproveTimesheetStages.fromItem(ApproveTimesheetItem item) {
    return ApproveTimesheetStages(
      senior: resolveApproveTimesheetStageState(
        statusValue: item.isSeniorApproved,
        declineValue: item.decilineApproveSenior,
        hasDeclineReason: false,
        statusText: item.isSeniorApprovedText,
        useTextAsSourceOfTruth: true,
      ),
      hr: resolveApproveTimesheetStageState(
        statusValue: item.isApprovedHR,
        declineValue: null,
        hasDeclineReason: false,
        statusText: item.statusHRText,
      ),
      tbp: resolveApproveTimesheetStageState(
        statusValue: item.isApprovedTP,
        declineValue: item.decilineApprove,
        hasDeclineReason: (item.reasonDeciline ?? '').trim().isNotEmpty,
        statusText: item.statusText,
      ),
      bgd: resolveApproveTimesheetStageState(
        statusValue: item.isApprovedBGD,
        declineValue: null,
        hasDeclineReason: false,
        statusText: item.statusBGDText,
      ),
    );
  }
}
