import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/summary_leave_model.dart';
import '../../data/repository/summary_leave_repo.dart';

part 'summary_leave_event.dart';
part 'summary_leave_state.dart';
part 'summary_leave_bloc.g.dart';
part 'summary_leave_bloc.freezed.dart';

@injectable
class SummaryLeaveBloc extends BaseBloc<SummaryLeaveEvent, SummaryLeaveState> {
  final SummaryLeaveRepo _repo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  SummaryLeaveBloc(
    this._repo,
    this._authRepo,
    this._log,
  ) : super(SummaryLeaveState.init()) {
    on<SummaryLeaveEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
        changeFilters: (departmentId, status) =>
            _onChangeFilters(emit, departmentId: departmentId, status: status),
        refresh: () => _onInit(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<SummaryLeaveState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // Load current user to get default departmentId
    int? defaultDepartmentId;
    final userRes = await _authRepo.getCurrentUser();
    userRes.fold(
      (l) => _log.logE('Get current user failed: $l'),
      (user) {
        if (user != null) {
          defaultDepartmentId = user.departmentId;
          _log.logI('Current user departmentId: $defaultDepartmentId');
        }
      },
    );

    // Load departments
    final deptRes = await _repo.getDepartments();
    List<SummaryDepartment> departments = [];
    deptRes.fold(
      (l) => _log.logE('Get departments failed: $l'),
      (r) => departments = r,
    );

    // Default date range to current month
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0);

    await _loadLeave(
      emit,
      start: start,
      end: end,
      departments: departments,
      departmentId: defaultDepartmentId,
    );
  }

  Future<void> _onChangeDateRange(
    Emitter<SummaryLeaveState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: start,
      dateEnd: end,
    ));

    await _loadLeave(
      emit,
      start: start,
      end: end,
      departments: state.departments,
    );
  }

  _onChangeKeyword(
    Emitter<SummaryLeaveState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(keyword: keyword));
    if (state.dateStart == null || state.dateEnd == null) return;
    await _loadLeave(
      emit,
      start: state.dateStart!,
      end: state.dateEnd!,
      departments: state.departments,
    );
  }

  _onChangeFilters(
    Emitter<SummaryLeaveState> emit, {
    int? departmentId,
    int? status,
  }) async {
    emit(state.copyWith(
      departmentId: departmentId,
      filterStatus: status,
    ));
    if (state.dateStart == null || state.dateEnd == null) return;
    await _loadLeave(
      emit,
      start: state.dateStart!,
      end: state.dateEnd!,
      departments: state.departments,
    );
  }

  Future<void> _loadLeave(
    Emitter<SummaryLeaveState> emit, {
    required DateTime start,
    required DateTime end,
    required List<SummaryDepartment> departments,
    int? departmentId,
  }) async {
    final effectiveDepartmentId = departmentId ?? state.departmentId;

    if (state.status != BaseStateStatus.loading) {
      emit(state.copyWith(status: BaseStateStatus.loading));
    }

    // Format date to ISO 8601 with timezone
    final dateStartStr = DateTime(start.year, start.month, start.day, 0, 0, 0)
        .toUtc()
        .toIso8601String();
    final dateEndStr = DateTime(end.year, end.month, end.day, 23, 59, 59)
        .toUtc()
        .toIso8601String();

    final payload = {
      "Page": 1,
      "Size": 10000,
      "Keyword": state.keyword,
      "DateStart": dateStartStr,
      "DateEnd": dateEndStr,
      "IDApprovedTP": 0,
      "Status": state.filterStatus ?? -1,
      "DepartmentID": effectiveDepartmentId ?? 0,
    };

    _log.logI('SummaryLeave payload: $payload');

    final res = await _repo.getLeave(payload: payload);
    await res.fold(
      (l) async {
        _log.logE('Get leave failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          departments: departments,
        ));
      },
      (r) async {
        _log.logI('SummaryLeave success - total: ${r.length}');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            leave: r,
            dateStart: start,
            dateEnd: end,
            departments: departments,
            departmentId: effectiveDepartmentId,
          ),
        );
      },
    );
  }
}
