part of 'test_table_bloc.dart';

/// State danh sách phiếu bàn test, lookup data, form đăng ký, trạng thái submit.
@CopyWith()
class TestTableState extends BaseBlocState {
  // ===== Danh sách =====
  final List<TestCardItem> testCard;
  final String keyword;

  /// Bộ lọc trạng thái phiếu: 0/1/2 theo BE. Mặc định 0 = Chờ duyệt.
  final int statusFilter;

  /// Khoảng ngày đăng ký (lọc danh sách).
  final DateTime? dateStart;
  final DateTime? dateEnd;

  // ===== Lookup data (cache để màn add dùng chung với list) =====
  final List<TestTableItem> testTable;
  final List<EmployeeInfoItem> employee;
  final List<ProjectItem> project;
  final List<ApproverItem> approver;

  /// User đang đăng nhập (dùng để mặc định Người đăng ký trong màn add).
  final User? currentUser;

  /// Đã fetch lookup data thành công chưa.
  /// Dùng để cache chéo giữa màn List và Add — tránh gọi lại API khi mở
  /// thẳng Add từ màn đã fetch trước đó.
  /// Phân biệt "chưa fetch" và "đã fetch thành công nhưng server trả rỗng".
  final bool lookupFetched;

  // ===== Form đăng ký (màn add) =====
  /// Dữ liệu form do bloc giữ — UI chỉ dispatch event updateForm.
  /// Payload cho check-conflict / submit được build ngầm bên trong bloc.
  final TestTableFormData formData;

  // ===== Submit / feedback =====
  /// Trạng thái đang gửi check-conflict hoặc save registration.
  final bool isSubmitting;

  /// Đã submit phiếu đăng ký thành công chưa (để màn add tự pop).
  final bool submitSuccess;

  /// Id phiếu vừa tạo (khi submit thành công).
  final int createdId;

  /// Message từ API check-conflict (khi trùng: `"Đã trùng lặp"`, khi qua: `"Không trùng lặp"`).
  /// Hiển thị feedback giữa check và save.
  final String? conflictMessage;

  /// Check-conflict đã chạy và không trùng — cho phép bấm Lưu thật sự.
  /// Reset về false khi formData đổi.
  final bool conflictPassed;

  // ===== Máy test (theo bàn test đã chọn trong màn add) =====
  /// Danh sách máy test thuộc bàn test hiện tại.
  final List<TestMachineItem> testMachines;

  /// Đang tải máy test.
  final bool isLoadingTestMachines;

  // ===== QR scan / deep link =====
  /// Bàn test tìm được từ QR (cache cho màn hình scan).
  final TestTableItem? foundTestTable;

  /// Message lỗi/thành công từ flow QR (vd: "Không tìm thấy bàn test",
  /// "Bàn đang được sử dụng"). UI scan đọc cái này để showMessage + điều hướng.
  final String? qrLookupMessage;

  const TestTableState({
    required super.status,
    super.message,
    this.testCard = const [],
    this.keyword = '',
    this.statusFilter = 0,
    this.dateStart,
    this.dateEnd,
    this.testTable = const [],
    this.employee = const [],
    this.project = const [],
    this.approver = const [],
    this.currentUser,
    this.lookupFetched = false,
    this.formData = const TestTableFormData(),
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.createdId = 0,
    this.conflictMessage,
    this.conflictPassed = false,
    this.testMachines = const [],
    this.isLoadingTestMachines = false,
    this.foundTestTable,
    this.qrLookupMessage,
  });

  factory TestTableState.init() => const TestTableState(
        status: BaseStateStatus.init,
        testCard: [],
        keyword: '',
        statusFilter: 0,
        testTable: [],
        employee: [],
        project: [],
        approver: [],
        currentUser: null,
        lookupFetched: false,
        formData: TestTableFormData(),
        isSubmitting: false,
        submitSuccess: false,
        createdId: 0,
        conflictMessage: null,
        conflictPassed: false,
        testMachines: [],
        isLoadingTestMachines: false,
        foundTestTable: null,
        qrLookupMessage: null,
      );

  @override
  List get props => [
        status,
        message,
        testCard,
        keyword,
        statusFilter,
        dateStart,
        dateEnd,
        testTable,
        employee,
        project,
        approver,
        currentUser,
        lookupFetched,
        formData,
        isSubmitting,
        submitSuccess,
        createdId,
        conflictMessage,
        conflictPassed,
        testMachines,
        isLoadingTestMachines,
        foundTestTable,
        qrLookupMessage,
      ];
}

/// Dữ liệu form đăng ký bàn test do bloc giữ.
/// Ngày kết thúc = ngày bắt đầu + 7 ngày (derive qua [endDate]).
@immutable
class TestTableFormData {
  final ProjectItem? project;
  final int? testTableId;
  /// Danh sách id máy test đã chọn (multi-select).
  final List<int> selectedMachineIds;
  final int? ownerId;
  final int? approverId;
  final DateTime? startDate;
  final String? registrationContent;

  const TestTableFormData({
    this.project,
    this.testTableId,
    this.selectedMachineIds = const [],
    this.ownerId,
    this.approverId,
    this.startDate,
    this.registrationContent,
  });

  /// Ngày kết thúc = ngày bắt đầu + 7 ngày. Trả về null nếu chưa có startDate.
  DateTime? get endDate =>
      startDate?.add(const Duration(days: 7));

  TestTableFormData copyWith({
    ProjectItem? project,
    int? testTableId,
    List<int>? selectedMachineIds,
    int? ownerId,
    int? approverId,
    DateTime? startDate,
    String? registrationContent,
    bool clearProject = false,
    bool clearTestTableId = false,
    bool clearSelectedMachineIds = false,
    bool clearOwnerId = false,
    bool clearApproverId = false,
    bool clearStartDate = false,
    bool clearRegistrationContent = false,
  }) {
    return TestTableFormData(
      project: clearProject ? null : (project ?? this.project),
      testTableId:
          clearTestTableId ? null : (testTableId ?? this.testTableId),
      selectedMachineIds: clearSelectedMachineIds
          ? const []
          : (selectedMachineIds ?? this.selectedMachineIds),
      ownerId: clearOwnerId ? null : (ownerId ?? this.ownerId),
      approverId: clearApproverId ? null : (approverId ?? this.approverId),
      startDate: clearStartDate ? null : (startDate ?? this.startDate),
      registrationContent: clearRegistrationContent
          ? null
          : (registrationContent ?? this.registrationContent),
    );
  }

  bool get isReady =>
      project != null &&
      testTableId != null &&
      ownerId != null &&
      approverId != null &&
      startDate != null;
}
