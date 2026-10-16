// Date: 16/10/2026
// Nội dung/Chức năng: State cho rental vehicle bloc.

part of 'rental_vehicle_bloc.dart';

@CopyWith()
class RentalVehicleState extends BaseBlocState {
  /// Danh sách yêu cầu thuê xe tải.
  final List<RentalVehicleItem> rentalVehicles;

  /// Ngày bắt đầu lọc.
  final DateTime? dateStart;

  /// Ngày kết thúc lọc.
  final DateTime? dateEnd;

  /// Từ khoá tìm kiếm hiện tại.
  final String keyword;

  /// Danh sách nhân viên dùng dropdown ở add/detail screen.
  final List<RentalVehicleEmployee> employees;

  /// Danh sách phòng ban dùng dropdown ở add/detail screen.
  final List<RentalVehicleDepartment> departments;

  /// Phòng ban đang được chọn để lọc (0 = tất cả).
  final int selectedDepartmentId;

  /// Người yêu cầu đang được chọn để lọc (0 = tất cả).
  final int selectedRequesterId;

  /// Người đặt đang được chọn để lọc (0 = tất cả).
  final int selectedBookerId;

  // ===== Add screen fields =====

  /// Danh sách dự án cho dropdown.
  final List<RentalVehicleProject> projects;

  /// Loại xe đã chọn trên màn add (VehicleType id).
  final int? selectedVehicleTypeId;

  /// Người yêu cầu đã chọn trên màn add.
  final int? selectedRequesterIdOnAdd;

  /// STT kế tiếp cho dòng mới (max trong list + 1).
  final int nextStt;

  /// Trạng thái submit đang xử lý.
  final bool isSubmitting;

  /// Submit thành công.
  final bool submitSuccess;

  const RentalVehicleState({
    required super.status,
    super.message,
    this.rentalVehicles = const [],
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
    this.employees = const [],
    this.departments = const [],
    this.selectedDepartmentId = 0,
    this.selectedRequesterId = 0,
    this.selectedBookerId = 0,
    this.projects = const [],
    this.selectedVehicleTypeId,
    this.selectedRequesterIdOnAdd,
    this.nextStt = 1,
    this.isSubmitting = false,
    this.submitSuccess = false,
  });

  factory RentalVehicleState.init() => const RentalVehicleState(
        status: BaseStateStatus.init,
        rentalVehicles: [],
        dateStart: null,
        dateEnd: null,
        keyword: '',
        employees: [],
        departments: [],
        selectedDepartmentId: 0,
        selectedRequesterId: 0,
        selectedBookerId: 0,
        projects: [],
        selectedVehicleTypeId: null,
        selectedRequesterIdOnAdd: null,
        nextStt: 1,
        isSubmitting: false,
        submitSuccess: false,
      );

  @override
  List get props => [
        status,
        message,
        rentalVehicles,
        dateStart,
        dateEnd,
        keyword,
        employees,
        departments,
        selectedDepartmentId,
        selectedRequesterId,
        selectedBookerId,
        projects,
        selectedVehicleTypeId,
        selectedRequesterIdOnAdd,
        nextStt,
        isSubmitting,
        submitSuccess,
      ];
}
