part of 'work_requirement_bloc.dart';
@CopyWith()
class WorkRequirementState extends BaseBlocState {
  final List<WorkRequirementItem> items;

  final int? employeeId;
  final int? departmentId;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  const WorkRequirementState({
    required super.status,
    super.message,
    this.items = const [],
    this.employeeId,
    this.departmentId,
    this.dateStart,
    this.dateEnd,
  });

  factory WorkRequirementState.init() => const WorkRequirementState(
        status: BaseStateStatus.init,
        items: [],
      );

  @override
  List get props => [
        status,
        message,
        items,
        employeeId,
        departmentId,
        dateStart,
        dateEnd,
      ];
}
