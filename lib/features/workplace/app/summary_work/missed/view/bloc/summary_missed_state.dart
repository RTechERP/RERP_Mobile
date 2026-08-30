part of 'summary_missed_bloc.dart';

/// State cho màn tổng hợp phiếu quên chấm công.
@CopyWith()
class SummaryMissedState extends BaseBlocState {
  final List<SummaryMissedItem> missed;
  final List<SummaryMissedDepartment> departments;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String keyword;
  final int? departmentId;
  final int? filterStatus;

  const SummaryMissedState({
    required super.status,
    super.message,
    this.missed = const [],
    this.departments = const [],
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
    this.departmentId,
    this.filterStatus,
  });

  factory SummaryMissedState.init() => const SummaryMissedState(
        status: BaseStateStatus.init,
        missed: [],
        departments: [],
        keyword: '',
      );

  /// Áp dụng các filter (keyword, phòng ban, trạng thái) lên dữ liệu gốc.
  List<SummaryMissedItem> get displayItems {
    var items = missed;

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
          return item.isApprovedTP == true;
        }
        if (filterStatus == 0) {
          return item.isApprovedTP == false;
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
        missed,
        departments,
        dateStart,
        dateEnd,
        keyword,
        departmentId,
        filterStatus,
      ];
}