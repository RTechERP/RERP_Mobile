// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeetingRoomSaveResponseImpl _$$MeetingRoomSaveResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MeetingRoomSaveResponseImpl(
      id: (json['ID'] as num).toInt(),
      meetingRoomId: (json['MeetingRoomID'] as num).toInt(),
      dateRegister: DateTime.parse(json['DateRegister'] as String),
      employeeId: (json['EmployeeID'] as num).toInt(),
      startTime: DateTime.parse(json['StartTime'] as String),
      endTime: DateTime.parse(json['EndTime'] as String),
      content: json['Content'] as String,
      isApproved: (json['IsApproved'] as num).toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      departmentId: (json['DepartmentID'] as num).toInt(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$MeetingRoomSaveResponseImplToJson(
        _$MeetingRoomSaveResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'MeetingRoomID': instance.meetingRoomId,
      'DateRegister': instance.dateRegister.toIso8601String(),
      'EmployeeID': instance.employeeId,
      'StartTime': instance.startTime.toIso8601String(),
      'EndTime': instance.endTime.toIso8601String(),
      'Content': instance.content,
      'IsApproved': instance.isApproved,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'DepartmentID': instance.departmentId,
      'IsDeleted': instance.isDeleted,
    };

_$MeetingRoomDataImpl _$$MeetingRoomDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MeetingRoomDataImpl(
      room1: (json['room1'] as List<dynamic>)
          .map((e) => MeetingRoomItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      room2: (json['room2'] as List<dynamic>)
          .map((e) => MeetingRoomItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      room3: (json['room3'] as List<dynamic>)
          .map((e) => MeetingRoomItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
