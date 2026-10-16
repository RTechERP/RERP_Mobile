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
}
