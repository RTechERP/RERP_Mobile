part of 'hr_bloc.dart';

@freezed
class HrEvent with _$HrEvent{
  const factory HrEvent.initAd() = _InitAd;

  const factory HrEvent.initLxcp() = _InitLxcp;

  /// ===== SUBMIT =====
  const factory HrEvent.submitReport(DateTime pickedDate) =
  _SubmitReportWithDate;

  /// ===== RESET SUBMIT FLAGS ====
  const factory HrEvent.resetSubmitFlags() = _ResetSubmitFlags;

  const factory HrEvent.updateWork({

    String? content,
    String? results,
    String? note,
    String? backlog,
    String? planNextDay,
  }) = _UpdateWork;

  const factory HrEvent.updateDate(DateTime? picked) = _UpdateDate;

  const factory HrEvent.deleteReport(int dailyID) = _DeleteReport;

  const factory HrEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory HrEvent.loadDetailData({required int dailyID}) =
  _LoadDetailData;

  const factory HrEvent.selectReport({required int dailyID}) = _SelectReport;

  const factory HrEvent.submitEditReport(DateTime pickedDate, int dailyID) =
  _SubmitEditReportWithDate;

  /// ===== COPY REPORT ====
  const factory HrEvent.copyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
    required int teamId,
    required int userId,
    required int departmentId,
  }) = _CopyReport;

  /// ===== RESET COPY ====
  const factory HrEvent.resetCopyReport() = _ResetCopy;

}