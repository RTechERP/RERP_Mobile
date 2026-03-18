import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../../data/datasource/models/meeting_room_model.dart';
import '../../data/repository/meeting_room_repo.dart';

part 'meeting_room_event.dart';
part 'meeting_room_state.dart';
part 'meeting_room_bloc.g.dart';
part 'meeting_room_bloc.freezed.dart';

@injectable
class MeetingRoomBloc extends BaseBloc<MeetingRoomEvent, MeetingRoomState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  final MeetingRoomRepo _meetingRoomRepo;

  MeetingRoomBloc(this._meetingRoomRepo, this._authRepo, this._log)
    : super(MeetingRoomState.init()) {
    on<MeetingRoomEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),

        initAdd: () => _onAddInit(emit),

        initEdit: (roomId) => _onAddEdit(roomId, emit),

        submitRoom: (startTime, endTime, dateRegister) =>
            _onSubmitRoom(dateRegister, startTime, endTime, emit),
        submitEditRoom: (roomId, startTime, endTime, dateRegister) =>
            _onSubmitEditRoom(
              roomId,
              dateRegister,
              startTime,
              endTime,
              emit,
            ),
        deleteRoom: (roomId, isDelete) =>
            _onDeleteRoom(roomId, isDelete, emit),
        updateInfo:
            (content, startTime, endTime, selectedRoomId, departmentId) =>
                _onUpdateInfo(
                  content: content,
                  startTime: startTime,
                  endTime: endTime,
                  selectedRoomId: selectedRoomId,
                  departmentId: departmentId,
                  emit: emit,
                ),
      );
    });
  }

  Future<void> _loadMeetingRoom({
    required DateTime start,
    required DateTime end,
    required Emitter<MeetingRoomState> emit,
  }) async {
    final res = await _meetingRoomRepo.getMeetingRoom(
      dateStart: start,
      dateEnd: end,
    );

    res.fold(
      (l) {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            meetingRoom: r,
            dateStart: start,
            dateEnd: end,
          ),
        );
      },
    );
  }

  _onInit(Emitter<MeetingRoomState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final now = DateTime.now();

    // Thứ 2
    final start = DateTime(
      now.year,
      now.month,
      now.day - (now.weekday - DateTime.monday),
    );

    // Thứ 7
    final end = start.add(const Duration(days: 5));

    await _loadMeetingRoom(start: start, end: end, emit: emit);
  }

  Future<void> _onAddInit(Emitter<MeetingRoomState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();
    final departRes = await _meetingRoomRepo.getDepart();

    await userRes.fold(
      (l) async {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        emit(
          state.copyWith(
            departmentId: user.departmentId,
            employeeId: user.employeeId,
          ),
        );
      },
    );

    departRes.fold(
      (l) => _log.logE('Get depart failed: ${l.getErrorMessage}'),
      (r) => emit(state.copyWith(departs: r)),
    );
  }

  Future<void> _onAddEdit(int roomId, Emitter<MeetingRoomState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    final roomRes = await _meetingRoomRepo.getRoomById(id: roomId);
    final departRes = await _meetingRoomRepo.getDepart();

    await userRes.fold(
      (l) async {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        emit(
          state.copyWith(
            departmentId: user.departmentId,
            employeeId: user.employeeId,
          ),
        );
      },
    );

    roomRes.fold(
      (l) => _log.logE('Get detail meeting room failed: ${l.getErrorMessage}'),
      (r) => emit(
        state.copyWith(
          status: BaseStateStatus.success,
          detailMeetingRoom: r,
          content: r.content,
          selectedRoomId: r.meetingRoomId,
          timeStart: r.startTime,
          timeEnd: r.endTime,
          departmentId: r.departmentId,
          dateStart: r.dateRegister,
        ),
      ),
    );

    departRes.fold(
      (l) => _log.logE('Get depart failed: ${l.getErrorMessage}'),
      (r) => emit(state.copyWith(departs: r)),
    );

  }

  bool _isSubmittingRoom = false;
  Future<void> _onSubmitRoom(
    DateTime dateRegister,
    DateTime startTime,
    DateTime endTime,
    Emitter<MeetingRoomState> emit,
  ) async {
    if (_isSubmittingRoom) return;
    _isSubmittingRoom = true;

    try {
      emit(
        state.copyWith(
          isSubmitting: true,
          submitSuccess: false,
          timeStart: startTime,
          timeEnd: endTime,
        ),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      if (state.selectedRoomId == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng chọn phòng họp',
          ),
        );
        return;
      }

      /// format date
      final dateStr = DateFormat('yyyy-MM-dd').format(dateRegister);
      final startStr = DateFormat("yyyy-MM-ddTHH:mm:ss").format(startTime);
      final endStr = DateFormat("yyyy-MM-ddTHH:mm:ss").format(endTime);

      /// payload đúng
      final payload = {
        "ID": state.detailMeetingRoom?.id ?? 0,
        "MeetingRoomId": state.selectedRoomId,
        "DateRegister": dateStr,
        "Content": state.content,
        "StartTime": startStr,
        "EndTime": endStr,
        "DepartmentId": state.departmentId,
        "EmployeeId": user.employeeId,
        "IsApproved": 0,
      };

      _log.logD('Payload: ${jsonEncode(payload)}');

      final res = await _meetingRoomRepo.saveMeetingRoom(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ Submit API failed: $l');
          emit(state.copyWith(isSubmitting: false, submitSuccess: false));
        },
        (r) async {
          _log.logI('✅ Submit meeting room success');

          /// 👉 optional: add luôn vào calendar không cần reload API
          emit(state.copyWith(isSubmitting: false, submitSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Submit exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isSubmitting: false, submitSuccess: false));
    } finally {
      _isSubmittingRoom = false; // fix bug sai biến
      _log.logI('🏁 End submit meeting room');
    }
  }

  Future<void> _onSubmitEditRoom(
    int roomId,
    DateTime dateRegister,
    DateTime startTime,
    DateTime endTime,
    Emitter<MeetingRoomState> emit,
  ) async {
    if (_isSubmittingRoom) return;
    _isSubmittingRoom = true;

    try {
      emit(state.copyWith(isSubmitting: true, submitSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      if (state.selectedRoomId == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Vui lòng chọn phòng họp',
          ),
        );
        return;
      }

      /// format date
      final dateStr = DateFormat('yyyy-MM-dd').format(dateRegister);
      final startStr = DateFormat("yyyy-MM-ddTHH:mm:ss").format(startTime);
      final endStr = DateFormat("yyyy-MM-ddTHH:mm:ss").format(endTime);

      final payload = {
        "ID": roomId,
        "MeetingRoomId": state.selectedRoomId,
        "DateRegister": dateStr,
        "Content": state.content,
        "StartTime": startStr,
        "EndTime": endStr,
        "DepartmentId": state.departmentId,
        "EmployeeId": user.employeeId,
        "IsApproved": 0,
      };

      _log.logD('Payload (edit): ${jsonEncode(payload)}');

      final res = await _meetingRoomRepo.saveMeetingRoom(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ SubmitEdit API failed: $l');
          emit(state.copyWith(isSubmitting: false, submitSuccess: false));
        },
        (r) async {
          _log.logI('✅ SubmitEdit meeting room success');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              timeStart: startTime,
              timeEnd: endTime,
            ),
          );
        },
      );
    } catch (e, s) {
      _log.logE('❌ SubmitEdit exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isSubmitting: false, submitSuccess: false));
    } finally {
      _isSubmittingRoom = false;
      _log.logI('🏁 End submit edit meeting room');
    }
  }

  Future<void> _onDeleteRoom(
    int roomId,
    bool isDelete,
    Emitter<MeetingRoomState> emit,
  ) async {
    if (_isSubmittingRoom) return;
    _isSubmittingRoom = true;

    try {
      emit(
        state.copyWith(
          isSubmitting: true,
          submitSuccess: false,
          deleteSuccess: false,
        ),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      final detail = state.detailMeetingRoom;

      final selectedMeetingRoomId =
          state.selectedRoomId ?? detail?.meetingRoomId;
      if (selectedMeetingRoomId == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Không có dữ liệu phòng họp để xoá',
          ),
        );
        return;
      }

      final dateRegister = state.dateStart ?? detail?.dateRegister;
      final startTime = state.timeStart ?? detail?.startTime;
      final endTime = state.timeEnd ?? detail?.endTime;
      if (dateRegister == null || startTime == null || endTime == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            status: BaseStateStatus.failed,
            message: 'Không có dữ liệu thời gian để xoá',
          ),
        );
        return;
      }

      final dateStr = DateFormat('yyyy-MM-dd').format(dateRegister);
      final startStr = DateFormat("yyyy-MM-ddTHH:mm:ss").format(startTime);
      final endStr = DateFormat("yyyy-MM-ddTHH:mm:ss").format(endTime);

      final payload = {
        "ID": roomId,
        "MeetingRoomId": selectedMeetingRoomId,
        "DateRegister": dateStr,
        "Content": state.content ?? detail?.content ?? '',
        "StartTime": startStr,
        "EndTime": endStr,
        "DepartmentId": state.departmentId ?? detail?.departmentId ?? 0,
        "EmployeeId": user.employeeId,
        "IsApproved": detail?.isApproved ?? 0,
        "IsDeleted": isDelete,
      };

      _log.logD('Payload (delete): ${jsonEncode(payload)}');

      final res = await _meetingRoomRepo.saveMeetingRoom(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ Delete API failed: $l');
          emit(state.copyWith(isSubmitting: false, deleteSuccess: false));
        },
        (r) async {
          _log.logI('✅ Delete meeting room success');
          emit(state.copyWith(isSubmitting: false, deleteSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Delete exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isSubmitting: false, deleteSuccess: false));
    } finally {
      _isSubmittingRoom = false;
      _log.logI('🏁 End delete meeting room');
    }
  }

  _onUpdateInfo({
    String? content,
    DateTime? startTime,
    DateTime? endTime,
    int? selectedRoomId,
    int? departmentId,
    required Emitter<MeetingRoomState> emit,
  }) {
    emit(
      state.copyWith(
        content: content ?? state.content,
        timeStart: startTime ?? state.timeStart,
        timeEnd: endTime ?? state.timeEnd,
        selectedRoomId: selectedRoomId ?? state.selectedRoomId,
        departmentId: departmentId ?? state.departmentId,
      ),
    );
  }
}
