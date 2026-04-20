// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Events cho WorkspaceBloc - init, refresh

part of 'workspace_bloc.dart';

@freezed
class WorkspaceEvent with _$WorkspaceEvent {
  /// Khởi tạo workspace — load user từ cache, fallback sang API nếu cần.
  const factory WorkspaceEvent.init() = _Init;

  /// Refresh workspace — force fetch user từ API, ignore cache.
  const factory WorkspaceEvent.refresh() = _Refresh;
}
