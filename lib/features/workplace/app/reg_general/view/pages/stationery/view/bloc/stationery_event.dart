// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Events cho stationery bloc - init, load supply, slip management

part of 'stationery_bloc.dart';

@freezed
class StationeryEvent with _$StationeryEvent {
  const factory StationeryEvent.init() = _Init;

  const factory StationeryEvent.initAdd() = _InitAdd;

  /// Khởi tạo form sửa từ dữ liệu chi tiết đơn.
  const factory StationeryEvent.initEdit({
    required StationeryItem item,
    required List<StationeryDetailItem> details,
  }) = _InitEdit;

  /// Chọn VPP từ bottom sheet — cập nhật 1 slip trong danh sách.
  const factory StationeryEvent.selectSupply({
    required int slipIndex,
    required StationerySupplyItem supply,
  }) = _SelectSupply;

  /// Cập nhật số lượng của 1 slip.
  const factory StationeryEvent.updateQuantity({
    required int slipIndex,
    required int quantity,
  }) = _UpdateQuantity;

  /// Toggle checkbox vượt định mức của 1 slip.
  const factory StationeryEvent.toggleExceedsLimit({
    required int slipIndex,
    required bool exceeds,
  }) = _ToggleExceedsLimit;

  /// Cập nhật lý do vượt định mức của 1 slip.
  const factory StationeryEvent.updateReason({
    required int slipIndex,
    required String reason,
  }) = _UpdateReason;

  /// Cập nhật ghi chú của 1 slip.
  const factory StationeryEvent.updateNote({
    required int slipIndex,
    required String note,
  }) = _UpdateNote;

  /// Thêm 1 slip mới vào danh sách.
  const factory StationeryEvent.addSlip() = _AddSlip;

  /// Xoá 1 slip khỏi danh sách.
  const factory StationeryEvent.removeSlip({required int slipIndex}) = _RemoveSlip;

  /// Submit toàn bộ đơn VPP.
  const factory StationeryEvent.submitStationery({
    required DateTime dateRegister,
  }) = _SubmitStationery;

  const factory StationeryEvent.clearSubmitState() = _ClearSubmitState;

  const factory StationeryEvent.changeMonth({
    required DateTime month,
  }) = _ChangeMonth;

  const factory StationeryEvent.deleteStationery({
    required int itemId,
  }) = _DeleteStationery;
}
