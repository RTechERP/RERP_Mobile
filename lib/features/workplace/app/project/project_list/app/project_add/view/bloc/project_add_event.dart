part of 'project_add_bloc.dart';

@freezed
class ProjectAddEvent with _$ProjectAddEvent {
  /// Load song song tất cả 10 API lookup.
  const factory ProjectAddEvent.loadAll() = _LoadAll;

  /// Refresh riêng 1 danh sách lookup (vd user bấm retry trên bottom sheet).
  const factory ProjectAddEvent.refresh(ProjectLookupKey key) = _Refresh;
}

/// Định danh từng API lookup để dùng cho [ProjectAddEvent.refresh].
enum ProjectLookupKey {
  firms,
  customers,
  projectTypes,
  pms,
  statuses,
  industries,
  userTeams,
  projectModal,
  applications,
  technologies,
}
