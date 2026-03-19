// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_room_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeetingRoomStateCWProxy {
  MeetingRoomState status(BaseStateStatus status);

  MeetingRoomState message(String? message);

  MeetingRoomState departs(List<DepartResponse> departs);

  MeetingRoomState isSubmitting(bool isSubmitting);

  MeetingRoomState submitSuccess(bool submitSuccess);

  MeetingRoomState deleteSuccess(bool deleteSuccess);

  MeetingRoomState meetingRoom(MeetingRoomData? meetingRoom);

  MeetingRoomState timeStart(DateTime? timeStart);

  MeetingRoomState timeEnd(DateTime? timeEnd);

  MeetingRoomState selectedRoomId(int? selectedRoomId);

  MeetingRoomState content(String? content);

  MeetingRoomState departmentId(int? departmentId);

  MeetingRoomState dateStart(DateTime? dateStart);

  MeetingRoomState dateEnd(DateTime? dateEnd);

  MeetingRoomState employeeId(int? employeeId);

  MeetingRoomState detailMeetingRoom(
      MeetingRoomSaveResponse? detailMeetingRoom);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeetingRoomState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeetingRoomState(...).copyWith(id: 12, name: "My name")
  /// ````
  MeetingRoomState call({
    BaseStateStatus? status,
    String? message,
    List<DepartResponse>? departs,
    bool? isSubmitting,
    bool? submitSuccess,
    bool? deleteSuccess,
    MeetingRoomData? meetingRoom,
    DateTime? timeStart,
    DateTime? timeEnd,
    int? selectedRoomId,
    String? content,
    int? departmentId,
    DateTime? dateStart,
    DateTime? dateEnd,
    int? employeeId,
    MeetingRoomSaveResponse? detailMeetingRoom,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeetingRoomState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeetingRoomState.copyWith.fieldName(...)`
class _$MeetingRoomStateCWProxyImpl implements _$MeetingRoomStateCWProxy {
  const _$MeetingRoomStateCWProxyImpl(this._value);

  final MeetingRoomState _value;

  @override
  MeetingRoomState status(BaseStateStatus status) => this(status: status);

  @override
  MeetingRoomState message(String? message) => this(message: message);

  @override
  MeetingRoomState departs(List<DepartResponse> departs) =>
      this(departs: departs);

  @override
  MeetingRoomState isSubmitting(bool isSubmitting) =>
      this(isSubmitting: isSubmitting);

  @override
  MeetingRoomState submitSuccess(bool submitSuccess) =>
      this(submitSuccess: submitSuccess);

  @override
  MeetingRoomState deleteSuccess(bool deleteSuccess) =>
      this(deleteSuccess: deleteSuccess);

  @override
  MeetingRoomState meetingRoom(MeetingRoomData? meetingRoom) =>
      this(meetingRoom: meetingRoom);

  @override
  MeetingRoomState timeStart(DateTime? timeStart) => this(timeStart: timeStart);

  @override
  MeetingRoomState timeEnd(DateTime? timeEnd) => this(timeEnd: timeEnd);

  @override
  MeetingRoomState selectedRoomId(int? selectedRoomId) =>
      this(selectedRoomId: selectedRoomId);

  @override
  MeetingRoomState content(String? content) => this(content: content);

  @override
  MeetingRoomState departmentId(int? departmentId) =>
      this(departmentId: departmentId);

  @override
  MeetingRoomState dateStart(DateTime? dateStart) => this(dateStart: dateStart);

  @override
  MeetingRoomState dateEnd(DateTime? dateEnd) => this(dateEnd: dateEnd);

  @override
  MeetingRoomState employeeId(int? employeeId) => this(employeeId: employeeId);

  @override
  MeetingRoomState detailMeetingRoom(
          MeetingRoomSaveResponse? detailMeetingRoom) =>
      this(detailMeetingRoom: detailMeetingRoom);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeetingRoomState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeetingRoomState(...).copyWith(id: 12, name: "My name")
  /// ````
  MeetingRoomState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? departs = const $CopyWithPlaceholder(),
    Object? isSubmitting = const $CopyWithPlaceholder(),
    Object? submitSuccess = const $CopyWithPlaceholder(),
    Object? deleteSuccess = const $CopyWithPlaceholder(),
    Object? meetingRoom = const $CopyWithPlaceholder(),
    Object? timeStart = const $CopyWithPlaceholder(),
    Object? timeEnd = const $CopyWithPlaceholder(),
    Object? selectedRoomId = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? departmentId = const $CopyWithPlaceholder(),
    Object? dateStart = const $CopyWithPlaceholder(),
    Object? dateEnd = const $CopyWithPlaceholder(),
    Object? employeeId = const $CopyWithPlaceholder(),
    Object? detailMeetingRoom = const $CopyWithPlaceholder(),
  }) {
    return MeetingRoomState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      departs: departs == const $CopyWithPlaceholder() || departs == null
          ? _value.departs
          // ignore: cast_nullable_to_non_nullable
          : departs as List<DepartResponse>,
      isSubmitting:
          isSubmitting == const $CopyWithPlaceholder() || isSubmitting == null
              ? _value.isSubmitting
              // ignore: cast_nullable_to_non_nullable
              : isSubmitting as bool,
      submitSuccess:
          submitSuccess == const $CopyWithPlaceholder() || submitSuccess == null
              ? _value.submitSuccess
              // ignore: cast_nullable_to_non_nullable
              : submitSuccess as bool,
      deleteSuccess:
          deleteSuccess == const $CopyWithPlaceholder() || deleteSuccess == null
              ? _value.deleteSuccess
              // ignore: cast_nullable_to_non_nullable
              : deleteSuccess as bool,
      meetingRoom: meetingRoom == const $CopyWithPlaceholder()
          ? _value.meetingRoom
          // ignore: cast_nullable_to_non_nullable
          : meetingRoom as MeetingRoomData?,
      timeStart: timeStart == const $CopyWithPlaceholder()
          ? _value.timeStart
          // ignore: cast_nullable_to_non_nullable
          : timeStart as DateTime?,
      timeEnd: timeEnd == const $CopyWithPlaceholder()
          ? _value.timeEnd
          // ignore: cast_nullable_to_non_nullable
          : timeEnd as DateTime?,
      selectedRoomId: selectedRoomId == const $CopyWithPlaceholder()
          ? _value.selectedRoomId
          // ignore: cast_nullable_to_non_nullable
          : selectedRoomId as int?,
      content: content == const $CopyWithPlaceholder()
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String?,
      departmentId: departmentId == const $CopyWithPlaceholder()
          ? _value.departmentId
          // ignore: cast_nullable_to_non_nullable
          : departmentId as int?,
      dateStart: dateStart == const $CopyWithPlaceholder()
          ? _value.dateStart
          // ignore: cast_nullable_to_non_nullable
          : dateStart as DateTime?,
      dateEnd: dateEnd == const $CopyWithPlaceholder()
          ? _value.dateEnd
          // ignore: cast_nullable_to_non_nullable
          : dateEnd as DateTime?,
      employeeId: employeeId == const $CopyWithPlaceholder()
          ? _value.employeeId
          // ignore: cast_nullable_to_non_nullable
          : employeeId as int?,
      detailMeetingRoom: detailMeetingRoom == const $CopyWithPlaceholder()
          ? _value.detailMeetingRoom
          // ignore: cast_nullable_to_non_nullable
          : detailMeetingRoom as MeetingRoomSaveResponse?,
    );
  }
}

extension $MeetingRoomStateCopyWith on MeetingRoomState {
  /// Returns a callable class that can be used as follows: `instanceOfMeetingRoomState.copyWith(...)` or like so:`instanceOfMeetingRoomState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeetingRoomStateCWProxy get copyWith => _$MeetingRoomStateCWProxyImpl(this);
}
