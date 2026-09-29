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

  /// Refresh ngầm sau khi duyệt/huỷ duyệt thành công — không emit loading,
  /// không đè message hiện tại.
  const factory MaterialCategoryEvent.refreshAfterApprove() =
      _RefreshAfterApprove;
}
