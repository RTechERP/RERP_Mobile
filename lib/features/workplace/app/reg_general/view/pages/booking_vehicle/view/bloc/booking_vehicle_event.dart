part of 'booking_vehicle_bloc.dart';

@freezed
class BookingVehicleEvent with _$BookingVehicleEvent{
  const factory BookingVehicleEvent.init() = _Init;

  const factory BookingVehicleEvent.initAdd() = _InitAdd;
  const factory BookingVehicleEvent.preloadInitAdd() = _PreloadInitAdd;

  /// init danh sách "nhân viên n" cho form Người đi.
  const factory BookingVehicleEvent.initPassengerGoInfos() =
      _InitPassengerGoInfos;

  /// Giống [initPassengerGoInfos] nhưng không gán dòng 0 = user hiện tại (màn sửa).
  const factory BookingVehicleEvent.initPassengerGoInfosForEdit() =
      _InitPassengerGoInfosForEdit;

  /// thêm một dòng mới "nhân viên n" với field rỗng.
  const factory BookingVehicleEvent.addPassengerGoInfo() = _AddPassengerGoInfo;

  /// expand/collapse theo index dòng 0..n-1.
  const factory BookingVehicleEvent.expandPassengerGoInfo({
    required int index,
  }) = _ExpandPassengerGoInfo;

  /// Xoá dòng theo index vị trí 0..n-1 (sau xoá các dòng sau đẩy lên, index lùi 1).
  const factory BookingVehicleEvent.deletePassengerGoInfo({
    required int index,
  }) = _DeletePassengerGoInfo;

  /// init danh sách "người nhận n" cho form giao hàng thương mại.
  const factory BookingVehicleEvent.initCommercialReceiverInfos() =
      _InitCommercialReceiverInfos;

  /// thêm một dòng mới "người nhận n" với field rỗng.
  const factory BookingVehicleEvent.addCommercialReceiverInfo() =
      _AddCommercialReceiverInfo;

  /// expand/collapse theo index dòng 0..n-1.
  const factory BookingVehicleEvent.expandCommercialReceiverInfo({
    required int index,
  }) = _ExpandCommercialReceiverInfo;

  /// Xoá dòng theo index vị trí (field form được dịch lên trước khi emit).
  const factory BookingVehicleEvent.deleteCommercialReceiverInfo({
    required int index,
  }) = _DeleteCommercialReceiverInfo;

  /// init danh sách "người giao n" (lấy hàng thương mại / Demo).
  const factory BookingVehicleEvent.initPickupGiverInfos() =
      _InitPickupGiverInfos;

  const factory BookingVehicleEvent.addPickupGiverInfo() =
      _AddPickupGiverInfo;

  const factory BookingVehicleEvent.expandPickupGiverInfo({
    required int index,
  }) = _ExpandPickupGiverInfo;

  const factory BookingVehicleEvent.deletePickupGiverInfo({
    required int index,
  }) = _DeletePickupGiverInfo;

  /// Merge snapshot field phần Form chung vào state (đồng bộ với [TypeFormPassengerGo] / …).
  const factory BookingVehicleEvent.updateForm({
    required Map<String, dynamic> values,
  }) = _UpdateForm;

  /// Merge snapshot field từng dòng Info vào state ([PassengerInfoItem], [ReceiverPackageInfoItem], …).
  const factory BookingVehicleEvent.updateInfo({
    required Map<String, dynamic> values,
  }) = _UpdateInfo;

  /// Gửi đăng ký **Người đi** — body map từ `FormBuilder.saveAndValidate().value`.
  const factory BookingVehicleEvent.submitPassengerGo({
    required Map<String, dynamic> formValues,
    @Default(null) int? existingBookingId,
  }) = _SubmitPassengerGo;

  /// Gửi đăng ký **Người về** — `Category` = 5 (`BookingVehicleApiCategory.passengerReturn`).
  const factory BookingVehicleEvent.submitPassengerReturn({
    required Map<String, dynamic> formValues,
    @Default(null) int? existingBookingId,
  }) = _SubmitPassengerReturn;

  /// Giao hàng thương mại / Demo — `Category` 2 hoặc 8 theo `booking_type`.
  const factory BookingVehicleEvent.submitCommercialDelivery({
    required Map<String, dynamic> formValues,
    @Default(null) int? existingBookingId,
  }) = _SubmitCommercialDelivery;

  /// Lấy hàng thương mại / Demo — `Category` 6 hoặc 7 theo `booking_type`.
  const factory BookingVehicleEvent.submitCommercialPickup({
    required Map<String, dynamic> formValues,
    @Default(null) int? existingBookingId,
  }) = _SubmitCommercialPickup;

  /// Xoá cờ submit (vào lại màn add / shell dùng chung bloc).
  const factory BookingVehicleEvent.clearSubmitResult() = _ClearSubmitResult;

  /// Huỷ đăng ký đặt xe (API `vehicle-booking-cancel`).
  const factory BookingVehicleEvent.cancelBookingVehicle({
    required int vehicleBookingId,
  }) = _CancelBookingVehicle;
}