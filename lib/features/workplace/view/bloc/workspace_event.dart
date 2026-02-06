part of 'workspace_bloc.dart';

@freezed
class WorkspaceEvent with _$WorkspaceEvent {
  const factory WorkspaceEvent.init() = _Init;
  const factory WorkspaceEvent.refresh() = _Refresh;
}
