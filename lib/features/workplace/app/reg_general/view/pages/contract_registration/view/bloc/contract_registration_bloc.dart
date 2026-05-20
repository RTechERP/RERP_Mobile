import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
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
        initAdd: () => _onInitAdd(emit),
        clearSubmitResult: () => _onClearSubmitResult(emit),
        fetchReceivers: () => _onFetchReceivers(emit),
        submitContract:
            (
              registedDate,
              taxCompanyId,
              documentTypeId,
              contractType,
              employeeReceiverId,
              documentQuantity,
              documentName,
              isScan,
              folderPath,
            ) => _onSubmitContract(
              emit,
              registedDate: registedDate,
              taxCompanyId: taxCompanyId,
              documentTypeId: documentTypeId,
              contractType: contractType,
              employeeReceiverId: employeeReceiverId,
              documentQuantity: documentQuantity,
              documentName: documentName,
              isScan: isScan,
              folderPath: folderPath,
            ),
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

  //---(InitAdd)---//
  Future<void> _onInitAdd(Emitter<ContractRegistrationState> emit) async {
    emit(
      state.copyWith(isSubmitting: false, submitSuccess: false, message: null),
    );

    final docRes = await _repo.getDocumentType(payload: {});
    final taxRes = await _repo.getTaxCompany(payload: {});

    emit(
      state.copyWith(
        documentTypes: docRes.fold((_) => [], (data) => data),
        taxCompanies: taxRes.fold((_) => [], (data) => data),
      ),
    );
  }

  //---(ClearSubmitResult)---//
  Future<void> _onClearSubmitResult(
    Emitter<ContractRegistrationState> emit,
  ) async {
    emit(
      state.copyWith(isSubmitting: false, submitSuccess: false, message: null),
    );
  }

  //---(FetchReceivers)---//
  Future<void> _onFetchReceivers(
    Emitter<ContractRegistrationState> emit,
  ) async {
    final res = await _repo.getReceiver();

    res.fold(
      (err) {
        _log.logE('FetchReceivers failed: $err');
      },
      (data) {
        _log.logI('FetchReceivers success - total: ${data.length}');
        emit(state.copyWith(receivers: data));
      },
    );
  }

  //---(SubmitContract)---//
  Future<void> _onSubmitContract(
    Emitter<ContractRegistrationState> emit, {
    required DateTime registedDate,
    required int taxCompanyId,
    required int documentTypeId,
    required String contractType,
    required int employeeReceiverId,
    required int documentQuantity,
    required String documentName,
    required bool isScan,
    String? folderPath,
  }) async {
    emit(
      state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
    );

    final userRes = await _authRepo.getCurrentUser();
    final employeeId = userRes.fold((_) => 0, (u) => u?.employeeId ?? 0);

    final contractTypeId = _mapContractType(contractType);

    final payload = <String, dynamic>{
      "ID": 0,
      "EmployeeID": employeeId,
      "EmployeeReciveID": employeeReceiverId,
      "TaxCompanyID": taxCompanyId,
      "RegistedDate": registedDate.toIso8601String(),
      "DocumentTypeID": documentTypeId,
      "DocumentName": documentName,
      "DocumentQuantity": documentQuantity,
      "ContractTypeID": contractTypeId,
      "FolderPath": isScan ? (folderPath ?? '') : null,
      "IsScan": isScan,
      "IsDeleted": false,
    };

    _log.logI('Submit contract payload: $payload');

    final res = await _repo.saveContract(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('Submit contract failed: $err');
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        _log.logI('Submit contract success');
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: true,
            status: BaseStateStatus.success,
            message: 'Lưu hợp đồng thành công',
          ),
        );
      },
    );
  }

  // Map loại văn bản string -> int: Gốc=1, Sao y=2, Treo=3.
  int _mapContractType(String? type) {
    switch (type) {
      case 'Gốc':
        return 1;
      case 'Sao y':
        return 2;
      case 'Treo':
        return 3;
      default:
        return 1;
    }
  }
}
