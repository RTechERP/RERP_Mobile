part of 'tech_bloc.dart';

@freezed
class TechEvent with _$TechEvent {
  const factory TechEvent.init() = _Init;

  /// Khởi tạo với list các báo cáo được copy
  const factory TechEvent.initAdd({
    required List<CopyNullResponse> copyItems,
    required List<ProjectResponse> rtcProject,
  }) = _InitAdd;

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
    String? backlog,
    String? problem,
    String? problemSolve,
    String? note,
    String? location,
  }) = _UpdateWork;

  const factory TechEvent.updateDate(DateTime? picked) = _UpdateDate;

  /// ===== LOCATION =====
  const factory TechEvent.updateLocation({
    required String type,
    String? value,
  }) = _UpdateLocation;

  /// ===== OVERTIME (LÀM THÊM) =====
  /// Bật/tắt khai báo làm thêm cho một hạng mục công việc.
  const factory TechEvent.toggleOvertime({
    required int index,
    required bool enabled,
  }) = _ToggleOvertime;

  /// Thêm một ca làm thêm mới (chưa lưu) vào hạng mục công việc.
  const factory TechEvent.addOvertimeSession({required int index}) =
      _AddOvertimeSession;

  /// Xoá một ca làm thêm. Nếu ca làm thêm đã tồn tại trên DB (ID > 0) thì
  /// được đánh dấu xoá mềm và gửi lên BE kèm `IsDeleted = true`.
  const factory TechEvent.removeOvertimeSession({
    required int index,
    required int sessionIndex,
  }) = _RemoveOvertimeSession;

  /// Cập nhật thông tin một ca làm thêm (giờ, địa điểm, loại, lý do...).
  const factory TechEvent.updateOvertimeSession({
    required int index,
    required int sessionIndex,
    DateTime? timeStart,
    DateTime? endTime,
    int? location,
    int? typeId,
    int? approvedId,
    bool? overnight,
    String? reason,
  }) = _UpdateOvertimeSession;

  /// ===== PHÁT SINH =====
  /// Tải các phát sinh của một hạng mục công việc (chỉ để tham khảo).
  const factory TechEvent.loadHistoryProblems({required int projectItemId}) =
      _LoadHistoryProblems;

  /// ===== TỰ ĐỘNG MỞ SHEET LÀM THÊM =====
  /// Xoá tín hiệu "tự mở sheet làm thêm" sau khi UI đã mở sheet.
  const factory TechEvent.clearAutoOpenOvertime() = _ClearAutoOpenOvertime;

  /// ===== GLOBAL =====
  const factory TechEvent.updatePlanNextDay(String value) = _UpdatePlanNextDay;

  const factory TechEvent.updateExtraInfo({
    String? problem,
    String? problemSolve,
    String? backlog,
    String? note,
  }) = _UpdateExtraInfo;

  /// ===== SUBMIT =====
  const factory TechEvent.submitReport(DateTime pickedDate) =
      _SubmitReportWithDate;

  /// ===== SEND MAIL ====
  const factory TechEvent.sendMailReport({
    required DateTime pickedDate,
    required BuildContext context,
    String? shareText,
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

  /// ===== RESET COPY ====
  const factory TechEvent.resetCopyReport() = _ResetCopy;
}
