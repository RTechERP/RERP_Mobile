part of 'summary_overtime_bloc.dart';

/// State cho màn tổng hợp phiếu làm thêm.
@CopyWith()
class SummaryOvertimeState extends BaseBlocState {
  final List<SummaryOvertimeItem> overtime;
  final List<SummaryOvertimePerson> persons;
  final List<SummaryOvertimeDepartment> departments;

  /// Danh sách NV phục vụ picker.
  final List<SummaryOvertimeEmployee> employees;

  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Từ khoá tìm kiếm NV trong picker.
  final String employeeKeyword;

  /// Từ khoá tìm kiếm phiếu OT.
  final String keyword;

  /// NV đang được chọn để lọc danh sách phiếu.
  final int? selectedEmployeeId;
  final String? selectedEmployeeName;

  final int? departmentId;

  /// idApprovedTP: 0 = tất cả, 1 = đã duyệt TBP, 2 = chờ duyệt TBP.
  final int? filterApprovedTp;

  const SummaryOvertimeState({
    required super.status,
    super.message,
    this.overtime = const [],
    this.persons = const [],
    this.departments = const [],
    this.employees = const [],
    this.dateStart,
    this.dateEnd,
    this.employeeKeyword = '',
    this.keyword = '',
    this.selectedEmployeeId,
    this.selectedEmployeeName,
    this.departmentId,
    this.filterApprovedTp,
  });

  factory SummaryOvertimeState.init() => const SummaryOvertimeState(
        status: BaseStateStatus.init,
        overtime: [],
        persons: [],
        departments: [],
        employees: [],
        employeeKeyword: '',
        keyword: '',
      );

  /// Áp dụng các filter (từ khoá, NV, phòng ban, trạng thái TBP) lên dữ liệu gốc.
  List<SummaryOvertimeItem> get displayItems {
    var items = overtime;

    // Tìm kiếm theo từ khoá (tên NV)
    if (keyword.isNotEmpty) {
      final kw = keyword.toLowerCase();
      items = items.where((item) {
        final name = (item.fullName ?? '').toLowerCase();
        return name.contains(kw);
      }).toList();
    }

    if (selectedEmployeeId != null) {
      items = items
          .where((item) => item.employeeId == selectedEmployeeId)
          .toList();
    }

    if (departmentId != null && departmentId! > 0) {
      items = items.where((item) => item.departmentId == departmentId).toList();
    }

    // idApprovedTP filter theo TBP (IsSeniorApproved)
    if (filterApprovedTp != null && filterApprovedTp! > 0) {
      items = items.where((item) {
        if (filterApprovedTp == 1) {
          return item.isSeniorApproved == true;
        }
        if (filterApprovedTp == 2) {
          return item.isSeniorApproved != true;
        }
        return true;
      }).toList();
    }

    return items;
  }

  /// Xếp hạng nhân viên theo giờ OT giảm dần. Vị trí top 1 → cao nhất,
  /// vị trí cuối → thấp nhất.
  ///
  /// Cũng áp dụng filter (phòng ban/TBP) cho rank tab — chỉ giữ lại những
  /// nhân viên có trong `displayItems` (khớp theo `fullName`). Đảm bảo cả list
  /// tab và rank tab phản ánh đúng filter đã chọn, vì `SummaryOvertimePerson`
  /// không có trực tiếp các trường `departmentId`/`isSeniorApproved`.
  List<SummaryOvertimePerson> get rankedPersons {
    final filteredNames = <String>{
      for (final item in displayItems)
        if (item.fullName != null && item.fullName!.isNotEmpty)
          item.fullName!,
    };

    final filtered = filteredNames.isEmpty
        ? <SummaryOvertimePerson>[]
        : persons
            .where((p) =>
                p.fullName != null && filteredNames.contains(p.fullName))
            .toList();

    filtered.sort((a, b) {
      final ah = a.hourSummary ?? 0;
      final bh = b.hourSummary ?? 0;
      return bh.compareTo(ah);
    });
    return filtered;
  }

  @override
  List get props => [
        status,
        message,
        overtime,
        persons,
        departments,
        employees,
        dateStart,
        dateEnd,
        employeeKeyword,
        keyword,
        selectedEmployeeId,
        selectedEmployeeName,
        departmentId,
        filterApprovedTp,
      ];
}