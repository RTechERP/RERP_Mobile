part of 'booking_guest_house_bloc.dart';

/// State cho màn Đặt phòng nhà nghỉ.
@CopyWith()
class BookingGuestHouseState extends BaseBlocState {
  /// Danh sách phiếu đặt phòng nhà nghỉ sau khi lọc.
  final List<BookingGuestHouseItem> bookings;

  /// Khoảng ngày hiện đang lọc.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Chuỗi tìm kiếm hiện tại (tên, SĐT, …).
  final String filterText;

  /// Loading khi refresh / pull-to-refresh.
  final bool isRefreshing;

  /// Danh sách dự án cho bộ lọc.
  final List<ProjectFilterItem> projects;

  /// Danh sách nhân viên (người đăng ký) cho bộ lọc.
  final List<EmployeeFilterItem> employees;

  /// Dự án đang được chọn lọc. Null = hiển thị tất cả.
  final ProjectFilterItem? selectedProject;

  /// Nhân viên đang được chọn lọc. Null = hiển thị tất cả.
  final EmployeeFilterItem? selectedEmployee;

  /// Loading khi tải danh sách lọc dự án / nhân viên.
  final bool isLoadingFilters;

  const BookingGuestHouseState({
    required super.status,
    super.message,
    this.bookings = const [],
    this.dateStart,
    this.dateEnd,
    this.filterText = '',
    this.isRefreshing = false,
    this.projects = const [],
    this.employees = const [],
    this.selectedProject,
    this.selectedEmployee,
    this.isLoadingFilters = false,
  });

  factory BookingGuestHouseState.init() => BookingGuestHouseState(
    status: BaseStateStatus.init,
    bookings: const [],
    dateStart: null,
    dateEnd: null,
    filterText: '',
    isRefreshing: false,
    projects: const [],
    employees: const [],
    selectedProject: null,
    selectedEmployee: null,
    isLoadingFilters: false,
  );

  @override
  List get props => [
    status,
    message,
    bookings,
    dateStart,
    dateEnd,
    filterText,
    isRefreshing,
    projects,
    employees,
    selectedProject,
    selectedEmployee,
    isLoadingFilters,
  ];
}
