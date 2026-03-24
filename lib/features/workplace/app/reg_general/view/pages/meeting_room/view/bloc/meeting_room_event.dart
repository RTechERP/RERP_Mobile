part of 'meeting_room_bloc.dart';

@freezed
class MeetingRoomEvent with _$MeetingRoomEvent {
  const factory MeetingRoomEvent.init() = _Init;

  const factory MeetingRoomEvent.initAdd() = _InitAdd;

  const factory MeetingRoomEvent.initEdit({required int roomId}) = _InitEdit;

  const factory MeetingRoomEvent.submitRoom({
    required DateTime startTime,
    required DateTime endTime,
    required DateTime dateRegister,
  }) = _SubmitRoom;

  const factory MeetingRoomEvent.submitEditRoom({
    required int roomId,
    required DateTime startTime,
    required DateTime endTime,
    required DateTime dateRegister,
  }) = _SubmitEditRoom;

  const factory MeetingRoomEvent.deleteRoom({
    required int roomId,
    required bool isDelete,
  }) = _DeleteRoom;

  // const factory MeetingRoomEvent.deleteRoom({
  //   required int roomId,
  //   required bool isDeleted,
  // }) = _DeleteRoom;
  //
  // const factory MeetingRoomEvent.updateRoom({required int roomId}) =
  //     _UpdateRoom;

  const factory MeetingRoomEvent.updateInfo({
    String? content,
    DateTime? startTime,
    DateTime? endTime,
    int? selectedRoomId,
    int? departmentId,
  }) = _UpdateInfo;
}
