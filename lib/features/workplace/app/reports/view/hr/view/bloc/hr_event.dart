part of 'hr_bloc.dart';

@freezed
class HrEvent with _$HrEvent {
  const factory HrEvent.initAd() = _InitAd;

  const factory HrEvent.initLxcp() = _InitLxcp;

  /// ===== SUBMIT =====
  const factory HrEvent.submitReport(DateTime pickedDate) =
      _SubmitReportWithDate;

  const factory HrEvent.submitReportLCXP(DateTime pickedDate) =
      _SubmitReportLCXPWithDate;

  const factory HrEvent.deleteReportLCXP(int id, bool isDeleted) = _DeleteReportLCXPWithDate;

  /// ===== RESET SUBMIT FLAGS ====
  const factory HrEvent.resetSubmitFlags() = _ResetSubmitFlags;

  const factory HrEvent.updateWork({
    String? content,
    String? results,
    String? note,
    String? backlog,
    String? planNextDay,
  }) = _UpdateWork;

  const factory HrEvent.lxcpUpdateWork({
    required int index,
    int? quantity,
    int? timeActual,
    int? performanceActual,
    int? percentage,
    int? kmNumber,
    int? totalLate,
    int? totalTimeLate,
    String? reasonLate,
    String? statusVehicle,
    String? propose,
    int? filmManagementDetailID,
  }) = _LxcpUpdateWork;

  const factory HrEvent.updateDate(DateTime? picked) = _UpdateDate;

  const factory HrEvent.deleteReport(int dailyID) = _DeleteReport;

  const factory HrEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory HrEvent.changeLXCPDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
}) = _ChangeLXCPDateRange;



  const factory HrEvent.loadDetailData({required int dailyID}) =
      _LoadDetailData;

  const factory HrEvent.selectReport({required int dailyID}) = _SelectReport;

  const factory HrEvent.selectLXCPReport({required int dailyID}) = _SelectLXCPReport;

  const factory HrEvent.submitEditReport(DateTime pickedDate, int dailyID) =
      _SubmitEditReportWithDate;
  const factory HrEvent.submitLXCPEditReport(DateTime pickedDate, int dailyID) =
  _SubmitLXCPEditReportWithDate;

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


  const factory HrEvent.addWork() = _AddWork;

  const factory HrEvent.removeWork({required int index}) = _RemoveWork;
  const factory HrEvent.expandWork({required int index}) = _ExpandWork;

  const factory HrEvent.getFilmDetail() = _GetFilmDetail;

  const factory HrEvent.selectFilmDetail(FilmDetailResponse film) = _SelectFilmDetail;
}
