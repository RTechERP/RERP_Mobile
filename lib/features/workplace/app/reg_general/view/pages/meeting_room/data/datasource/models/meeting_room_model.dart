import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_room_model.freezed.dart';
part 'meeting_room_model.g.dart';


@freezed
class MeetingRoomSaveResponse with _$MeetingRoomSaveResponse {
  const factory MeetingRoomSaveResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'MeetingRoomID') required int meetingRoomId,
    @JsonKey(name: 'DateRegister') required DateTime dateRegister,
    @JsonKey(name: 'EmployeeID') required int employeeId,
    @JsonKey(name: 'StartTime') required DateTime startTime,
    @JsonKey(name: 'EndTime') required DateTime endTime,
    @JsonKey(name: 'Content') required String content,
    @JsonKey(name: 'IsApproved') required int isApproved,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate')  DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy')  String? updatedBy,
    @JsonKey(name: 'UpdatedDate')  DateTime? updatedDate,
    @JsonKey(name: 'DepartmentID') required int departmentId,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _MeetingRoomSaveResponse;

  factory MeetingRoomSaveResponse.fromJson(Map<String, dynamic> json) =>
      _$MeetingRoomSaveResponseFromJson(json);
}
@Freezed(toJson: false)
class MeetingRoomData with _$MeetingRoomData {
  const factory MeetingRoomData({
    @JsonKey(name: 'room1') required List<MeetingRoomItem> room1,
    @JsonKey(name: 'room2') required List<MeetingRoomItem> room2,
    @JsonKey(name: 'room3') required List<MeetingRoomItem> room3,
  }) = _MeetingRoomData;

  factory MeetingRoomData.fromJson(Map<String, dynamic> json) =>
      _$MeetingRoomDataFromJson(json);
}

@Freezed(toJson: false)
class MeetingRoomItem with _$MeetingRoomItem {
  const factory MeetingRoomItem({
    @JsonKey(name: 'AllDate') required DateTime allDate,
    @JsonKey(name: 'DayOfWeek') required String dayOfWeek,
    @JsonKey(name: 'MeetingRoomID') int? meetingRoomId,
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @Default({}) Map<String, dynamic> timeSlots,
  }) = _MeetingRoomItem;

  factory MeetingRoomItem.fromJson(Map<String, dynamic> json) {
    final fixedKeys = {
      'AllDate',
      'DayOfWeek',
      'MeetingRoomID',
      'DateRegister',
    };

    final timeSlots = Map.fromEntries(
      json.entries.where((e) => !fixedKeys.contains(e.key)),
    );

    return _MeetingRoomItem(
      allDate: DateTime.parse(json['AllDate']),
      dayOfWeek: json['DayOfWeek'],
      meetingRoomId: json['MeetingRoomID'],
      dateRegister: parseDateRegister(json['DateRegister']), // FIX ở đây
      timeSlots: timeSlots,
    );
  }
}

DateTime? parseDateRegister(String? value) {
  if (value == null) return null;

  final parts = value.split('/');
  if (parts.length != 3) return null;

  final month = int.parse(parts[0]);
  final day = int.parse(parts[1]);
  final year = int.parse(parts[2]);

  return DateTime(year, month, day);
}