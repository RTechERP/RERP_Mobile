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

  /// Loading khi submit form lưu phiếu.
  final bool isSubmitting;

  /// Cờ đánh dấu submit thành công — UI dùng để pop về màn list.
  final bool submitSuccess;

  /// ID phiếu vừa lưu thành công (null = chưa submit hoặc submit lỗi).
  final int? lastSubmittedId;

  /// Cờ đánh dấu xoá thành công — UI dùng để báo toast.
  final bool deleteSuccess;

  /// Danh sách dự án cho bộ lọc.
  final List<ProjectFilterItem> projects;

  /// Danh sách nhân viên (người đăng ký) cho bộ lọc.
  final List<EmployeeFilterItem> employees;

  /// Danh sách tỉnh/thành cho bộ lọc lưu trú.
  final List<ProvinceFilterItem> provinces;

  /// Dự án đang được chọn lọc. Null = hiển thị tất cả.
  final ProjectFilterItem? selectedProject;

  /// Nhân viên đang được chọn lọc. Null = hiển thị tất cả.
  final EmployeeFilterItem? selectedEmployee;

  /// Loading khi tải danh sách lọc dự án / nhân viên.
  final bool isLoadingFilters;

  /// Loading khi tải chi tiết 1 phiếu (màn detail).
  final bool isDetailLoading;

  /// Chi tiết 1 phiếu (kèm danh sách người ở) — null = chưa load hoặc load lỗi.
  final BookingGuestHouseDetailData? detailData;

  /// Lỗi khi tải chi tiết phiếu (null = OK).
  final String? detailMessage;

  const BookingGuestHouseState({
    required super.status,
    super.message,
    this.bookings = const [],
    this.dateStart,
    this.dateEnd,
    this.filterText = '',
    this.isRefreshing = false,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.lastSubmittedId,
    this.deleteSuccess = false,
    this.projects = const [],
    this.employees = const [],
    this.provinces = const [],
    this.selectedProject,
    this.selectedEmployee,
    this.isLoadingFilters = false,
    this.isDetailLoading = false,
    this.detailData,
    this.detailMessage,
  });

  factory BookingGuestHouseState.init() => BookingGuestHouseState(
    status: BaseStateStatus.init,
    bookings: const [],
    dateStart: null,
    dateEnd: null,
    filterText: '',
    isRefreshing: false,
    isSubmitting: false,
    submitSuccess: false,
    lastSubmittedId: null,
    deleteSuccess: false,
    projects: const [],
    employees: const [],
    provinces: const [],
    selectedProject: null,
    selectedEmployee: null,
    isLoadingFilters: false,
    isDetailLoading: false,
    detailData: null,
    detailMessage: null,
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
    isSubmitting,
    submitSuccess,
    lastSubmittedId,
    deleteSuccess,
    projects,
    employees,
    provinces,
    selectedProject,
    selectedEmployee,
    isLoadingFilters,
    isDetailLoading,
    detailData,
    detailMessage,
  ];
}