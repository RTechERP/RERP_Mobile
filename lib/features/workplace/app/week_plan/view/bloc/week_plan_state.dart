part of 'week_plan_bloc.dart';

@CopyWith()
class WeekPlanState extends BaseBlocState {
  final List<WeekPlanTaskItem> myTasks;
  final List<WeekPlanTaskItem> assignedTasks;

  final String searchKeyword;
  final String selectedStatus;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  final int? employeeId;

  const WeekPlanState({
    required super.status,
    super.message,
    this.myTasks = const [],
    this.assignedTasks = const [],
    this.searchKeyword = '',
    this.selectedStatus = 'Tất cả',
    this.dateStart,
    this.dateEnd,
    this.employeeId,
  });

  factory WeekPlanState.init() => const WeekPlanState(
        status: BaseStateStatus.init,
        myTasks: [],
        assignedTasks: [],
        searchKeyword: '',
        selectedStatus: 'Tất cả',
      );

  @override
  List get props => [
        status,
        message,
        myTasks,
        assignedTasks,
        searchKeyword,
        selectedStatus,
        dateStart,
        dateEnd,
        employeeId,
      ];
}
