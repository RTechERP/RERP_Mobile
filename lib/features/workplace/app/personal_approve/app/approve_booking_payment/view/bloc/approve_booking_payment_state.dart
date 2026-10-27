part of 'approve_booking_payment_bloc.dart';

/// State cho màn Duyệt ĐNTT Đặt xe / Nhà nghỉ.
@CopyWith()
class ApproveBookingPaymentState extends BaseBlocState {
  /// Số dòng mỗi trang gửi lên API.
  static const int pageSize = 50;

  /// Các trang ĐNTT đã tải (chưa áp lọc phòng ban client-side).
  final List<ApproveBookingPaymentItem> items;

  /// Các bước duyệt từ API (get-approve-steps).
  final List<ApproveBookingPaymentStep> steps;

  /// Lookup phòng ban / nhân viên cho sheet bộ lọc.
  final List<ApproveBookingPaymentDepartment> departments;
  final List<ApproveBookingPaymentEmployee> employees;

  /// Bộ lọc đang áp dụng. `null` = không lọc theo tiêu chí đó.
  final ApproveBookingPaymentDepartment? selectedDepartment;
  final ApproveBookingPaymentEmployee? selectedEmployee;

  /// Bước duyệt đang lọc (gửi `ApproverCode` lên API).
  final ApproveBookingPaymentStep? selectedStep;

  /// Loại nội dung đang lọc (khớp `TypeName` của phiếu, lọc client-side).
  final String? selectedTypeName;
  final String keyword;

  /// Khoảng ngày đang lọc.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Trang đã tải gần nhất (bắt đầu từ 1) và còn trang kế tiếp hay không.
  final int pageIndex;
  final bool hasMore;

  /// Tổng số dòng theo BE (đã áp lọc server-side).
  final int totalRows;

  /// `true` khi pull-to-refresh / đang tải thêm trang.
  final bool isRefreshing;
  final bool isLoadingMore;

  const ApproveBookingPaymentState({
    required super.status,
    super.message,
    this.items = const [],
    this.steps = const [],
    this.departments = const [],
    this.employees = const [],
    this.selectedDepartment,
    this.selectedEmployee,
    this.selectedStep,
    this.selectedTypeName,
    this.keyword = '',
    this.dateStart,
    this.dateEnd,
    this.pageIndex = 1,
    this.hasMore = false,
    this.totalRows = 0,
    this.isRefreshing = false,
    this.isLoadingMore = false,
  });

  factory ApproveBookingPaymentState.init() =>
      const ApproveBookingPaymentState(status: BaseStateStatus.init);

  /// Mặc định: 6 tháng gần nhất tính đến hôm nay.
  static DateTime defaultStart() {
    final now = DateTime.now();
    return DateTime(now.year, now.month - 6, now.day);
  }

  static DateTime defaultEnd() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// Items sau khi áp lọc phòng ban và loại nội dung (client-side).
  List<ApproveBookingPaymentItem> get visibleItems {
    final deptId = selectedDepartment?.id;
    final type = selectedTypeName;
    if (deptId == null && type == null) return items;
    return items
        .where(
          (i) =>
              (deptId == null || i.departmentId == deptId) &&
              (type == null || (i.typeName ?? '').trim() == type),
        )
        .toList(growable: false);
  }

  /// Số tiêu chí trong sheet đang bật (loại nội dung, bước duyệt, phòng ban,
  /// người tạo, từ khoá).
  int get activeFilterCount =>
      (selectedTypeName != null ? 1 : 0) +
      (selectedStep != null ? 1 : 0) +
      (selectedDepartment != null ? 1 : 0) +
      (selectedEmployee != null ? 1 : 0) +
      (keyword.isNotEmpty ? 1 : 0);

  @override
  List get props => [
        status,
        message,
        items,
        steps,
        departments,
        employees,
        selectedDepartment,
        selectedEmployee,
        selectedStep,
        selectedTypeName,
        keyword,
        dateStart,
        dateEnd,
        pageIndex,
        hasMore,
        totalRows,
        isRefreshing,
        isLoadingMore,
      ];
}
