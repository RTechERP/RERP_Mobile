import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/features/auth/data/repository/auth_repository.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repo.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repository.dart';
import '../booking_vehicle_package_image_form.dart';
import '../booking_vehicle_passenger_go_payload.dart';
import '../booking_vehicle_upload_sub_path.dart';
import '../../../../../../../../../common/helpers/validate_helper.dart';
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
        initPickupGiverInfos: () => _onInitPickupGiverInfos(emit),
        addPickupGiverInfo: () => _onAddPickupGiverInfo(emit),
        expandPickupGiverInfo: (index) =>
            _onExpandPickupGiverInfo(index, emit),
        deletePickupGiverInfo: (index) =>
            _onDeletePickupGiverInfo(index, emit),
        updateForm: (values) async {
          _onUpdateForm(values, emit);
        },
        updateInfo: (values) async {
          _onUpdateInfo(values, emit);
        },
        submitPassengerGo: (formValues) async {
          await _onSubmitPassengerGo(formValues, emit);
        },
        submitPassengerReturn: (formValues) async {
          await _onSubmitPassengerReturn(formValues, emit);
        },
        submitCommercialDelivery: (formValues) async {
          await _onSubmitCommercialDelivery(formValues, emit);
        },
        submitCommercialPickup: (formValues) async {
          await _onSubmitCommercialPickup(formValues, emit);
        },
        clearSubmitResult: () async {
          emit(
            state.copyWith(
              submitSuccess: false,
              isSubmitting: false,
              message: null,
            ),
          );
        },
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
        final now = DateTime.now();

        final startStr = DateFormat("yyyy-MM-ddTHH:mm:ss").format(now);

        // 👉 EndDate = ngày hôm sau
        final endStr = DateFormat("yyyy-MM-ddTHH:mm:ss")
            .format(now.add(const Duration(days: 1)));

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

        _log.logI('Payload: $payload'); // debug thêm

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
                bookingVehicle: r,
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

  Future<void> _onInitPickupGiverInfos(
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        pickupGiverLineCount: 1,
        expandedPickupGiverIndex: 0,
        pickupGiverFormGeneration: 0,
      ),
    );
  }

  Future<void> _onAddPickupGiverInfo(
    Emitter<BookingVehicleState> emit,
  ) async {
    final n = state.pickupGiverLineCount;
    emit(
      state.copyWith(
        pickupGiverLineCount: n + 1,
        expandedPickupGiverIndex: n,
      ),
    );
  }

  Future<void> _onExpandPickupGiverInfo(
    int index,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        expandedPickupGiverIndex:
            state.expandedPickupGiverIndex == index ? null : index,
      ),
    );
  }

  Future<void> _onDeletePickupGiverInfo(
    int index,
    Emitter<BookingVehicleState> emit,
  ) async {
    final n = state.pickupGiverLineCount;
    if (n <= 1 || index < 0 || index >= n) return;

    final oldExpanded = state.expandedPickupGiverIndex;
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
        pickupGiverLineCount: n - 1,
        expandedPickupGiverIndex: nextExpanded,
        pickupGiverFormGeneration: state.pickupGiverFormGeneration + 1,
      ),
    );
  }

  void _onUpdateForm(
    Map<String, dynamic> values,
    Emitter<BookingVehicleState> emit,
  ) {
    if (values.isEmpty) return;
    final merged = Map<String, dynamic>.from(state.formFieldValues)
      ..addAll(values);
    emit(state.copyWith(formFieldValues: merged));
  }

  void _onUpdateInfo(
    Map<String, dynamic> values,
    Emitter<BookingVehicleState> emit,
  ) {
    if (values.isEmpty) return;
    final merged = Map<String, dynamic>.from(state.infoFieldValues)
      ..addAll(values);
    emit(state.copyWith(infoFieldValues: merged));
  }

  /// Khi mốc thời gian là **hôm nay** — đồng bộ card phát sinh (người đi / giao / lấy).
  String? _bookingVehicleProblemArisesSubmitError(
    Map<String, dynamic> formValues, {
    String needTimeFieldKey = 'time_need_present',
  }) {
    final need = bookingVehicleParseFormDateTime(
      formValues[needTimeFieldKey],
    );
    if (!ValidateHelper.bookingVehicleShouldShowProblemArisesCard(need)) {
      return null;
    }
    final raw = formValues['approved_tbp'];
    final tbp = raw is int
        ? raw
        : int.tryParse(bookingVehicleTrimFormValue(raw)) ?? 0;
    if (tbp == 0) {
      return 'Vui lòng chọn người duyệt TBP.';
    }
    if (bookingVehicleTrimFormValue(formValues['problem_arises']).isEmpty) {
      return 'Vui lòng nhập vấn đề phát sinh.';
    }
    return null;
  }

  Future<void> _onSubmitPassengerGo(
    Map<String, dynamic> formValues,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        message: null,
      ),
    );

    final employeeId = state.employeeId;
    if (employeeId == null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Không xác định được nhân viên đăng ký.',
        ),
      );
      return;
    }

    final n = state.passengerGoLineCount;
    if (n <= 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Chưa có dòng người đi.',
        ),
      );
      return;
    }

    final bookerName =
        state.currentEmployee?.fullName?.trim() ?? '';

    final projectId = resolveBookingVehicleProjectId(
      formValues['project'],
      state.projects,
    );
    if (projectId == 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn dự án.',
        ),
      );
      return;
    }

    for (var i = 0; i < n; i++) {
      final name = bookingVehicleTrimFormValue(
        formValues['passenger_full_name_$i'],
      );
      final code = bookingVehicleTrimFormValue(formValues['passenger_code_$i']);
      if (name.isEmpty && code.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập thông tin người đi (dòng ${i + 1}).',
          ),
        );
        return;
      }
    }

    final problemErr = _bookingVehicleProblemArisesSubmitError(formValues);
    if (problemErr != null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: problemErr,
        ),
      );
      return;
    }

    final payloads = buildAllPassengerGoCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      passengerLineCount: n,
    );

    for (final payload in payloads) {
      final res = await _bookingVehicleRepo.createBookingVehicle(
        payload: payload,
      );

      final failed = await res.fold(
        (err) async {
          _log.logE('❌ createBookingVehicle failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              message: err.getErrorMessage,
            ),
          );
          return true;
        },
        (created) async {
          _log.logI('✅ createBookingVehicle OK id=${created.id}');
          return false;
        },
      );

      if (failed) return;
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        submitSuccess: true,
        message: null,
      ),
    );
  }

  Future<void> _onSubmitPassengerReturn(
    Map<String, dynamic> formValues,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        message: null,
      ),
    );

    final employeeId = state.employeeId;
    if (employeeId == null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Không xác định được nhân viên đăng ký.',
        ),
      );
      return;
    }

    final n = state.passengerGoLineCount;
    if (n <= 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Chưa có dòng người về.',
        ),
      );
      return;
    }

    final bookerName =
        state.currentEmployee?.fullName?.trim() ?? '';

    final projectId = resolveBookingVehicleProjectId(
      formValues['project'],
      state.projects,
    );
    if (projectId == 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn dự án.',
        ),
      );
      return;
    }

    if (bookingVehicleFormatApiDateTime(formValues['time_return']) == null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn thời gian đón.',
        ),
      );
      return;
    }

    if (bookingVehicleFormatApiDateTime(formValues['time_need_present']) ==
        null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn thời gian cần về.',
        ),
      );
      return;
    }

    for (var i = 0; i < n; i++) {
      final name = bookingVehicleTrimFormValue(
        formValues['passenger_full_name_$i'],
      );
      final code = bookingVehicleTrimFormValue(formValues['passenger_code_$i']);
      if (name.isEmpty && code.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập thông tin người về (dòng ${i + 1}).',
          ),
        );
        return;
      }
    }

    final payloads = buildAllPassengerReturnCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      passengerLineCount: n,
    );

    for (final payload in payloads) {
      final res = await _bookingVehicleRepo.createBookingVehicle(
        payload: payload,
      );

      final failed = await res.fold(
        (err) async {
          _log.logE('❌ createBookingVehicle (return) failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              message: err.getErrorMessage,
            ),
          );
          return true;
        },
        (created) async {
          _log.logI(
            '✅ createBookingVehicle (return) OK id=${created.id}',
          );
          return false;
        },
      );

      if (failed) return;
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        submitSuccess: true,
        message: null,
      ),
    );
  }

  Future<void> _onSubmitCommercialDelivery(
    Map<String, dynamic> formValues,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        message: null,
      ),
    );

    final employeeId = state.employeeId;
    if (employeeId == null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Không xác định được nhân viên đăng ký.',
        ),
      );
      return;
    }

    final apiCategory = bookingVehicleApiCategoryForCommercialDeliveryBookingType(
      formValues['booking_type']?.toString(),
    );
    if (apiCategory == 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Loại đăng ký giao hàng không hợp lệ.',
        ),
      );
      return;
    }

    final n = state.commercialReceiverLineCount;
    if (n <= 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Chưa có dòng người nhận.',
        ),
      );
      return;
    }

    final bookerName = state.currentEmployee?.fullName?.trim() ?? '';

    final projectId = resolveBookingVehicleProjectId(
      formValues['project'],
      state.projects,
    );
    if (projectId == 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn dự án.',
        ),
      );
      return;
    }

    if (bookingVehicleFormatApiDateTime(formValues['time_need_present']) ==
        null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn thời gian cần giao đến.',
        ),
      );
      return;
    }

    if (bookingVehicleFormatApiDateTime(formValues['time_return']) == null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn thời gian lấy hàng.',
        ),
      );
      return;
    }

    for (var i = 0; i < n; i++) {
      final nameManual = bookingVehicleTrimFormValue(
        formValues['receiver_name_$i'],
      );
      final empPick = bookingVehicleTrimFormValue(
        formValues['receiver_employee_$i'],
      );
      if (nameManual.isEmpty && empPick.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message:
                'Vui lòng nhập người nhận hoặc chọn nhân viên (dòng ${i + 1}).',
          ),
        );
        return;
      }

      final phone = bookingVehicleTrimFormValue(
        formValues['receiver_phone_number_$i'],
      );
      if (phone.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập SĐT người nhận (dòng ${i + 1}).',
          ),
        );
        return;
      }

      final pkg = bookingVehicleTrimFormValue(
        formValues['commercial_package_name_$i'],
      );
      if (pkg.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập tên hàng hoá (dòng ${i + 1}).',
          ),
        );
        return;
      }

      final size = bookingVehicleTrimFormValue(formValues['package_size_$i']);
      final weight =
          bookingVehicleTrimFormValue(formValues['package_weight_$i']);
      if (size.isEmpty || weight.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message:
                'Vui lòng nhập kích thước và khối lượng (dòng ${i + 1}).',
          ),
        );
        return;
      }

      final qtyRaw = formValues['commercial_package_quantity_$i'];
      final qty = qtyRaw is int
          ? qtyRaw
          : int.tryParse(bookingVehicleTrimFormValue(qtyRaw)) ?? 0;
      if (qty <= 0) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập số lượng hợp lệ (dòng ${i + 1}).',
          ),
        );
        return;
      }
    }

    final problemErr = _bookingVehicleProblemArisesSubmitError(formValues);
    if (problemErr != null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: problemErr,
        ),
      );
      return;
    }

    final payloads = buildAllCommercialDeliveryCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      receiverLineCount: n,
      apiCategory: apiCategory,
    );

    for (var i = 0; i < payloads.length; i++) {
      final payload = payloads[i];
      final res = await _bookingVehicleRepo.createBookingVehicle(
        payload: payload,
      );

      final created = await res.fold(
        (err) async {
          _log.logE('❌ createBookingVehicle (commercial) failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              message: err.getErrorMessage,
            ),
          );
          return null;
        },
        (c) async {
          _log.logI(
            '✅ createBookingVehicle (commercial) OK id=${c.id}',
          );
          return c;
        },
      );

      if (created == null) return;

      final bookingId = created.id;
      if (bookingId != null && bookingId > 0) {
        final categoryText =
            bookingVehicleTrimFormValue(formValues['booking_type']);
        final year = bookingVehicleParseFormDateTime(
              formValues['time_need_present'],
            )?.year ??
            DateTime.now().year;
        final subPath = bookingVehicleUploadSubPath(
          year: year,
          categoryText: categoryText,
          bookingId: bookingId,
        );
        final images = bookingVehicleParsePackageImageField(
          formValues['commercial_package_image_$i'],
        );
        if (images.isEmpty) {
          _log.logI(
            '📎 upload-file bỏ qua (giao hàng) dòng=${i + 1} vehicleBookingId=$bookingId — không có ảnh',
          );
        } else {
          _log.logI(
            '📎 upload-file (giao hàng) dòng=${i + 1} vehicleBookingId=$bookingId '
            'số_ảnh=${images.length} subPath=$subPath',
          );
        }
        for (var fi = 0; fi < images.length; fi++) {
          final f = images[fi];
          final src = (f.path != null && f.path!.trim().isNotEmpty)
              ? 'path'
              : 'bytes';
          _log.logI(
            '📤 upload-file gọi repo (giao hàng) [${fi + 1}/${images.length}] '
            'vehicleBookingId=$bookingId name="${f.name}" size=${f.size} nguồn=$src',
          );
          final up = await _bookingVehicleRepo.uploadBookingVehicleFile(
            vehicleBookingId: bookingId,
            file: f,
            subPath: subPath,
          );
          final upFailed = await up.fold(
            (err) async {
              _log.logE('❌ uploadBookingVehicleFile (commercial) failed: $err');
              emit(
                state.copyWith(
                  isSubmitting: false,
                  message: err.getErrorMessage,
                ),
              );
              return true;
            },
            (_) async {
              _log.logI(
                '✅ upload-file repo OK (giao hàng) vehicleBookingId=$bookingId name="${f.name}"',
              );
              return false;
            },
          );
          if (upFailed) return;
        }
      }
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        submitSuccess: true,
        message: null,
      ),
    );
  }

  Future<void> _onSubmitCommercialPickup(
    Map<String, dynamic> formValues,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        message: null,
      ),
    );

    final employeeId = state.employeeId;
    if (employeeId == null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Không xác định được nhân viên đăng ký.',
        ),
      );
      return;
    }

    final apiCategory = bookingVehicleApiCategoryForPickupBookingType(
      formValues['booking_type']?.toString(),
    );
    if (apiCategory == 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Loại đăng ký lấy hàng không hợp lệ.',
        ),
      );
      return;
    }

    final n = state.pickupGiverLineCount;
    if (n <= 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Chưa có dòng người giao.',
        ),
      );
      return;
    }

    final bookerName = state.currentEmployee?.fullName?.trim() ?? '';

    final projectId = resolveBookingVehicleProjectId(
      formValues['pickup_project'],
      state.projects,
    );
    if (projectId == 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn dự án.',
        ),
      );
      return;
    }

    if (bookingVehicleFormatApiDateTime(
          formValues['pickup_departure_time'],
        ) ==
        null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn thời gian xuất phát.',
        ),
      );
      return;
    }

    if (bookingVehicleFormatApiDateTime(
          formValues['pickup_need_arrive_time'],
        ) ==
        null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn thời gian cần đến lấy.',
        ),
      );
      return;
    }

    for (var i = 0; i < n; i++) {
      final nameManual = bookingVehicleTrimFormValue(
        formValues['pickup_giver_name_$i'],
      );
      final empPick = bookingVehicleTrimFormValue(
        formValues['pickup_giver_employee_$i'],
      );
      if (nameManual.isEmpty && empPick.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message:
                'Vui lòng nhập người giao hoặc chọn nhân viên (dòng ${i + 1}).',
          ),
        );
        return;
      }

      final phone = bookingVehicleTrimFormValue(
        formValues['pickup_giver_phone_number_$i'],
      );
      if (phone.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập SĐT người giao (dòng ${i + 1}).',
          ),
        );
        return;
      }

      final pkg = bookingVehicleTrimFormValue(
        formValues['pickup_package_name_$i'],
      );
      if (pkg.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập tên hàng hoá (dòng ${i + 1}).',
          ),
        );
        return;
      }

      final size =
          bookingVehicleTrimFormValue(formValues['pickup_package_size_$i']);
      final weight =
          bookingVehicleTrimFormValue(formValues['pickup_package_weight_$i']);
      if (size.isEmpty || weight.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message:
                'Vui lòng nhập kích thước và khối lượng (dòng ${i + 1}).',
          ),
        );
        return;
      }

      final qtyRaw = formValues['pickup_package_quantity_$i'];
      final qty = qtyRaw is int
          ? qtyRaw
          : int.tryParse(bookingVehicleTrimFormValue(qtyRaw)) ?? 0;
      if (qty <= 0) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập số lượng hợp lệ (dòng ${i + 1}).',
          ),
        );
        return;
      }
    }

    final problemErr = _bookingVehicleProblemArisesSubmitError(
      formValues,
      needTimeFieldKey: 'pickup_need_arrive_time',
    );
    if (problemErr != null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: problemErr,
        ),
      );
      return;
    }

    final payloads = buildAllCommercialPickupCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      giverLineCount: n,
      apiCategory: apiCategory,
    );

    for (var i = 0; i < payloads.length; i++) {
      final payload = payloads[i];
      final res = await _bookingVehicleRepo.createBookingVehicle(
        payload: payload,
      );

      final created = await res.fold(
        (err) async {
          _log.logE('❌ createBookingVehicle (pickup) failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              message: err.getErrorMessage,
            ),
          );
          return null;
        },
        (c) async {
          _log.logI('✅ createBookingVehicle (pickup) OK id=${c.id}');
          return c;
        },
      );

      if (created == null) return;

      final bookingId = created.id;
      if (bookingId != null && bookingId > 0) {
        final categoryText =
            bookingVehicleTrimFormValue(formValues['booking_type']);
        final year = bookingVehicleParseFormDateTime(
              formValues['pickup_need_arrive_time'],
            )?.year ??
            DateTime.now().year;
        final subPath = bookingVehicleUploadSubPath(
          year: year,
          categoryText: categoryText,
          bookingId: bookingId,
        );
        final images = bookingVehicleParsePackageImageField(
          formValues['pickup_package_image_$i'],
        );
        if (images.isEmpty) {
          _log.logI(
            '📎 upload-file bỏ qua (lấy hàng) dòng=${i + 1} vehicleBookingId=$bookingId — không có ảnh',
          );
        } else {
          _log.logI(
            '📎 upload-file (lấy hàng) dòng=${i + 1} vehicleBookingId=$bookingId '
            'số_ảnh=${images.length} subPath=$subPath',
          );
        }
        for (var fi = 0; fi < images.length; fi++) {
          final f = images[fi];
          final src = (f.path != null && f.path!.trim().isNotEmpty)
              ? 'path'
              : 'bytes';
          _log.logI(
            '📤 upload-file gọi repo (lấy hàng) [${fi + 1}/${images.length}] '
            'vehicleBookingId=$bookingId name="${f.name}" size=${f.size} nguồn=$src',
          );
          final up = await _bookingVehicleRepo.uploadBookingVehicleFile(
            vehicleBookingId: bookingId,
            file: f,
            subPath: subPath,
          );
          final upFailed = await up.fold(
            (err) async {
              _log.logE('❌ uploadBookingVehicleFile (pickup) failed: $err');
              emit(
                state.copyWith(
                  isSubmitting: false,
                  message: err.getErrorMessage,
                ),
              );
              return true;
            },
            (_) async {
              _log.logI(
                '✅ upload-file repo OK (lấy hàng) vehicleBookingId=$bookingId name="${f.name}"',
              );
              return false;
            },
          );
          if (upFailed) return;
        }
      }
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        submitSuccess: true,
        message: null,
      ),
    );
  }
}
