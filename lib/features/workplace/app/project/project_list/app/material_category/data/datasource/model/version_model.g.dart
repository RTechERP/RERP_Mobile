// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VersionModelImpl _$$VersionModelImplFromJson(Map<String, dynamic> json) =>
    _$VersionModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      code: json['Code'] as String?,
      descriptionVersion: json['DescriptionVersion'] as String?,
      isActive: json['IsActive'] as bool?,
      createdDate: json['CreatedDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      projectSolutionId: (json['ProjectSolutionID'] as num?)?.toInt(),
      projectTypeId: (json['ProjectTypeID'] as num?)?.toInt(),
      statusVersion: (json['StatusVersion'] as num?)?.toInt(),
      isApproved: json['IsApproved'] as bool?,
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
      reasonDeleted: json['ReasonDeleted'] as String?,
      isConsumable: json['IsConsumable'] as bool?,
      projectHistoryProblemId:
          (json['ProjectHistoryProblemID'] as num?)?.toInt(),
      isProblem: json['IsProblem'] as bool?,
      isApprovedTbp: json['IsApprovedTBP'] as bool?,
      approvedTbpDate: json['ApprovedTBPDate'] as String?,
      approvedTbpId: (json['ApprovedTBPID'] as num?)?.toInt(),
      statusVersionText: json['StatusVersionText'] as String?,
      projectTypeCode: json['ProjectTypeCode'] as String?,
      projectTypeName: json['ProjectTypeName'] as String?,
      codeNew: json['CodeNew'] as String?,
      fullNameCreated: json['FullNameCreated'] as String?,
    );

Map<String, dynamic> _$$VersionModelImplToJson(_$VersionModelImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectID': instance.projectId,
      'STT': instance.stt,
      'Code': instance.code,
      'DescriptionVersion': instance.descriptionVersion,
      'IsActive': instance.isActive,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
      'ProjectSolutionID': instance.projectSolutionId,
      'ProjectTypeID': instance.projectTypeId,
      'StatusVersion': instance.statusVersion,
      'IsApproved': instance.isApproved,
      'ApprovedID': instance.approvedId,
      'IsDeleted': instance.isDeleted,
      'ReasonDeleted': instance.reasonDeleted,
      'IsConsumable': instance.isConsumable,
      'ProjectHistoryProblemID': instance.projectHistoryProblemId,
      'IsProblem': instance.isProblem,
      'IsApprovedTBP': instance.isApprovedTbp,
      'ApprovedTBPDate': instance.approvedTbpDate,
      'ApprovedTBPID': instance.approvedTbpId,
      'StatusVersionText': instance.statusVersionText,
      'ProjectTypeCode': instance.projectTypeCode,
      'ProjectTypeName': instance.projectTypeName,
      'CodeNew': instance.codeNew,
      'FullNameCreated': instance.fullNameCreated,
    };
