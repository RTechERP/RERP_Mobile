import '../data/datasource/models/leave_model.dart';

/// Quy tắc giống màn danh sách (xoá swipe): ngày/giờ, huỷ, đã duyệt.
/// Dùng chung cho [LeaveItem] (một dòng list) và từng [LeaveEditSlip] (chi tiết / multi-ID).
class LeaveSwipeRules {
  LeaveSwipeRules._();

  static DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  /// Không cho xoá/sửa: (1) ngày/quá khứ; (2) hôm nay nhưng đã quá mốc đăng ký theo buổi.
  /// Sáng (1) / cả ngày (3): từ 8:01 cùng ngày bắt đầu không xoá. Chiều (2): từ 13:31.
  static bool isSwipeBlockedByDateTime({
    required DateTime? startDate,
    DateTime? endDate,
    int? timeOnLeave,
    DateTime? clock,
  }) {
    final startRaw = startDate;
    if (startRaw == null) return true;

    final now = clock ?? DateTime.now();
    final today = _dateOnly(now);
    final start = startRaw.toLocal();
    final startDay = _dateOnly(start);

    final endRaw = endDate ?? startDate;
    if (endRaw == null) return true;
    final endDay = _dateOnly(endRaw.toLocal());

    if (endDay.isBefore(today)) return true;
    if (startDay.isBefore(today)) return true;
    if (startDay.isAfter(today)) return false;

    final y = today.year, m = today.month, d = today.day;
    final session = timeOnLeave;
    final DateTime deadline = session == 2
        ? DateTime(y, m, d, 13, 31)
        : DateTime(y, m, d, 8, 1);

    return !now.isBefore(deadline);
  }

  static bool _leaveIsCancelled({
    bool? deleteFlag,
    bool? isCancelRegister,
    bool? isCancelTP,
  }) {
    return deleteFlag == true ||
        isCancelRegister == true ||
        isCancelTP == true;
  }

  static bool _hrApproved({
    bool? isApprovedHR,
    int? statusHRNumber,
    String? statusHRText,
  }) {
    if (isApprovedHR == true) return true;
    if (statusHRNumber == 1) return true;
    final text = (statusHRText ?? '').toLowerCase();
    if (text.contains('duyệt') && !text.contains('chờ')) return true;
    return false;
  }

  /// Một dòng danh sách [LeaveItem] có được phép xoá (swipe) không.
  static bool canSwipeDeleteLeave(LeaveItem item) {
    if (isSwipeBlockedByDateTime(
          startDate: item.startDate,
          endDate: item.endDate ?? item.startDate,
          timeOnLeave: item.timeOnLeave,
        ) ||
        _leaveIsCancelled(
          deleteFlag: item.deleteFlag,
          isCancelRegister: item.isCancelRegister,
          isCancelTP: item.isCancelTP,
        )) {
      return false;
    }
    final bgdApproved = item.isApprovedBGD == true;
    final tbpApproved = item.isApprovedTP == true;
    final hrApproved = _hrApproved(
      isApprovedHR: item.isApprovedHR,
      statusHRNumber: item.statusHRNumber,
      statusHRText: item.statusHRText,
    );
    return !bgdApproved && !tbpApproved && !hrApproved;
  }

  /// Phiếu chi tiết (một detail trong phase) có bị khoá sửa không — cùng logic với xoá list.
  /// Cờ cấp phase dùng khi detail không gửi kèm field.
  static bool isDetailSlipReadOnly(
    LeaveEditSlip slip, {
    bool? phaseIsApprovedBGD,
    bool? phaseIsApprovedTP,
    bool? phaseIsApprovedHR,
    int? phaseStatusHRNumber,
    String? phaseStatusHRText,
  }) {
    if (isSwipeBlockedByDateTime(
          startDate: slip.date,
          endDate: slip.date,
          timeOnLeave: slip.timeRegister,
        )) {
      return true;
    }

    if (_leaveIsCancelled(
          deleteFlag: slip.deleteFlag,
          isCancelRegister: slip.isCancelRegister,
          isCancelTP: slip.isCancelTP,
        )) {
      return true;
    }

    final bgd = slip.isApprovedBGD ?? phaseIsApprovedBGD;
    final tp = slip.isApprovedTP ?? phaseIsApprovedTP;
    final hr = _hrApproved(
      isApprovedHR: slip.isApprovedHR ?? phaseIsApprovedHR,
      statusHRNumber: slip.statusHRNumber ?? phaseStatusHRNumber,
      statusHRText: slip.statusHRText ?? phaseStatusHRText,
    );

    if (bgd == true || tp == true || hr) return true;
    return false;
  }

  /// Đợt đã duyệt (BGĐ / TP / HR) — chặn thêm phiếu, đổi người duyệt, gửi cập nhật toàn form.
  static bool isPhaseApprovalLocked({
    bool? phaseIsApprovedBGD,
    bool? phaseIsApprovedTP,
    bool? phaseIsApprovedHR,
    int? phaseStatusHRNumber,
    String? phaseStatusHRText,
  }) {
    final bgd = phaseIsApprovedBGD == true;
    final tp = phaseIsApprovedTP == true;
    final hr = _hrApproved(
      isApprovedHR: phaseIsApprovedHR,
      statusHRNumber: phaseStatusHRNumber,
      statusHRText: phaseStatusHRText,
    );
    return bgd || tp || hr;
  }
}
