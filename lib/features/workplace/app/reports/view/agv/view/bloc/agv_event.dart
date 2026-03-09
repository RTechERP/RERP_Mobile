part of 'agv_bloc.dart';

@freezed
class AgvEvent with _$AgvEvent {
  const factory AgvEvent.init() = _Init;

  /// ===== SUBMIT =====
  const factory AgvEvent.submitReport(DateTime pickedDate) =
  _SubmitReportLCXPWithDate;

  /// ===== RESET SUBMIT FLAGS ====
  const factory AgvEvent.resetSubmitFlags() = _ResetSubmitFlags;

  const factory AgvEvent.updateWork({
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

  const factory AgvEvent.updateDate(DateTime? picked) = _UpdateDate;

  const factory AgvEvent.updatePlanNextDay(String value) = _UpdatePlanNextDay;

  const factory AgvEvent.deleteReport(int dailyID) = _DeleteReport;

  const factory AgvEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;


  const factory AgvEvent.loadDetailData({required int dailyID}) =
  _LoadDetailData;

  const factory AgvEvent.selectReport({required int dailyID}) = _SelectReport;
  const factory AgvEvent.submitEditReport(DateTime pickedDate, int dailyID) =
  _SubmitEditReportWithDate;

  /// ===== COPY REPORT ====
  const factory AgvEvent.copyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
    required int teamId,
    required int userId,
    required int departmentId,
  }) = _CopyReport;

  /// ===== RESET COPY ====
  const factory AgvEvent.resetCopyReport() = _ResetCopy;


  const factory AgvEvent.addWork() = _AddWork;

  const factory AgvEvent.removeWork({required int index}) = _RemoveWork;
  const factory AgvEvent.expandWork({required int index}) = _ExpandWork;

  const factory AgvEvent.getProject() = _GetProject;

  const factory AgvEvent.selectProject(ProjectResponse project) = _SelectProject;

  const factory AgvEvent.updateLocation({
    required String type,
    String? value,
  }) = _UpdateLocation;
}
