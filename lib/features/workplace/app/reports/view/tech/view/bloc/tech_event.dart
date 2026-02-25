part of 'tech_bloc.dart';

@freezed
class TechEvent with _$TechEvent {
  const factory TechEvent.init() = _Init;

  /// ===== PROJECT =====
  /// Tạo project trống để hiển thị UI
  const factory TechEvent.addEmptyProject() = _AddEmptyProject;

  /// Bind project API vào slot temp
  const factory TechEvent.bindProjectFromApi({
    required String tempId,
    required ProjectResponse apiProject,
  }) = _BindProjectFromApi;

  /// Remove project (xóa cả temp lẫn đã bind)
  const factory TechEvent.removeProject({required String tempId}) =
      _RemoveProject;

  /// Select project
  const factory TechEvent.selectProject({required String tempId}) =
      _SelectProject;

  /// (Optional) Update name nếu cho sửa tay
  const factory TechEvent.updateProjectName({
    required String tempId,
    required String newName,
  }) = _UpdateProjectName;

  /// ===== WORK =====
  const factory TechEvent.addWork() = _AddWork;

  const factory TechEvent.removeWork({required int index}) = _RemoveWork;
  const factory TechEvent.expandWork({required int index}) = _ExpandWork;

  const factory TechEvent.updateWork({
    required int index,
    double? totalHours,
    double? totalHourOT,
    double? percentComplete,
    String? content,
    String? results,
    String? mission,
    int? projectItemId,
    String? code,
  }) = _UpdateWork;

  const factory TechEvent.updateDate(DateTime? picked) = _UpdateDate;

  /// ===== LOCATION =====
  const factory TechEvent.updateLocation({
    required String type,
    String? value,
  }) = _UpdateLocation;

  /// ===== GLOBAL =====
  const factory TechEvent.updatePlanNextDay(String value) = _UpdatePlanNextDay;

  /// ===== SUBMIT =====
  const factory TechEvent.submitReport(DateTime pickedDate) =
      _SubmitReportWithDate;

  /// ===== SEND MAIL ====
  const factory TechEvent.sendMailReport({
    required DateTime pickedDate,
    required BuildContext context,
  }) = _SendMailReport;

  /// ===== RESET SUBMIT FLAGS ====
  const factory TechEvent.resetSubmitFlags() = _ResetSubmitFlags;

  /// ===== CHANGE DATE RANGE ====
  const factory TechEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// ===== SELECT REPORT (GET DETAIL BY ID) ====
  const factory TechEvent.selectReport({required int dailyID}) = _SelectReport;

  /// ===== LOAD DETAIL DATA ====
  const factory TechEvent.loadDetailData({required int dailyID}) =
      _LoadDetailData;

  /// ===== SUBMIT EDIT REPORT ====
  const factory TechEvent.submitEditReport(DateTime pickedDate, int dailyID) =
      _SubmitEditReportWithDate;

  /// ===== DELETE REPORT ====
  const factory TechEvent.deleteReport(int dailyID) = _DeleteReport;

  /// ===== COPY REPORT ====
  const factory TechEvent.copyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
    required int teamId,
    required int userId,
    required int departmentId,
  }) = _CopyReport;
}
