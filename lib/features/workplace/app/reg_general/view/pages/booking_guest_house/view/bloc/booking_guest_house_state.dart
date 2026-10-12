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

  /// Danh sách công ty phát hành hóa đơn — picker "Công ty"
  /// trong form Cập nhật TTQT + Đề nghị tạm ứng.
  final List<TaxCompanyItem> taxCompanies;

  /// Danh sách ngân hàng — picker "Ngân hàng" trong
  /// form Cập nhật TTQT + Đề nghị tạm ứng.
  final List<BankItem> banks;

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

  /// Loading khi tải chi tiết TTQT theo `accommodationBookingId`.
  final bool isLoadingPaymentDetail;

  /// Chi tiết TTQT (null = chưa tải, chưa có, hoặc lỗi).
  /// `null` cũng bao gồm trường hợp "chưa có TTQT" (DetailStatus = 0
  /// hoặc response rỗng) — UI hiểu là giữ form rỗng.
  final BookingGuestHousePaymentDetailItem? paymentDetail;

  /// Lỗi khi tải chi tiết TTQT (null = OK hoặc "chưa có TTQT").
  /// Chỉ set khi service thật sự fail (status != 1).
  final String? paymentDetailMessage;

  /// Loading khi gửi đề nghị tạm ứng (ĐNTU).
  final bool isSubmittingAdvance;

  /// Cờ submit advance thành công — UI dùng để hiện toast + pop.
  final bool advanceSuccess;

  /// Response cuối cùng từ API create-advance (mã ĐNTU + IsRecreated).
  /// Dùng để UI hiển thị message phù hợp ("Tạo mới" / "Tạo lại").
  final BookingGuestHouseAdvanceResponse? lastAdvanceResponse;

  /// Thông báo từ lần submit advance gần nhất (success message từ BE).
  final String? advanceMessage;

  /// Loading khi lưu cập nhật TT Quyết toán (TTQT) standalone.
  final bool isSubmittingSettlement;

  /// Cờ lưu TTQT thành công — UI dùng để hiện toast + pop.
  final bool settlementSuccess;

  /// Response cuối từ API save-standalone-detail (ID + DetailStatus).
  final BookingGuestHouseSaveDetailResponse? lastSettlementResponse;

  /// Thông báo từ lần lưu TTQT gần nhất (success message từ BE).
  final String? settlementMessage;

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
    this.taxCompanies = const [],
    this.banks = const [],
    this.selectedProject,
    this.selectedEmployee,
    this.isLoadingFilters = false,
    this.isDetailLoading = false,
    this.detailData,
    this.detailMessage,
    this.isLoadingPaymentDetail = false,
    this.paymentDetail,
    this.paymentDetailMessage,
    this.isSubmittingAdvance = false,
    this.advanceSuccess = false,
    this.lastAdvanceResponse,
    this.advanceMessage,
    this.isSubmittingSettlement = false,
    this.settlementSuccess = false,
    this.lastSettlementResponse,
    this.settlementMessage,
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
    taxCompanies: const [],
    banks: const [],
    selectedProject: null,
    selectedEmployee: null,
    isLoadingFilters: false,
    isDetailLoading: false,
    detailData: null,
    detailMessage: null,
    isLoadingPaymentDetail: false,
    paymentDetail: null,
    paymentDetailMessage: null,
    isSubmittingAdvance: false,
    advanceSuccess: false,
    lastAdvanceResponse: null,
    advanceMessage: null,
    isSubmittingSettlement: false,
    settlementSuccess: false,
    lastSettlementResponse: null,
    settlementMessage: null,
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
    taxCompanies,
    banks,
    selectedProject,
    selectedEmployee,
    isLoadingFilters,
    isDetailLoading,
    detailData,
    detailMessage,
    isLoadingPaymentDetail,
    paymentDetail,
    paymentDetailMessage,
    isSubmittingAdvance,
    advanceSuccess,
    lastAdvanceResponse,
    advanceMessage,
    isSubmittingSettlement,
    settlementSuccess,
    lastSettlementResponse,
    settlementMessage,
  ];
}