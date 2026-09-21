// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolutionModelImpl _$$SolutionModelImplFromJson(Map<String, dynamic> json) =>
    _$SolutionModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectRequestId: (json['ProjectRequestID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      dateSolution: json['DateSolution'] as String?,
      codeSolution: json['CodeSolution'] as String?,
      contentSolution: json['ContentSolution'] as String?,
      note: json['Note'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      statusSolution: (json['StatusSolution'] as num?)?.toInt(),
      isApprovedPrice: json['IsApprovedPrice'] as bool?,
      isApprovedPO: json['IsApprovedPO'] as bool?,
      employeeApprovedPriceId:
          (json['EmployeeApprovedPriceID'] as num?)?.toInt(),
      employeeApprovedPOId: (json['EmployeeApprovedPOID'] as num?)?.toInt(),
      priceReportDeadline: json['PriceReportDeadline'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      codeRequest: json['CodeRequest'] as String?,
      sttRequest: (json['STTRequest'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
    );

Map<String, dynamic> _$$SolutionModelImplToJson(_$SolutionModelImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectRequestID': instance.projectRequestId,
      'STT': instance.stt,
      'DateSolution': instance.dateSolution,
      'CodeSolution': instance.codeSolution,
      'ContentSolution': instance.contentSolution,
      'Note': instance.note,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate,
      'StatusSolution': instance.statusSolution,
      'IsApprovedPrice': instance.isApprovedPrice,
      'IsApprovedPO': instance.isApprovedPO,
      'EmployeeApprovedPriceID': instance.employeeApprovedPriceId,
      'EmployeeApprovedPOID': instance.employeeApprovedPOId,
      'PriceReportDeadline': instance.priceReportDeadline,
      'IsDeleted': instance.isDeleted,
      'CodeRequest': instance.codeRequest,
      'STTRequest': instance.sttRequest,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
    };
