part of 'summary_overnight_bloc.dart';

/// State cho màn tổng hợp phiếu làm đêm.
@CopyWith()
class SummaryOvernightState extends BaseBlocState {
  final List<SummaryOvernightItem> overnight;
  final List<SummaryOvernightDepartment> departments;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String keyword;
  final int? departmentId;
  final int? filterStatus;

  const SummaryOvernightState({
    required super.status,
    super.message,
    this.overnight = const [],
    this.departments = const [],
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
    this.departmentId,
    this.filterStatus,
  });

  factory SummaryOvernightState.init() => const SummaryOvernightState(
        status: BaseStateStatus.init,
        overnight: [],
        departments: [],
        keyword: '',
      );

  /// Áp dụng các filter (keyword, phòng ban, trạng thái) lên dữ liệu gốc.
  /// Trạng thái map theo IsApprovedTBP: 1 = đã duyệt, 0 = chưa duyệt.
  List<SummaryOvernightItem> get displayItems {
    var items = overnight;

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
          return item.isApprovedTbp == 1;
        }
        if (filterStatus == 0) {
          return item.isApprovedTbp == 0;
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
        overnight,
        departments,
        dateStart,
        dateEnd,
        keyword,
        departmentId,
        filterStatus,
      ];
}