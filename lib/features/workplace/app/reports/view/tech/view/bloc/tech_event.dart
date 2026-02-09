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
  const factory TechEvent.removeProject({
    required String tempId,
  }) = _RemoveProject;

  /// Select project
  const factory TechEvent.selectProject({
    required String tempId,
  }) = _SelectProject;

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
    String? planNextDay,
  }) = _UpdateWork;

  const factory TechEvent.updateDate(DateTime? picked) = _UpdateDate;


  const factory TechEvent.updateLocation({
    required String type,
    String? value,
  }) = _UpdateLocation;

  /// ===== SUBMIT =====
  const factory TechEvent.submitReport() = _SubmitReport;

  const factory TechEvent.submitReportWithDate(DateTime pickedDate) =
  _SubmitReportWithDate;

}

