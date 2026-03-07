part of 'workspace_bloc.dart';

@CopyWith()
class WorkspaceState extends BaseBlocState {
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

  bool get hasUser => user != null;

  @override
  List get props => [status, message, user];
}
