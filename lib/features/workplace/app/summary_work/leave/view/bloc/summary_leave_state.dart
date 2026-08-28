part of 'summary_leave_bloc.dart';

@CopyWith()
class SummaryLeaveState extends BaseBlocState {
  final List<SummaryLeaveItem> leave;
  final List<SummaryDepartment> departments;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String keyword;
  final int? departmentId;
  final int? filterStatus;

  const SummaryLeaveState({
    required super.status,
    super.message,
    this.leave = const [],
    this.departments = const [],
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
    this.departmentId,
    this.filterStatus,
  });

  factory SummaryLeaveState.init() => const SummaryLeaveState(
        status: BaseStateStatus.init,
        leave: [],
        departments: [],
        keyword: '',
      );

  List<SummaryLeaveItem> get displayItems {
    var items = leave;

    if (keyword.isNotEmpty) {
      final kw = keyword.toLowerCase();
      items = items.where((item) {
        final name = (item.fullName ?? '').toLowerCase();
        final code = (item.code ?? '').toLowerCase();
        return name.contains(kw) || code.contains(kw);
      }).toList();
    }

    if (departmentId != null && departmentId! > 0) {
      items = items.where((item) => item.departmentId == departmentId).toList();
    }

    if (filterStatus != null && filterStatus! >= 0) {
      items = items.where((item) => item.statusNumber == filterStatus).toList();
    }

    return items;
  }

  @override
  List get props => [
        status,
        message,
        leave,
        departments,
        dateStart,
        dateEnd,
        keyword,
        departmentId,
        filterStatus,
      ];
}
