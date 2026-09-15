part of 'solution_bloc.dart';

@CopyWith()
class SolutionState extends BaseBlocState {
  final List<SolutionItem> solutions;

  const SolutionState({
    required super.status,
    super.message,
    this.solutions = const [],
  });

  factory SolutionState.init() => const SolutionState(
        status: BaseStateStatus.init,
        solutions: [],
      );

  @override
  List get props => [identityHashCode(this), status, message, solutions];
}
