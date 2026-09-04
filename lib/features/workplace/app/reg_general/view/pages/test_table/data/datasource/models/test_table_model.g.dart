// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestTableItemImpl _$$TestTableItemImplFromJson(Map<String, dynamic> json) =>
    _$TestTableItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      registrationCode: json['RegistrationCode'] as String?,
      testTableId: (json['TestTableID'] as num?)?.toInt(),
      testTableName: json['TestTableName'] as String?,
      tableSide: (json['TableSide'] as num?)?.toInt(),
      registrationStartDate: json['RegistrationStartDate'] == null
          ? null
          : DateTime.parse(json['RegistrationStartDate'] as String),
      projectCode: json['ProjectCode'] as String?,
      registrationContent: json['RegistrationContent'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      detailId: (json['DetailID'] as num?)?.toInt(),
      no: (json['No'] as num?)?.toInt(),
      type: (json['Type'] as num?)?.toInt(),
      detailStartDate: json['DetailStartDate'] == null
          ? null
          : DateTime.parse(json['DetailStartDate'] as String),
      detailEndDate: json['DetailEndDate'] == null
          ? null
          : DateTime.parse(json['DetailEndDate'] as String),
      actualReturnDate: json['ActualReturnDate'] == null
          ? null
          : DateTime.parse(json['ActualReturnDate'] as String),
      ownerId: (json['OwnerID'] as num?)?.toInt(),
      ownerFullName: json['OwnerFullName'] as String?,
      ownerPhone: json['OwnerSDTCaNhan'] as String?,
      ownerCode: json['OwnerCode'] as String?,
      approverId: (json['ApproverID'] as num?)?.toInt(),
      approverFullName: json['ApproverFullName'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      approveDate: json['ApproveDate'] == null
          ? null
          : DateTime.parse(json['ApproveDate'] as String),
      approveNote: json['ApproveNote'] as String?,
      eslBattery: (json['esl_battery'] as num?)?.toInt(),
      online: json['online'] as bool?,
      tableId: (json['tableID'] as num?)?.toInt(),
      detailsJson: json['DetailsJson'] as String?,
    );

Map<String, dynamic> _$$TestTableItemImplToJson(_$TestTableItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegistrationCode': instance.registrationCode,
      'TestTableID': instance.testTableId,
      'TestTableName': instance.testTableName,
      'TableSide': instance.tableSide,
      'RegistrationStartDate':
          instance.registrationStartDate?.toIso8601String(),
      'ProjectCode': instance.projectCode,
      'RegistrationContent': instance.registrationContent,
      'ProjectID': instance.projectId,
      'DetailID': instance.detailId,
      'No': instance.no,
      'Type': instance.type,
      'DetailStartDate': instance.detailStartDate?.toIso8601String(),
      'DetailEndDate': instance.detailEndDate?.toIso8601String(),
      'ActualReturnDate': instance.actualReturnDate?.toIso8601String(),
      'OwnerID': instance.ownerId,
      'OwnerFullName': instance.ownerFullName,
      'OwnerSDTCaNhan': instance.ownerPhone,
      'OwnerCode': instance.ownerCode,
      'ApproverID': instance.approverId,
      'ApproverFullName': instance.approverFullName,
      'Status': instance.status,
      'ApproveDate': instance.approveDate?.toIso8601String(),
      'ApproveNote': instance.approveNote,
      'esl_battery': instance.eslBattery,
      'online': instance.online,
      'tableID': instance.tableId,
      'DetailsJson': instance.detailsJson,
    };
