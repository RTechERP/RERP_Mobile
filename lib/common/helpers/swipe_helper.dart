import 'package:rtc_erp/features/workplace/app/reg_work/view/pages/leave/data/datasource/models/leave_model.dart';
import 'package:rtc_erp/common/utils/formatter/date_formatter.dart';

class SwipeHelper {
  SwipeHelper._();

  static bool isSwipeBlockedByDateTime({
    required DateTime? startDate,
    DateTime? endDate,
    int? timeOnLeave,
    DateTime? clock,
  }) {
    final startRaw = startDate;
    if (startRaw == null) return true;

    final now = clock ?? DateTime.now();
    final today = DateFormatter.dateOnly(now);
    final start = startRaw.toLocal();
    final startDay = DateFormatter.dateOnly(start);

    final endRaw = endDate ?? startDate;
    if (endRaw == null) return true;
    final endDay = DateFormatter.dateOnly(endRaw.toLocal());

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
