part of 'meeting_room_bloc.dart';

@freezed
class MeetingRoomEvent with _$MeetingRoomEvent {
  const factory MeetingRoomEvent.init() = _Init;

  const factory MeetingRoomEvent.initAdd() = _InitAdd;

  const factory MeetingRoomEvent.submitRoom({
    required DateTime startTime,
    required DateTime endTime,
    required DateTime dateRegister,
  }) = _SubmitRoom;

  const factory MeetingRoomEvent.updateInfo({
    String? content,
    DateTime? startTime,
    DateTime? endTime,
    int? selectedRoomId,
    int? departmentId,
  }) = _UpdateInfo;
}
