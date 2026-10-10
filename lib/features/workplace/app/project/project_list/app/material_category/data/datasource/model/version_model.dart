import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_model.freezed.dart';
part 'version_model.g.dart';

/// Model API response cho danh sách Phiên bản (Version).
/// API: GET /ProjectPartListVersion/get-all?projectSolutionId={id}&isPO={bool}
@freezed
class VersionModel with _$VersionModel {
  const factory VersionModel({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'DescriptionVersion') String? descriptionVersion,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CreatedDate') String? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') String? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'ProjectSolutionID') int? projectSolutionId,
    @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
    @JsonKey(name: 'StatusVersion') int? statusVersion,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'ReasonDeleted') String? reasonDeleted,
    @JsonKey(name: 'IsConsumable') bool? isConsumable,
    @JsonKey(name: 'ProjectHistoryProblemID') int? projectHistoryProblemId,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTbp,
    @JsonKey(name: 'ApprovedTBPDate') String? approvedTbpDate,
    @JsonKey(name: 'ApprovedTBPID') int? approvedTbpId,
    @JsonKey(name: 'StatusVersionText') String? statusVersionText,
    @JsonKey(name: 'ProjectTypeCode') String? projectTypeCode,
    @JsonKey(name: 'ProjectTypeName') String? projectTypeName,
    @JsonKey(name: 'CodeNew') String? codeNew,
    @JsonKey(name: 'FullNameCreated') String? fullNameCreated,
  }) = _VersionModel;

  factory VersionModel.fromJson(Map<String, dynamic> json) =>
      _$VersionModelFromJson(json);
}
