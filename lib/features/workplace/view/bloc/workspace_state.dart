// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: State cho WorkspaceBloc - user info, loading status

part of 'workspace_bloc.dart';

@CopyWith()
class WorkspaceState extends BaseBlocState {
  /// User hiện tại — được load từ cache hoặc API.
  final User? user;

  const WorkspaceState({
    required super.status,
    super.message,
    this.user,
  });

  factory WorkspaceState.init() => const WorkspaceState(
    status: BaseStateStatus.init,
    user: null,
  );

  /// Check user đã được load hay chưa.
  bool get hasUser => user != null;

  @override
  List get props => [status, message, user];
}
