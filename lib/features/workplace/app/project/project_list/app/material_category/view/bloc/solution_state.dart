part of 'solution_bloc.dart';

@CopyWith()
class SolutionState extends BaseBlocState {
  final List<SolutionItem> solutions;
  final int? projectRequestId;

  const SolutionState({
    required super.status,
    super.message,
    this.solutions = const [],
    this.projectRequestId,
  });

  factory SolutionState.init() => const SolutionState(
        status: BaseStateStatus.init,
        solutions: [],
      );

  @override
  List get props => [identityHashCode(this), status, message, solutions, projectRequestId];
}
