part of 'summary_wfh_bloc.dart';

@CopyWith()
class SummaryWfhState extends BaseBlocState {
  final List<SummaryWfhItem> wfh;
  final List<SummaryWfhDepartment> departments;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String keyword;
  final int? departmentId;
  final int? filterStatus;

  const SummaryWfhState({
    required super.status,
    super.message,
    this.wfh = const [],
    this.departments = const [],
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
    this.departmentId,
    this.filterStatus,
  });

  factory SummaryWfhState.init() => const SummaryWfhState(
        status: BaseStateStatus.init,
        wfh: [],
        departments: [],
        keyword: '',
      );

  List<SummaryWfhItem> get displayItems {
    var items = wfh;

    if (keyword.isNotEmpty) {
      final kw = keyword.toLowerCase();
      items = items.where((item) {
        final name = (item.employeeName ?? '').toLowerCase();
        return name.contains(kw);
      }).toList();
    }

    if (departmentId != null && departmentId! > 0) {
      items = items.where((item) => item.departmentId == departmentId).toList();
    }

    if (filterStatus != null && filterStatus! >= 0) {
      items = items.where((item) {
        if (filterStatus == 1) {
          return item.isApproved == true;
        }
        if (filterStatus == 0) {
          return item.isApproved == false;
        }
        return true;
      }).toList();
    }

    return items;
  }

  @override
  List get props => [
        status,
        message,
        wfh,
        departments,
        dateStart,
        dateEnd,
        keyword,
        departmentId,
        filterStatus,
      ];
}
