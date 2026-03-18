part of 'meeting_room_bloc.dart';

@CopyWith()
class MeetingRoomState extends BaseBlocState {

  final List<DepartResponse> departs;

  final bool isSubmitting;
  final bool submitSuccess;
  final bool deleteSuccess;
  final MeetingRoomData? meetingRoom;
  final DateTime? timeStart;
  final DateTime? timeEnd;

  final DateTime? dateStart;
  final DateTime? dateEnd;

  final int? selectedRoomId;
  final String? content;

  final int? departmentId;

  final int? employeeId;

  final MeetingRoomSaveResponse? detailMeetingRoom;
  const MeetingRoomState({
    required super.status,
    super.message,
    this.departs = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.deleteSuccess = false,
    this.meetingRoom,
    this.timeStart,
    this.timeEnd,
    this.selectedRoomId,
    this.content,
    this.departmentId,
    this.dateStart,
    this.dateEnd,
    this.employeeId,
    this.detailMeetingRoom,
  });

  factory MeetingRoomState.init() => const MeetingRoomState(
    status: BaseStateStatus.init,
    departs: [],
    isSubmitting: false,
    submitSuccess: false,
    deleteSuccess: false,
    meetingRoom: null,
    timeStart: null,
    timeEnd: null,
    selectedRoomId: null,
    content: null,
    departmentId: null,
    dateStart: null,
    dateEnd: null,
    employeeId: null,
    detailMeetingRoom: null,
  );
  @override
  List get props => [
    status,
    message,
    meetingRoom,
    timeStart,
    timeEnd,
    isSubmitting,
    submitSuccess,
    deleteSuccess,
    selectedRoomId,
    content,
    departmentId,
    dateStart,
    dateEnd,
    employeeId,
    departs,
    detailMeetingRoom,
  ];
}
