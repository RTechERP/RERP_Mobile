part of 'summary_in_out_bloc.dart';

@CopyWith()
class SummaryInOutState extends BaseBlocState {
  final List<SummaryInOutItem> inOut;
  final List<SummaryInOutDepartment> departments;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String keyword;
  final int? departmentId;
  final int? filterStatus;

  const SummaryInOutState({
    required super.status,
    super.message,
    this.inOut = const [],
    this.departments = const [],
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
    this.departmentId,
    this.filterStatus,
  });

  factory SummaryInOutState.init() => const SummaryInOutState(
        status: BaseStateStatus.init,
        inOut: [],
        departments: [],
        keyword: '',
      );

  List<SummaryInOutItem> get displayItems {
    var items = inOut;

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
        inOut,
        departments,
        dateStart,
        dateEnd,
        keyword,
        departmentId,
        filterStatus,
      ];
}
