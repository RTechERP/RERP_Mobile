// Date: 16/10/2026
// Nội dung/Chức năng: Events cho rental vehicle bloc - load danh sách yêu cầu thuê xe tải.

part of 'rental_vehicle_bloc.dart';

@freezed
class RentalVehicleEvent with _$RentalVehicleEvent {
  /// Tải danh sách yêu cầu thuê xe tải với khoảng ngày mặc định (tháng hiện tại).
  const factory RentalVehicleEvent.init() = _Init;

  /// Thay đổi khoảng ngày lọc → trigger lại API với ngày mới.
  const factory RentalVehicleEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Tìm kiếm theo từ khoá (tên nhân viên / dự án / nhà cung cấp / ...).
  const factory RentalVehicleEvent.search({
    required String keyword,
  }) = _Search;

  /// Tải đồng thời Employee + Department (gọi khi mở add/detail screen).
  const factory RentalVehicleEvent.loadAll() = _LoadAll;

  /// Chỉ tải Employee theo filter.
  const factory RentalVehicleEvent.loadEmployees({
    required int status,
    required int departmentId,
    required String keyword,
  }) = _LoadEmployees;

  /// Chỉ tải Department.
  const factory RentalVehicleEvent.loadDepartments() = _LoadDepartments;

  /// Chọn phòng ban để lọc (0 = tất cả).
  const factory RentalVehicleEvent.selectDepartment(int departmentId) =
      _SelectDepartment;

  /// Chọn người yêu cầu để lọc (0 = tất cả).
  const factory RentalVehicleEvent.selectRequester(int employeeId) =
      _SelectRequester;

  /// Chọn người đặt để lọc (0 = tất cả).
  const factory RentalVehicleEvent.selectBooker(int employeeId) =
      _SelectBooker;

  // ===== Add screen events =====

  /// Init add screen: tải employee + project + vehicle types + tính STT kế tiếp.
  const factory RentalVehicleEvent.initAdd() = _InitAdd;

  /// Chọn người yêu cầu trên màn add (để hiện departmentName).
  const factory RentalVehicleEvent.selectRequesterOnAdd(int employeeId) =
      _SelectRequesterOnAdd;

  /// Submit form add.
  const factory RentalVehicleEvent.submitAdd({
    required Map<String, dynamic> formValues,
  }) = _SubmitAdd;

  /// Reset trạng thái submit.
  const factory RentalVehicleEvent.clearSubmitResult() = _ClearSubmitResult;
}
