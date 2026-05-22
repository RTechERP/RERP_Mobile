import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/work_requirement_model.dart';
import '../../data/repository/work_requirement_repo.dart';

part 'work_requirement_event.dart';
part 'work_requirement_state.dart';
part 'work_requirement_bloc.freezed.dart';
part 'work_requirement_bloc.g.dart';


@injectable
class WorkRequirementBloc extends BaseBloc<WorkRequirementEvent, WorkRequirementState> {
  final WorkRequirementRepo _workRequirementRepo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  WorkRequirementBloc(this._workRequirementRepo, this._authRepo, this._log)
      : super(WorkRequirementState.init()) {
    on<WorkRequirementEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart, dateEnd),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  //---(Init)---//

  Future<void> _onInit(Emitter<WorkRequirementState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        final now = DateTime.now();
        final startOfMonth = DateTime(now.year, now.month, 1);
        final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

        emit(state.copyWith(
          employeeId: user.employeeId,
          departmentId: user.departmentId,
          dateStart: startOfMonth,
          dateEnd: endOfMonth,
        ));

        await _fetchItems(
          emit,
          departmentId: user.departmentId,
          employeeId: user.employeeId,
          dateStart: startOfMonth,
          dateEnd: endOfMonth,
        );
      },
    );
  }

  //---(Refresh)---//

  Future<void> _onRefresh(Emitter<WorkRequirementState> emit) async {
    if (state.employeeId == null || state.departmentId == null) {
      await _onInit(emit);
      return;
    }

    await _fetchItems(
      emit,
      departmentId: state.departmentId,
      employeeId: state.employeeId,
      dateStart: state.dateStart,
      dateEnd: state.dateEnd,
    );
  }

  //---(ChangeDateRange)---//

  Future<void> _onChangeDateRange(
    Emitter<WorkRequirementState> emit,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: dateStart,
      dateEnd: dateEnd,
    ));

    await _fetchItems(
      emit,
      departmentId: state.departmentId,
      employeeId: state.employeeId,
      dateStart: dateStart,
      dateEnd: dateEnd,
    );
  }

  //---(Fetch)---//

  Future<void> _fetchItems(
    Emitter<WorkRequirementState> emit, {
    required int? departmentId,
    required int? employeeId,
    required DateTime? dateStart,
    required DateTime? dateEnd,
  }) async {
    final payload = <String, dynamic>{
      'DepartmentID': departmentId ?? 0,
      'EmployeeID': employeeId ?? 0,
      'DateStart': dateStart?.toIso8601String() ?? '',
      'DateEnd': dateEnd?.toIso8601String() ?? '',
    };

    _log.logI('WorkRequirement payload: $payload');

    final res = await _workRequirementRepo.getWorkRequirement(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('Get work requirement failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (items) async {
        _log.logI('Get work requirement success: ${items.length} items');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          items: items,
        ));
      },
    );
  }
}
