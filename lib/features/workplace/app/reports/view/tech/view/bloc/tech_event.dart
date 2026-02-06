part of 'tech_bloc.dart';

@freezed
class TechEvent with _$TechEvent {
  const factory TechEvent.init() = _Init;

  /// ===== PROJECT =====
  const factory TechEvent.addProject() = _AddProject;

  const factory TechEvent.removeProject({
    required TechProject project,
  }) = _RemoveProject;

  const factory TechEvent.selectProject({
    required TechProject project,
  }) = _SelectProject;

  const factory TechEvent.updateProjectName({
    required TechProject project,
    required String newName,
  }) = _UpdateProjectName;

  /// ===== WORK =====
  const factory TechEvent.addWork() = _AddWork;

  const factory TechEvent.removeWork({required int index}) = _RemoveWork;
  const factory TechEvent.expandWork({required int index}) = _ExpandWork;

  const factory TechEvent.updateWork({
    required int index,
    String? totalHours,
    String? totalHourOT,
    String? percentComplete,
    String? content,
    String? results,
    String? mission,
  }) = _UpdateWork;

  const factory TechEvent.updateDate({DateTime? createdDate}) = _UpdateDate;

  const factory TechEvent.updateLocation({
    required String type,
    String? value,
  }) = _UpdateLocation;
}

