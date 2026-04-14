
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_asset_model.freezed.dart';
part 'personal_asset_model.g.dart';

/// Tài sản cá nhân.
@freezed
class PersonalAssetItem with _$PersonalAssetItem {
  const factory PersonalAssetItem({
    @JsonKey(name: 'AssetCode') String? assetCode,
    @JsonKey(name: 'AssetType') String? assetType,
    @JsonKey(name: 'DateBuy') DateTime? dateBuy,
    @JsonKey(name: 'Seri') String? seri,
    @JsonKey(name: 'SourceCode') String? sourceCode,
    @JsonKey(name: 'Status') String? status,
    @JsonKey(name: 'TSAssetCode') String? tsAssetCode,
    @JsonKey(name: 'TSAssetName') String? tsAssetName,
    @JsonKey(name: 'TSCodeNCC') String? tsCodeNCC,
    @JsonKey(name: 'UnitName') String? unitName,
  }) = _PersonalAssetItem;

  factory PersonalAssetItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalAssetItemFromJson(json);
}

/// Biên bản bàn giao / thu hồi tài sản.
@freezed
class PersonalPropertyItem with _$PersonalPropertyItem {
  const factory PersonalPropertyItem({
    @JsonKey(name: 'AssetCategory') String? assetCategory,
    @JsonKey(name: 'AssetCategorytext') String? assetCategoryText,
    @JsonKey(name: 'AssetCode') String? assetCode,
    @JsonKey(name: 'AssetID') int? assetId,
    @JsonKey(name: 'AssetNote') String? assetNote,
    @JsonKey(name: 'DeliverID') int? deliverId,
    @JsonKey(name: 'DeliverName') String? deliverName,
    @JsonKey(name: 'DepartmentDeliver') String? departmentDeliver,
    @JsonKey(name: 'DepartmentReceiver') String? departmentReceiver,
    @JsonKey(name: 'ImplementationDate') DateTime? implementationDate,
    @JsonKey(name: 'IsApproveAccountant') bool? isApproveAccountant,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'IsApprovedPersonalProperty') bool? isApprovedPersonalProperty,
    @JsonKey(name: 'PossitionDeliver') String? possitionDeliver,
  }) = _PersonalPropertyItem;

  factory PersonalPropertyItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalPropertyItemFromJson(json);
}