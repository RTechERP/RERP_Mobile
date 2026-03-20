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

  /// expand/collapse dòng nhân viên theo index.
  const factory BookingVehicleEvent.expandPassengerGoInfo({
    required int index,
  }) = _ExpandPassengerGoInfo;

  /// Xoá dòng "nhân viên n" theo index.
  const factory BookingVehicleEvent.deletePassengerGoInfo({
    required int index,
  }) = _DeletePassengerGoInfo;

  /// init danh sách "người nhận n" cho form giao hàng thương mại.
  const factory BookingVehicleEvent.initCommercialReceiverInfos() =
      _InitCommercialReceiverInfos;

  /// thêm một dòng mới "người nhận n" với field rỗng.
  const factory BookingVehicleEvent.addCommercialReceiverInfo() =
      _AddCommercialReceiverInfo;

  /// expand/collapse dòng người nhận theo index.
  const factory BookingVehicleEvent.expandCommercialReceiverInfo({
    required int index,
  }) = _ExpandCommercialReceiverInfo;

  /// Xoá dòng "người nhận n" theo index.
  const factory BookingVehicleEvent.deleteCommercialReceiverInfo({
    required int index,
  }) = _DeleteCommercialReceiverInfo;
}