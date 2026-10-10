part of 'material_category_bloc.dart';

@freezed
class MaterialCategoryEvent with _$MaterialCategoryEvent {
  const factory MaterialCategoryEvent.init({
    required int projectId,
    required int projectPartListVersionId,
    required int projectTypeId,
    String? keyword,
  }) = _Init;
  const factory MaterialCategoryEvent.refresh() = _Refresh;
  const factory MaterialCategoryEvent.search({
    String? keyword,
  }) = _Search;
  const factory MaterialCategoryEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  /// Huỷ duyệt mới (TBP) cho 1 vật tư trong danh sách đang hiển thị.
  /// Emitter sẽ tự refresh lại list sau khi API trả về thành công.
  const factory MaterialCategoryEvent.cancelApproveNew({
    required PartListModel item,
  }) = _CancelApproveNew;

  /// Duyệt mới (TBP) cho 1 vật tư.
  /// Flow 2 bước: gọi API check trước; nếu message == "Đã xử lý thành công!"
  /// thì gọi tiếp API duyệt. Sau khi duyệt thành công sẽ tự refresh list.
  const factory MaterialCategoryEvent.approveNew({
    required PartListModel item,
  }) = _ApproveNew;

  /// Duyệt / huỷ duyệt tích xanh cho 1 vật tư.
  /// isFix=true  → duyệt tích xanh.
  /// isFix=false → huỷ duyệt tích xanh.
  const factory MaterialCategoryEvent.approveFix({
    required PartListModel item,
    required bool isFix,
  }) = _ApproveFix;

  /// Refresh ngầm sau khi duyệt/huỷ duyệt thành công — không emit loading,
  /// không đè message hiện tại.
  const factory MaterialCategoryEvent.refreshAfterApprove({
    required String message,
  }) = _RefreshAfterApprove;

  /// Yêu cầu chuyển kho cho nhiều vật tư sang kho [warehouseCode].
  /// [warehouseCode] = "HN" | "HCM" | "BN" | "HP" | "DP".
  /// Emit success ngay khi API trả 200 + refresh list để cập nhật tồn kho.
  const factory MaterialCategoryEvent.requestExportTransfer({
    required String warehouseCode,
    required List<PartListModel> items,
  }) = _RequestExportTransfer;
}
