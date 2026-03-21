import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/features/auth/data/repository/auth_repository.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repo.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repository.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';

part 'booking_vehicle_event.dart';
part 'booking_vehicle_state.dart';
part 'booking_vehicle_bloc.g.dart';
part 'booking_vehicle_bloc.freezed.dart';

@injectable
class BookingVehicleBloc
    extends BaseBloc<BookingVehicleEvent, BookingVehicleState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  final BookingVehicleRepo _bookingVehicleRepo;

  bool _isInitAddInFlight = false;

  BookingVehicleBloc(this._bookingVehicleRepo, this._authRepo, this._log)
    : super(BookingVehicleState.init()) {
    on<BookingVehicleEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        preloadInitAdd: () => _onPreloadInitAdd(emit),
        initPassengerGoInfos: () => _onInitPassengerGoInfos(emit),
        addPassengerGoInfo: () => _onAddPassengerGoInfo(emit),
        expandPassengerGoInfo: (index) =>
            _onExpandPassengerGoInfo(index, emit),
        deletePassengerGoInfo: (index) =>
            _onDeletePassengerGoInfo(index, emit),
        initCommercialReceiverInfos: () =>
            _onInitCommercialReceiverInfos(emit),
        addCommercialReceiverInfo: () =>
            _onAddCommercialReceiverInfo(emit),
        expandCommercialReceiverInfo: (index) =>
            _onExpandCommercialReceiverInfo(index, emit),
        deleteCommercialReceiverInfo: (index) =>
            _onDeleteCommercialReceiverInfo(index, emit),
      );
    });
  }

  Future<void> _onInit(Emitter<BookingVehicleState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final startStr = DateFormat(
          "yyyy-MM-ddTHH:mm:ss",
        ).format(DateTime.now());
        final endStr = DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.now());

        final payload = {
          "StartDate": startStr,
          "EndDate": endStr,
          "EmployeeId": user!.employeeId,
          "DriverEmployeeId": 0,
          "Category": 0,
          "Status": 0,
          "Keyword": '',
          "IsDeleted": false,
        };

        final res = await _bookingVehicleRepo.getBookingVehicle(
          payload: payload,
        );

        await res.fold(
          (l) async {
            _log.logE('❌ API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
          (r) async {
            _log.logI('✅ API success - total: $r');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                bookingVehicle: r, // nếu state có field này
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onInitAdd(Emitter<BookingVehicleState> emit) async {
    await _loadInitAdd(emit, silent: false);
  }

  Future<void> _onPreloadInitAdd(Emitter<BookingVehicleState> emit) async {
    await _loadInitAdd(emit, silent: true);
  }

  Future<void> _loadInitAdd(
    Emitter<BookingVehicleState> emit, {
    required bool silent,
  }) async {
    // Chặn bắn API trùng khi UI re-render nhanh.
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ initAdd skipped: request in-flight');
      return;
    }

    final employeeId = await _resolveEmployeeId();
    if (employeeId == null) {
      if (!silent) {
        emit(state.copyWith(status: BaseStateStatus.failed));
      }
      return;
    }

    // Luôn ưu tiên dữ liệu cache để UI có dữ liệu tức thì.
    final cache = await BookingVehicleRepository.getInitAddCache(log: _log);
    if (cache != null && cache.employeeId == employeeId) {
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          employeeId: employeeId,
          provinceArrives: cache.provinceArrives,
          provinceDeparture: cache.provinceDeparture,
          employee: cache.employees,
          projects: cache.projects,
          approver: cache.approvers,
          currentEmployee: cache.currentEmployee,
        ),
      );
      _log.logI('✅ initAdd served from SharedPreferences cache');
      return;
    }

    _isInitAddInFlight = true;
    if (!silent) {
      emit(state.copyWith(status: BaseStateStatus.loading));
    }

    try {
      await _runInitAddQueueUntilSuccess(
        employeeId: employeeId,
        emit: emit,
      );
    } catch (e) {
      _log.logE('❌ Exception: $e');
      if (!silent) {
        emit(state.copyWith(status: BaseStateStatus.failed));
      }
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<int?> _resolveEmployeeId() async {
    final cachedUser = await AuthRepository.getCurrentUser(log: _log);
    if (cachedUser != null) {
      return cachedUser.employeeId;
    }

    final userRes = await _authRepo.getCurrentUser();
    return userRes.fold(
      (l) {
        _log.logE('❌ Get user failed: $l');
        return null;
      },
      (user) => user?.employeeId,
    );
  }

  Future<void> _runInitAddQueueUntilSuccess({
    required int employeeId,
    required Emitter<BookingVehicleState> emit,
  }) async {
    var attempt = 0;
    List<ProvinceArrivesItem>? provinceArrives;
    List<ProvinceDepartureItem>? provinceDeparture;
    List<BookingVehiclePersonalItem>? employees;
    List<BookingVehicleProjectItem>? projects;
    List<ApproverItem>? approvers;
    BookingVehiclePersonalItem? currentEmployee;
    var currentEmployeeFetched = false;

    while (true) {
      attempt += 1;
      _log.logI('🔁 initAdd queue attempt: $attempt');

      try {
        // API nào đã thành công thì giữ lại, không gọi lại.
        provinceArrives ??= await _mustGetProvinceArrives(employeeId);
        provinceDeparture ??= await _mustGetProvinceDeparture(employeeId);
        employees ??= await _mustGetEmployees();
        projects ??= await _mustGetProjects();
        approvers ??= await _mustGetApprovers();
        if (!currentEmployeeFetched) {
          currentEmployee = await _mustGetEmployeeById(employeeId);
          currentEmployeeFetched = true;
        }

        await BookingVehicleRepository.saveInitAddCache(
          employeeId: employeeId,
          provinceArrives: provinceArrives,
          provinceDeparture: provinceDeparture,
          employees: employees,
          projects: projects,
          approvers: approvers,
          currentEmployee: currentEmployee,
          log: _log,
        );

        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            employeeId: employeeId,
            provinceArrives: provinceArrives,
            provinceDeparture: provinceDeparture,
            employee: employees,
            projects: projects,
            approver: approvers,
            currentEmployee: currentEmployee,
          ),
        );
        return;
      } catch (e) {
        _log.logE('❌ initAdd queue failed at attempt $attempt: $e');
        await Future<void>.delayed(const Duration(milliseconds: 900));
      }
    }
  }

  Future<List<ProvinceArrivesItem>> _mustGetProvinceArrives(int employeeId) async {
    final res = await _bookingVehicleRepo.getProvinceArrives(employeeId: employeeId);
    return res.fold(
      (l) => throw Exception('Get province arrives failed: ${l.getErrorMessage}'),
      (r) => r,
    );
  }

  Future<List<ProvinceDepartureItem>> _mustGetProvinceDeparture(int employeeId) async {
    final res =
        await _bookingVehicleRepo.getProvinceDeparture(employeeId: employeeId);
    return res.fold(
      (l) =>
          throw Exception('Get province departure failed: ${l.getErrorMessage}'),
      (r) => r,
    );
  }

  Future<List<BookingVehiclePersonalItem>> _mustGetEmployees() async {
    final res = await _bookingVehicleRepo.getEmployee();
    return res.fold(
      (l) => throw Exception('Get employee failed: ${l.getErrorMessage}'),
      (r) => r,
    );
  }

  Future<List<BookingVehicleProjectItem>> _mustGetProjects() async {
    final res = await _bookingVehicleRepo.getProject();
    return res.fold(
      (l) => throw Exception('Get project failed: ${l.getErrorMessage}'),
      (r) => r,
    );
  }

  Future<List<ApproverItem>> _mustGetApprovers() async {
    final res = await _bookingVehicleRepo.getApprover();
    return res.fold(
      (l) => throw Exception('Get approver failed: ${l.getErrorMessage}'),
      (r) => r,
    );
  }

  Future<BookingVehiclePersonalItem?> _mustGetEmployeeById(int employeeId) async {
    final res = await _bookingVehicleRepo.getEmployeeById(employeeId: employeeId);
    return res.fold(
      (l) => throw Exception('Get employeeById failed: ${l.getErrorMessage}'),
      (r) => r,
    );
  }

  Future<void> _onInitPassengerGoInfos(
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        passengerGoLineCount: 1,
        expandedPassengerGoIndex: 0,
        passengerGoFirstRowIsCurrentUserSlot: true,
        passengerFormGeneration: 0,
      ),
    );
  }

  Future<void> _onAddPassengerGoInfo(Emitter<BookingVehicleState> emit) async {
    final n = state.passengerGoLineCount;
    emit(
      state.copyWith(
        passengerGoLineCount: n + 1,
        expandedPassengerGoIndex: n,
      ),
    );
  }

  Future<void> _onExpandPassengerGoInfo(
    int index,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        expandedPassengerGoIndex:
            state.expandedPassengerGoIndex == index ? null : index,
      ),
    );
  }

  /// Xoá theo index vị trí 0..n-1; màn hình dịch field form (passenger_*) trước khi emit.
  Future<void> _onDeletePassengerGoInfo(
    int index,
    Emitter<BookingVehicleState> emit,
  ) async {
    final n = state.passengerGoLineCount;
    if (n <= 1 || index < 0 || index >= n) return;

    final oldExpanded = state.expandedPassengerGoIndex;
    int? nextExpanded;
    if (oldExpanded == null) {
      nextExpanded = null;
    } else if (oldExpanded == index) {
      nextExpanded = null;
    } else if (oldExpanded > index) {
      nextExpanded = oldExpanded - 1;
    } else {
      nextExpanded = oldExpanded;
    }

    emit(
      state.copyWith(
        passengerGoLineCount: n - 1,
        expandedPassengerGoIndex: nextExpanded,
        passengerGoFirstRowIsCurrentUserSlot: index == 0
            ? false
            : state.passengerGoFirstRowIsCurrentUserSlot,
        passengerFormGeneration: state.passengerFormGeneration + 1,
      ),
    );
  }

  Future<void> _onInitCommercialReceiverInfos(
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        commercialReceiverLineCount: 1,
        expandedCommercialDeliveryReceiverIndex: 0,
        commercialReceiverFormGeneration: 0,
      ),
    );
  }

  Future<void> _onAddCommercialReceiverInfo(
    Emitter<BookingVehicleState> emit,
  ) async {
    final n = state.commercialReceiverLineCount;
    emit(
      state.copyWith(
        commercialReceiverLineCount: n + 1,
        expandedCommercialDeliveryReceiverIndex: n,
      ),
    );
  }

  Future<void> _onExpandCommercialReceiverInfo(
    int index,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        expandedCommercialDeliveryReceiverIndex:
            state.expandedCommercialDeliveryReceiverIndex == index
                ? null
                : index,
      ),
    );
  }

  Future<void> _onDeleteCommercialReceiverInfo(
    int index,
    Emitter<BookingVehicleState> emit,
  ) async {
    final n = state.commercialReceiverLineCount;
    if (n <= 1 || index < 0 || index >= n) return;

    final oldExpanded = state.expandedCommercialDeliveryReceiverIndex;
    int? nextExpanded;
    if (oldExpanded == null) {
      nextExpanded = null;
    } else if (oldExpanded == index) {
      nextExpanded = null;
    } else if (oldExpanded > index) {
      nextExpanded = oldExpanded - 1;
    } else {
      nextExpanded = oldExpanded;
    }

    emit(
      state.copyWith(
        commercialReceiverLineCount: n - 1,
        expandedCommercialDeliveryReceiverIndex: nextExpanded,
        commercialReceiverFormGeneration:
            state.commercialReceiverFormGeneration + 1,
      ),
    );
  }
}
