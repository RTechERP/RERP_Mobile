part of 'booking_vehicle_bloc.dart';

@freezed
class BookingVehicleEvent with _$BookingVehicleEvent{
  const factory BookingVehicleEvent.init() = _Init;

  const factory BookingVehicleEvent.initAdd() = _InitAdd;
  const factory BookingVehicleEvent.preloadInitAdd() = _PreloadInitAdd;

  /// init danh sách "nhân viên n" cho form Người đi.
  const factory BookingVehicleEvent.initPassengerGoInfos() =
      _InitPassengerGoInfos;

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
}