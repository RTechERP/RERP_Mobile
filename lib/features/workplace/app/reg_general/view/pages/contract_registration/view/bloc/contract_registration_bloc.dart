import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/contract_registration_model.dart';
import '../../data/repository/contract_registration_repo.dart';

part 'contract_registration_event.dart';
part 'contract_registration_state.dart';
part 'contract_registration_bloc.g.dart';
part 'contract_registration_bloc.freezed.dart';

@injectable
class ContractRegistrationBloc
    extends BaseBloc<ContractRegistrationEvent, ContractRegistrationState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final ContractRegistrationRepo _repo;

  ContractRegistrationBloc(this._repo, this._authRepo, this._log)
      : super(ContractRegistrationState.init()) {
    on<ContractRegistrationEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        searchContracts: (keyword) =>
            _onSearchContracts(emit, keyword: keyword),
      );
    });
  }

  //---(Init)---//
  Future<void> _onInit(Emitter<ContractRegistrationState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    emit(state.copyWith(dateStart: start, dateEnd: end));

    final userRes = await _authRepo.getCurrentUser();
    final employeeId = userRes.fold((_) => 0, (u) => u?.employeeId);

    final payload = <String, dynamic>{
      "empID": employeeId,
      "departmentID": 0,
      "status": -1,
      "dateStart": start.toIso8601String(),
      "dateEnd": end.toIso8601String(),
      "keyword": '',
    };

    _log.logI('Payload: $payload');

    final res = await _repo.getContract(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('Get contracts failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        _log.logI('Get contracts success - total: ${data.length}');
        emit(state.copyWith(status: BaseStateStatus.success, contracts: data));
      },
    );
  }

  //---(ChangeDateRange)---//
  Future<void> _onChangeDateRange(
    Emitter<ContractRegistrationState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day, 23, 59, 59);

    emit(state.copyWith(dateStart: start, dateEnd: end));

    final userRes = await _authRepo.getCurrentUser();
    final employeeId = userRes.fold((_) => 0, (u) => u?.employeeId);

    final payload = <String, dynamic>{
      "empID": employeeId,
      "departmentID": 0,
      "status": -1,
      "dateStart": start.toIso8601String(),
      "dateEnd": end.toIso8601String(),
      "keyword": state.keyword ?? '',
    };

    _log.logI('ChangeDateRange payload: $payload');

    final res = await _repo.getContract(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('ChangeDateRange failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        _log.logI('ChangeDateRange success - total: ${data.length}');
        emit(state.copyWith(status: BaseStateStatus.success, contracts: data));
      },
    );
  }

  //---(Search)---//
  Future<void> _onSearchContracts(
    Emitter<ContractRegistrationState> emit, {
    String? keyword,
  }) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final start =
        state.dateStart ??
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    final end =
        state.dateEnd ??
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0, 23, 59, 59);

    emit(state.copyWith(dateStart: start, dateEnd: end, keyword: keyword));

    final userRes = await _authRepo.getCurrentUser();
    final employeeId = userRes.fold((_) => 0, (u) => u?.employeeId);

    final payload = <String, dynamic>{
      "empID": employeeId,
      "departmentID": 0,
      "status": -1,
      "dateStart": start.toIso8601String(),
      "dateEnd": end.toIso8601String(),
      "keyword": keyword ?? state.keyword ?? '',
    };

    _log.logI('Search payload: $payload');

    final res = await _repo.getContract(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('Search contracts failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        _log.logI('Search contracts success - total: ${data.length}');
        emit(state.copyWith(status: BaseStateStatus.success, contracts: data));
      },
    );
  }
}
