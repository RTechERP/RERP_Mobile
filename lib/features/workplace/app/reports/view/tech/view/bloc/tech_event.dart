part of 'tech_bloc.dart';

@freezed
class TechEvent with _$TechEvent {
  const factory TechEvent.init() = _Init;

  const factory TechEvent.addWork(int categoryIndex) = _AddWork;
  const factory TechEvent.removeWork({
    required int projectIndex,
    required String workId,
  }) = _RemoveWork;

  const factory TechEvent.expandWork(int categoryIndex, int workIndex) =
      _ExpandWork;

  const factory TechEvent.updateWork({
    required int projectIndex,
    required String workId,
    String? totalHours,
    String? otHours,
    String? percent,
    String? content,
    String? result,
    String? category,
  }) = _UpdateWork;

  const factory TechEvent.updateDate({DateTime? date}) = _UpdateDate;

  const factory TechEvent.addProject() = _AddProject;

  const factory TechEvent.removeProject({required String projectId}) =
      _RemoveProject;
  const factory TechEvent.selectProject(int index, String name) =
      _SelectProject;

  const factory TechEvent.expandProject(int projectIndex) = _ExpandProject;
}
