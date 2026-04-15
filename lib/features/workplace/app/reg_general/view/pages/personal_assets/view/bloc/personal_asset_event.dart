part of 'personal_asset_bloc.dart';

@freezed
class PersonalAssetEvent with _$PersonalAssetEvent {
  const factory PersonalAssetEvent.init() = _Init;

  const factory PersonalAssetEvent.fetchAssets() = _FetchAssets;

  const factory PersonalAssetEvent.fetchProperties() = _FetchProperties;

  const factory PersonalAssetEvent.searchAssets({
    required String filterText,
  }) = _SearchAssets;

  const factory PersonalAssetEvent.filterPropertyCategory({
    required int category,
  }) = _FilterPropertyCategory;

  const factory PersonalAssetEvent.fetchPropertyDetail({
    required int assetId,
    required int assetCategory,
  }) = _FetchPropertyDetail;

  const factory PersonalAssetEvent.approveProperty({
    required int deliverId,
    required int assetId,
    required int approveType,
  }) = _ApproveProperty;
}
