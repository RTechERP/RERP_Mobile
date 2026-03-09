part of 'ad_bloc.dart';

@freezed
class AdEvent with _$AdEvent {
  const factory AdEvent.init() = _Init;

  /// ===== SUBMIT =====
  const factory AdEvent.submitReport(DateTime pickedDate) =
  _SubmitReportLCXPWithDate;

  /// ===== RESET SUBMIT FLAGS ====
  const factory AdEvent.resetSubmitFlags() = _ResetSubmitFlags;

  const factory AdEvent.updateWork({
    required int index,
    int? projectId,
    String? projectName,
    int? totalHours,
    int? totalHourOT,
    String? content,
    String? results,
    String? backlog,
    String? problem,
    String? problemSolve,
    String? note,
    DateTime? dateReport,
    String? code,
    location,

  }) = _UpdateWork;

  const factory AdEvent.updateDate(DateTime? picked) = _UpdateDate;

  const factory AdEvent.updatePlanNextDay(String value) = _UpdatePlanNextDay;

  const factory AdEvent.deleteReport(int dailyID) = _DeleteReport;

  const factory AdEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;


  const factory AdEvent.loadDetailData({required int dailyID}) =
  _LoadDetailData;

  const factory AdEvent.selectReport({required int dailyID}) = _SelectReport;
  const factory AdEvent.submitEditReport(DateTime pickedDate, int dailyID) =
  _SubmitEditReportWithDate;

  /// ===== COPY REPORT ====
  const factory AdEvent.copyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
    required int teamId,
    required int userId,
    required int departmentId,
  }) = _CopyReport;

  /// ===== RESET COPY ====
  const factory AdEvent.resetCopyReport() = _ResetCopy;


  const factory AdEvent.addWork() = _AddWork;

  const factory AdEvent.removeWork({required int index}) = _RemoveWork;
  const factory AdEvent.expandWork({required int index}) = _ExpandWork;

  const factory AdEvent.getProject() = _GetProject;

  const factory AdEvent.selectProject(ProjectResponse project) = _SelectProject;

  const factory AdEvent.updateLocation({
    required String type,
    String? value,
  }) = _UpdateLocation;

}
