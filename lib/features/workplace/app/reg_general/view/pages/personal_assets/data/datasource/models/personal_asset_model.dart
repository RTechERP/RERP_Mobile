
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
    @JsonKey(name: 'AssetID') int? assetId,
    @JsonKey(name: 'DeliverID') int? deliverId,
    @JsonKey(name: 'ReceiverID') int? receiverId,
    @JsonKey(name: 'IsApprovedPersonalProperty')  bool? isApprovedPersonalProperty,
    @JsonKey(name: 'AssetCategory') int? assetCategory,
    @JsonKey(name: 'AssetCode')  String? assetCode,
    @JsonKey(name: 'ImplementationDate') DateTime? implementationDate,
    @JsonKey(name: 'AssetNote') String? assetNote,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'IsApproveAccountant') bool? isApproveAccountant,
    @JsonKey(name: 'DeliverName') String? deliverName,
    @JsonKey(name: 'DepartmentDeliver') String? departmentDeliver,
    @JsonKey(name: 'PossitionDeliver') String? possitionDeliver,
    @JsonKey(name: 'ReceiverName') String? receiverName,
    @JsonKey(name: 'DepartmentReceiver') String? departmentReceiver,
    @JsonKey(name: 'PossitionReceiver') String? possitionReceiver,
    @JsonKey(name: 'AssetCategorytext') String? assetCategoryText,
  }) = _PersonalPropertyItem;

  factory PersonalPropertyItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalPropertyItemFromJson(json);
}

/// Chi tiết: Biên bản bàn giao / thu hồi tài sản.
@freezed
class DetailPersonalPropertyItem with _$DetailPersonalPropertyItem {
  const factory DetailPersonalPropertyItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'TSAssetAllocationID') int? tsAssetAllocationId,
    @JsonKey(name: 'AssetManagementID') required int assetManagementId,
    @JsonKey(name: 'STT') required int stt,
    @JsonKey(name: 'Quantity') required int quantity,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'TSAllAssetID') int? tsAllAssetId,
    @JsonKey(name: 'TSCodeNCC') String? tsCodeNcc,
    @JsonKey(name: 'TSAssetName') String? tsAssetName,
    @JsonKey(name: 'UnitName') String? unitName,
    @JsonKey(name: 'Status') String? status,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'PositionName') String? positionName,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
    @JsonKey(name: 'DepartmentID') int? departmentId,
  }) = _DetailPersonalPropertyItem;

  factory DetailPersonalPropertyItem.fromJson(Map<String, dynamic> json) =>
      _$DetailPersonalPropertyItemFromJson(json);
}