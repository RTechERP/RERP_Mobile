import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/features/auth/data/repository/auth_repository.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repo.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/repository/booking_vehicle_repository.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../booking_vehicle_package_image_form.dart';
import '../booking_vehicle_passenger_go_payload.dart';
import '../booking_vehicle_upload_sub_path.dart';
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
        prefillCurrentEmployee: (employee) =>
            _onPrefillCurrentEmployee(emit, employee),
        initPassengerGoInfos: () => _onInitPassengerGoInfos(emit),
        initPassengerGoInfosForEdit: () =>
            _onInitPassengerGoInfosForEdit(emit),
        addPassengerGoInfo: () => _onAddPassengerGoInfo(emit),
        expandPassengerGoInfo: (index) =>
            _onExpandPassengerGoInfo(index, emit),
        deletePassengerGoInfo: (index, shiftedFields) =>
            _onDeletePassengerGoInfo(index, shiftedFields, emit),
        initCommercialReceiverInfos: () =>
            _onInitCommercialReceiverInfos(emit),
        addCommercialReceiverInfo: () =>
            _onAddCommercialReceiverInfo(emit),
        expandCommercialReceiverInfo: (index) =>
            _onExpandCommercialReceiverInfo(index, emit),
        deleteCommercialReceiverInfo: (index, shiftedFields) =>
            _onDeleteCommercialReceiverInfo(index, shiftedFields, emit),
        initPickupGiverInfos: () => _onInitPickupGiverInfos(emit),
        addPickupGiverInfo: () => _onAddPickupGiverInfo(emit),
        expandPickupGiverInfo: (index) =>
            _onExpandPickupGiverInfo(index, emit),
        deletePickupGiverInfo: (index, shiftedFields) =>
            _onDeletePickupGiverInfo(index, shiftedFields, emit),
        updateForm: (values) async {
          _onUpdateForm(values, emit);
        },
        updateInfo: (values) async {
          _onUpdateInfo(values, emit);
        },
        selectApprover: (employeeId) async {
          emit(state.copyWith(selectedApproverEmployeeId: employeeId));
        },
        submitPassengerGo: (formValues, existingBookingId) async {
          await _onSubmitPassengerGo(
            formValues,
            emit,
            existingBookingId: existingBookingId,
          );
        },
        submitSelfVehicle: (formValues, existingBookingId) async {
          await _onSubmitSelfVehicle(
            formValues,
            emit,
            existingBookingId: existingBookingId,
          );
        },
        submitPassengerReturn: (formValues, existingBookingId) async {
          await _onSubmitPassengerReturn(
            formValues,
            emit,
            existingBookingId: existingBookingId,
          );
        },
        submitCommercialDelivery: (formValues, existingBookingId) async {
          await _onSubmitCommercialDelivery(
            formValues,
            emit,
            existingBookingId: existingBookingId,
          );
        },
        submitCommercialPickup: (formValues, existingBookingId) async {
          await _onSubmitCommercialPickup(
            formValues,
            emit,
            existingBookingId: existingBookingId,
          );
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
        cancelBookingVehicle: (vehicleBookingId) async {
          await _onCancelBookingVehicle(vehicleBookingId, emit);
        },
        changeDateRange: (dateStart, dateEnd) async {
          await _onChangeDateRange(dateStart, dateEnd, emit);
        },
        changeBookingTypeGroup: (group) async {
          // Khi đổi loại đặt xe: set lineCount=1 ngay để BlocBuilder trigger hiển thị form
          // (không cần chờ `initXxxInfos` debounce). Reset các nhóm khác về 0.
          switch (group) {
            case 0:
            case 1:
            case 4: // Chủ động phương tiện
              emit(state.copyWith(
                bookingTypeGroup: group,
                passengerGoLineCount: 1,
                expandedPassengerGoIndex: 0,
                commercialReceiverLineCount: 0,
                pickupGiverLineCount: 0,
                selectedApproverEmployeeId: null,
              ));
              break;
            case 2:
              emit(state.copyWith(
                bookingTypeGroup: group,
                passengerGoLineCount: 0,
                commercialReceiverLineCount: 1,
                expandedCommercialDeliveryReceiverIndex: 0,
                pickupGiverLineCount: 0,
                selectedApproverEmployeeId: null,
              ));
              break;
            case 3:
              emit(state.copyWith(
                bookingTypeGroup: group,
                passengerGoLineCount: 0,
                commercialReceiverLineCount: 0,
                pickupGiverLineCount: 1,
                expandedPickupGiverIndex: 0,
                selectedApproverEmployeeId: null,
              ));
              break;
            default:
              emit(state.copyWith(
                bookingTypeGroup: group,
                selectedApproverEmployeeId: null,
              ));
          }
        },
      );
    });
  }

  Future<void> _onCancelBookingVehicle(
    int vehicleBookingId,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        isDeleting: true,
        deleteSuccess: false,
        message: null,
      ),
    );

    final result = await _bookingVehicleRepo.cancelBookingVehicle(
      vehicleBookingId: vehicleBookingId,
    );

    result.fold(
      (error) {
        emit(
          state.copyWith(
            isDeleting: false,
            deleteSuccess: false,
            message: error.getErrorMessage,
          ),
        );
      },
      (_) {
        final updated = state.bookingVehicle
            .where((e) => e.id != vehicleBookingId)
            .toList();
        emit(
          state.copyWith(
            bookingVehicle: updated,
            isDeleting: false,
            deleteSuccess: true,
            status: BaseStateStatus.success,
            message: null,
          ),
        );
        add(const BookingVehicleEvent.init());
      },
    );
  }

  //---(Init)---//

  /// Tính cận trên/dưới của tuần trong tháng chứa [d].
  /// Tuần 1 = ngày 1–7, Tuần 2 = 8–14, Tuần 3 = 15–21, Tuần 4 = 22–cuối tháng.
  static (DateTime start, DateTime end) _weekBoundsOfMonth(DateTime d) {
    final y = d.year, m = d.month;
    final dayOfMonth = d.day;
    final weekIndex = ((dayOfMonth - 1) / 7).floor();

    final startDay = weekIndex * 7 + 1;
    int endDay;
    if (weekIndex < 3) {
      endDay = startDay + 6;
    } else {
      endDay = DateTime(y, m + 1, 0).day;
    }

    final start = DateTime(y, m, startDay);
    final end = DateTime(y, m, endDay, 23, 59, 59);
    return (start, end);
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
        // ── 1. Hydrate projects cache từ SharedPreferences trước ──────────
        // Nếu app đã mở lần trước có cache → đọc ngay, không cần gọi API.
        // Sau đó mới fire API để refresh (fire-and-forget).
        final cachedProjects = await BookingVehicleRepository
            .loadProjectsCacheToMemory(log: _log);
        if (cachedProjects.isNotEmpty && state.projects.isEmpty) {
          emit(state.copyWith(projects: cachedProjects));
          _log.logI(
              '✅ _onInit: projects hydrated from cache (${cachedProjects.length})');
        }

        // ── 1b. Hydrate approvers cache (cùng pattern) ──────────────────────
        final cachedApprovers = await BookingVehicleRepository
            .loadApproversCacheToMemory(log: _log);
        if (cachedApprovers.isNotEmpty && state.approver.isEmpty) {
          emit(state.copyWith(approver: cachedApprovers));
          _log.logI(
              '✅ _onInit: approvers hydrated from cache (${cachedApprovers.length})');
        }

        // ── 1c. Hydrate employees cache (cùng pattern) ─────────────────────
        final cachedEmployees = await BookingVehicleRepository
            .loadEmployeesCacheToMemory(log: _log);
        if (cachedEmployees.isNotEmpty && state.employee.isEmpty) {
          emit(state.copyWith(employee: cachedEmployees));
          _log.logI(
              '✅ _onInit: employees hydrated from cache (${cachedEmployees.length})');
        }

        // ── 2. Refresh từ API (fire-and-forget) ────────────────────────────
        // ignore: unawaited_futures
        _loadAndCacheProjects();
        // ignore: unawaited_futures
        _loadAndCacheApprovers();
        // ignore: unawaited_futures
        _loadAndCacheEmployees();

        final now = DateTime.now();
        // Theo tuần của tháng: T1→CN.
        final (todayStart, weekEnd) = _weekBoundsOfMonth(now);
        final startStr =
            DateFormat('yyyy-MM-ddTHH:mm:ss').format(todayStart);
        final endStr = DateFormat('yyyy-MM-ddTHH:mm:ss').format(weekEnd);

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

        _log.logI('📋 init payload: $payload');

        final res = await _bookingVehicleRepo.getBookingVehicle(
          payload: payload,
        );

        await res.fold(
              (l) async {
            _log.logE('❌ API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
              (r) async {
            _log.logI('✅ API success - total: ${r.length}');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                bookingVehicle: r,
                dateStart: todayStart,
                dateEnd: weekEnd,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
    DateTime dateStart,
    DateTime dateEnd,
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
          (err) async {
        _log.logE('❌ Get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
          (user) async {
        final startStr =
            DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateStart);
        final endStr = DateFormat('yyyy-MM-ddTHH:mm:ss').format(
          DateTime(dateEnd.year, dateEnd.month, dateEnd.day, 23, 59, 59),
        );

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

        _log.logI('📋 changeDateRange payload: $payload');

        final res = await _bookingVehicleRepo.getBookingVehicle(
          payload: payload,
        );

        await res.fold(
              (l) async {
            _log.logE('❌ changeDateRange API failed: $l');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
              (r) async {
            _log.logI('✅ changeDateRange success - total: ${r.length}');
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                bookingVehicle: r,
                dateStart: dateStart,
                dateEnd: dateEnd,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onInitAdd(Emitter<BookingVehicleState> emit) async {
    emit(state.copyWith(passengerGoFirstRowIsCurrentUserSlot: true));
    await _loadInitAdd(emit, silent: false);
  }

  Future<void> _onPreloadInitAdd(Emitter<BookingVehicleState> emit) async {
    await _loadInitAdd(emit, silent: true);
  }

  /// Emit currentEmployee ngay từ SharedPreferences — không gọi API.
  _onPrefillCurrentEmployee(
    Emitter<BookingVehicleState> emit,
    BookingVehiclePersonalItem? employee,
  ) {
    if (employee == null) return;
    emit(
      state.copyWith(
        currentEmployee: employee,
        passengerGoFirstRowIsCurrentUserSlot: true,
      ),
    );
  }

  Future<void> _loadInitAdd(
    Emitter<BookingVehicleState> emit, {
    required bool silent,
  }) async {
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

    if (!silent) {
      emit(state.copyWith(status: BaseStateStatus.loading));
    }

    // Delegate sang _loadAndCacheLookupData (cache-first + parallel + tolerant),
    // pattern giống WorkTripBloc._loadAndCacheLookupData.
    await _loadAndCacheLookupData(employeeId);
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

  /// Preload riêng `getProject` từ màn list, lưu vào
  /// [BookingVehicleRepository.saveProjectsCache] **và emit ngay vào state**
  /// để màn Add/Edit (nếu đang mở) hoặc mở sau đều hiển thị được dropdown dự án.
  Future<void> _loadAndCacheProjects() async {
    try {
      final res = await _bookingVehicleRepo.getProject();
      await res.fold(
        (l) async => _log.logE('❌ preload getProject failed: $l'),
        (r) async {
          if (r.isEmpty) {
            _log.logW('⚠️ preload getProject returned empty');
            return;
          }
          await BookingVehicleRepository.saveProjectsCache(
            projects: r,
            log: _log,
          );
          // Emit ngay vào state — nếu state.projects đang rỗng thì dropdown
          // form Add/Edit sẽ tự động hiển thị data mà không cần đợi initAdd.
          if (state.projects.length != r.length ||
              state.projects.isEmpty) {
            emit(state.copyWith(projects: r));
            _log.logI(
                '✅ preload getProject done — ${r.length} items emitted to state');
          } else {
            _log.logI('✅ preload getProject done — projects already in state');
          }
        },
      );
    } catch (e) {
      _log.logE('❌ preload getProject exception: $e');
    }
  }

  /// Preload riêng `getApprover` từ màn list, lưu vào
  /// [BookingVehicleRepository.saveApproversCache] **và emit ngay vào state**
  /// để màn Add/Edit (nếu đang mở) hoặc mở sau đều hiển thị được dropdown
  /// người duyệt.
  Future<void> _loadAndCacheApprovers() async {
    try {
      final res = await _bookingVehicleRepo.getApprover();
      await res.fold(
        (l) async => _log.logE('❌ preload getApprover failed: $l'),
        (r) async {
          if (r.isEmpty) {
            _log.logW('⚠️ preload getApprover returned empty');
            return;
          }
          await BookingVehicleRepository.saveApproversCache(
            approvers: r,
            log: _log,
          );
          // Emit ngay vào state.
          if (state.approver.length != r.length || state.approver.isEmpty) {
            emit(state.copyWith(approver: r));
            _log.logI(
                '✅ preload getApprover done — ${r.length} items emitted to state');
          } else {
            _log.logI('✅ preload getApprover done — approvers already in state');
          }
        },
      );
    } catch (e) {
      _log.logE('❌ preload getApprover exception: $e');
    }
  }

  /// Preload riêng `getEmployee` từ màn list, lưu vào
  /// [BookingVehicleRepository.saveEmployeesCache] **và emit ngay vào state**
  /// để màn Add/Edit (nếu đang mở) hoặc mở sau đều hiển thị được dropdown
  /// nhân viên (booker/passenger/giver/...).
  Future<void> _loadAndCacheEmployees() async {
    try {
      final res = await _bookingVehicleRepo.getEmployee();
      await res.fold(
        (l) async => _log.logE('❌ preload getEmployee failed: $l'),
        (r) async {
          if (r.isEmpty) {
            _log.logW('⚠️ preload getEmployee returned empty');
            return;
          }
          await BookingVehicleRepository.saveEmployeesCache(
            employees: r,
            log: _log,
          );
          // Emit ngay vào state.
          if (state.employee.length != r.length || state.employee.isEmpty) {
            emit(state.copyWith(employee: r));
            _log.logI(
                '✅ preload getEmployee done — ${r.length} items emitted to state');
          } else {
            _log.logI(
                '✅ preload getEmployee done — employees already in state');
          }
        },
      );
    } catch (e) {
      _log.logE('❌ preload getEmployee exception: $e');
    }
  }

  /// Tải lookup data (trừ project) từ API song song + emit vào state.
  /// Project được load riêng qua [_loadAndCacheProjects] từ màn list và
  /// đọc lại từ [BookingVehicleRepository.getProjectsCache] tại đây.
  Future<void> _loadAndCacheLookupData(int employeeId) async {
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ lookup preload skipped: in-flight');
      return;
    }

    // Đọc project + approvers + employees từ in-memory cache (đã được preload từ màn list).
    final projects = BookingVehicleRepository.projectsSync;
    final approvers = BookingVehicleRepository.approversSync;
    final employees = BookingVehicleRepository.employeesSync;

    final initAddCache =
        await BookingVehicleRepository.getInitAddCache(log: _log);
    final restValid = initAddCache != null &&
        initAddCache.employeeId == employeeId &&
        initAddCache.provinceArrives.isNotEmpty &&
        initAddCache.provinceDeparture.isNotEmpty;

    if (restValid &&
        projects.isNotEmpty &&
        approvers.isNotEmpty &&
        employees.isNotEmpty) {
      _log.logI('✅ initAdd cache hit for user=$employeeId');
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          employeeId: employeeId,
          provinceArrives: initAddCache.provinceArrives,
          provinceDeparture: initAddCache.provinceDeparture,
          employee: employees,
          projects: projects,
          approver: approvers,
          currentEmployee: initAddCache.currentEmployee,
        ),
      );
      // Vẫn đảm bảo gọi getDepartmentIds nếu chưa có trong state.
      await _loadSaleDepartmentIdsIfNeeded();
      return;
    }

    _log.logI('🔄 initAdd cache miss for user=$employeeId — fetching API');
    _isInitAddInFlight = true;
    try {
      // Bắn 3 API song song (chỉ các API phụ thuộc employeeId).
      final provinceArrivesFut =
          _bookingVehicleRepo.getProvinceArrives(employeeId: employeeId);
      final provinceDepartureFut =
          _bookingVehicleRepo.getProvinceDeparture(employeeId: employeeId);
      final currentEmployeeFut =
          _bookingVehicleRepo.getEmployeeById(employeeId: employeeId);

      // Fallback nếu cache rỗng (chỉ các lookup đã tách cache riêng).
      final projectsFut =
          projects.isEmpty ? _bookingVehicleRepo.getProject() : null;
      final approversFut =
          approvers.isEmpty ? _bookingVehicleRepo.getApprover() : null;
      final employeesFut =
          employees.isEmpty ? _bookingVehicleRepo.getEmployee() : null;

      List<ProvinceArrivesItem> provinceArrives = [];
      List<ProvinceDepartureItem> provinceDeparture = [];
      List<BookingVehiclePersonalItem> fetchedEmployees = [];
      List<BookingVehicleProjectItem> fetchedProjects = [];
      List<ApproverItem> fetchedApprovers = [];
      BookingVehiclePersonalItem? currentEmployee;

      final provinceArrivesRes = await provinceArrivesFut;
      final provinceDepartureRes = await provinceDepartureFut;
      final currentEmployeeRes = await currentEmployeeFut;

      provinceArrivesRes.fold(
        (l) => _log.logE('getProvinceArrives failed: $l'),
        (r) => provinceArrives = r,
      );
      provinceDepartureRes.fold(
        (l) => _log.logE('getProvinceDeparture failed: $l'),
        (r) => provinceDeparture = r,
      );
      currentEmployeeRes.fold(
        (l) => _log.logE('getEmployeeById failed: $l'),
        (r) => currentEmployee = r,
      );

      if (projectsFut != null) {
        final projectsRes = await projectsFut;
        projectsRes.fold(
          (l) => _log.logE('getProject failed: $l'),
          (r) => fetchedProjects = r,
        );
        if (fetchedProjects.isNotEmpty) {
          await BookingVehicleRepository.saveProjectsCache(
            projects: fetchedProjects,
            log: _log,
          );
        }
      }

      if (approversFut != null) {
        final approversRes = await approversFut;
        approversRes.fold(
          (l) => _log.logE('getApprover failed: $l'),
          (r) => fetchedApprovers = r,
        );
        if (fetchedApprovers.isNotEmpty) {
          await BookingVehicleRepository.saveApproversCache(
            approvers: fetchedApprovers,
            log: _log,
          );
        }
      }

      if (employeesFut != null) {
        final employeesRes = await employeesFut;
        employeesRes.fold(
          (l) => _log.logE('getEmployee failed: $l'),
          (r) => fetchedEmployees = r,
        );
        if (fetchedEmployees.isNotEmpty) {
          await BookingVehicleRepository.saveEmployeesCache(
            employees: fetchedEmployees,
            log: _log,
          );
        }
      }

      final finalProjects =
          fetchedProjects.isNotEmpty ? fetchedProjects : projects;
      final finalApprovers =
          fetchedApprovers.isNotEmpty ? fetchedApprovers : approvers;
      final finalEmployees =
          fetchedEmployees.isNotEmpty ? fetchedEmployees : employees;

      await BookingVehicleRepository.saveInitAddCache(
        employeeId: employeeId,
        provinceArrives: provinceArrives,
        provinceDeparture: provinceDeparture,
        employees: finalEmployees,
        projects: finalProjects,
        approvers: finalApprovers,
        currentEmployee: currentEmployee,
        log: _log,
      );

      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          employeeId: employeeId,
          provinceArrives: provinceArrives,
          provinceDeparture: provinceDeparture,
          employee: finalEmployees,
          projects: finalProjects,
          approver: finalApprovers,
          currentEmployee: currentEmployee,
        ),
      );

      // Tải danh sách department IDs (Sale) từ API và emit vào state.
      await _loadSaleDepartmentIdsIfNeeded();
    } catch (e) {
      _log.logE('❌ initAdd exception: $e');
    } finally {
      _isInitAddInFlight = false;
    }
  }

  /// Lấy danh sách ID phòng ban Sale từ API `/BusinessConfig/get-department-ids?configType=1`.
  /// Skip nếu state đã có sẵn (cache in-memory). Emit kết quả vào [BookingVehicleState.saleDepartmentIds].
  Future<void> _loadSaleDepartmentIdsIfNeeded() async {
    if (state.saleDepartmentIds.isNotEmpty) return;
    final res = await _bookingVehicleRepo.getDepartmentIds(configType: 1);
    res.fold(
      (l) => _log.logE('getDepartmentIds failed: $l'),
      (r) {
        _log.logI('✅ getDepartmentIds OK: ${r.length} ids');
        if (state.saleDepartmentIds.length != r.length ||
            state.saleDepartmentIds.isEmpty) {
          emit(state.copyWith(saleDepartmentIds: r));
        }
      },
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

  Future<void> _onInitPassengerGoInfosForEdit(
    Emitter<BookingVehicleState> emit,
  ) async {
    emit(
      state.copyWith(
        passengerGoLineCount: 1,
        expandedPassengerGoIndex: 0,
        passengerGoFirstRowIsCurrentUserSlot: false,
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

  /// Xoá dòng: patch form + merge shifted data vào state trước khi emit.
  Future<void> _onDeletePassengerGoInfo(
    int index,
    Map<String, dynamic> shiftedFields,
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

    final mergedInfo = Map<String, dynamic>.from(state.infoFieldValues)
      ..addAll(shiftedFields);

    emit(
      state.copyWith(
        passengerGoLineCount: n - 1,
        expandedPassengerGoIndex: nextExpanded,
        passengerGoFirstRowIsCurrentUserSlot: index == 0
            ? false
            : state.passengerGoFirstRowIsCurrentUserSlot,
        passengerFormGeneration: state.passengerFormGeneration + 1,
        infoFieldValues: mergedInfo,
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
    Map<String, dynamic> shiftedFields,
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

    final mergedInfo = Map<String, dynamic>.from(state.infoFieldValues)
      ..addAll(shiftedFields);

    emit(
      state.copyWith(
        commercialReceiverLineCount: n - 1,
        expandedCommercialDeliveryReceiverIndex: nextExpanded,
        commercialReceiverFormGeneration:
            state.commercialReceiverFormGeneration + 1,
        infoFieldValues: mergedInfo,
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
    Map<String, dynamic> shiftedFields,
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

    final mergedInfo = Map<String, dynamic>.from(state.infoFieldValues)
      ..addAll(shiftedFields);

    emit(
      state.copyWith(
        pickupGiverLineCount: n - 1,
        expandedPickupGiverIndex: nextExpanded,
        pickupGiverFormGeneration: state.pickupGiverFormGeneration + 1,
        infoFieldValues: mergedInfo,
      ),
    );
  }

  _onUpdateForm(
    Map<String, dynamic> values,
    Emitter<BookingVehicleState> emit,
  ) {
    if (values.isEmpty) return;
    final merged = Map<String, dynamic>.from(state.formFieldValues)
      ..addAll(values);
    emit(state.copyWith(formFieldValues: merged));
  }

  _onUpdateInfo(
    Map<String, dynamic> values,
    Emitter<BookingVehicleState> emit,
  ) {
    if (values.isEmpty) return;
    final merged = Map<String, dynamic>.from(state.infoFieldValues)
      ..addAll(values);
    emit(state.copyWith(infoFieldValues: merged));
  }

  Future<void> _onSubmitPassengerGo(
    Map<String, dynamic> formValues,
    Emitter<BookingVehicleState> emit, {
    int? existingBookingId,
  }) async {
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

    final n = bookingVehicleEffectivePassengerLineCount(
      form: formValues,
      stateCount: state.passengerGoLineCount,
    );
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

    _log.logI('📋 Submit passengerGo — project display: "${formValues['project']}", projects count: ${state.projects.length}');

    final projectId = resolveBookingVehicleProjectId(
      formValues['project'],
      state.projects,
    );
    if (projectId == 0) {
      _log.logE('❌ projectId=0 — raw="${formValues['project']}", projects.isEmpty=${state.projects.isEmpty}');
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Vui lòng chọn dự án.',
        ),
      );
      return;
    }

    for (var i = 0; i < n; i++) {
      // Bỏ qua dòng đã xóa/shift (computeShiftedFields dùng '' thay vì null
      // sau khi shift → cần check thêm trim để skip dòng trống).
      if (bookingVehicleIsPassengerRowEmpty(formValues, i)) continue;

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

    final approvedTBP =
        state.selectedApproverEmployeeId ??
        bookingVehicleParseApproverId(formValues['approver']);
    final timeNeedPresent = bookingVehicleParseFormDateTime(
      formValues['time_need_present'],
    );
    final isProblemArises = ValidateHelper.bookingVehicleShouldShowProblemArisesCard(
      timeNeedPresent,
      null,
    );
    final problemArises = bookingVehicleTrimFormValue(
      formValues['problem_rule_reason'],
    );

    final payloads = buildAllPassengerGoCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      passengerLineCount: n,
      existingBookingId: existingBookingId,
      approvedTBP: approvedTBP,
      isProblemArises: isProblemArises,
      problemArises: problemArises.isEmpty ? null : problemArises,
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

  /// Submit **Chủ động phương tiện** — `Category` = 4.
  Future<void> _onSubmitSelfVehicle(
    Map<String, dynamic> formValues,
    Emitter<BookingVehicleState> emit, {
    int? existingBookingId,
  }) async {
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

    final n = bookingVehicleEffectivePassengerLineCount(
      form: formValues,
      stateCount: state.passengerGoLineCount,
    );
    if (n <= 0) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message: 'Chưa có dòng người.',
        ),
      );
      return;
    }

    final bookerName =
        state.currentEmployee?.fullName?.trim() ?? '';

    _log.logI('📋 Submit selfVehicle — project display: "${formValues['project']}"');

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

    // Validate passenger rows
    for (var i = 0; i < n; i++) {
      if (bookingVehicleIsPassengerRowEmpty(formValues, i)) continue;

      final name = bookingVehicleTrimFormValue(
        formValues['passenger_full_name_$i'],
      );
      final code = bookingVehicleTrimFormValue(formValues['passenger_code_$i']);
      if (name.isEmpty && code.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            message: 'Vui lòng nhập thông tin người (dòng ${i + 1}).',
          ),
        );
        return;
      }
    }

    final approvedTBP =
        state.selectedApproverEmployeeId ??
        bookingVehicleParseApproverId(formValues['approver']);
    final timeNeedPresent = bookingVehicleParseFormDateTime(
      formValues['time_need_present'],
    );
    final isProblemArises = ValidateHelper.bookingVehicleShouldShowProblemArisesCard(
      timeNeedPresent,
      null,
    );
    final problemArises = bookingVehicleTrimFormValue(
      formValues['problem_rule_reason'],
    );

    final payloads = buildAllSelfVehicleCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      passengerLineCount: n,
      existingBookingId: existingBookingId,
      approvedTBP: approvedTBP,
      isProblemArises: isProblemArises,
      problemArises: problemArises.isEmpty ? null : problemArises,
    );

    for (final payload in payloads) {
      final res = await _bookingVehicleRepo.createBookingVehicle(
        payload: payload,
      );

      final failed = await res.fold(
        (err) async {
          _log.logE('❌ createBookingVehicle (selfVehicle) failed: $err');
          emit(
            state.copyWith(
              isSubmitting: false,
              message: err.getErrorMessage,
            ),
          );
          return true;
        },
        (created) async {
          _log.logI('✅ createBookingVehicle (selfVehicle) OK id=${created.id}');
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
    Emitter<BookingVehicleState> emit, {
    int? existingBookingId,
  }) async {
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

    final n = bookingVehicleEffectivePassengerLineCount(
      form: formValues,
      stateCount: state.passengerGoLineCount,
    );
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

    _log.logI('📋 Submit passengerGo — project display: "${formValues['project']}", projects count: ${state.projects.length}');

    final projectId = resolveBookingVehicleProjectId(
      formValues['project'],
      state.projects,
    );
    if (projectId == 0) {
      _log.logE('❌ projectId=0 — raw="${formValues['project']}", projects.isEmpty=${state.projects.isEmpty}');
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
      // Skip dòng trống sau khi shift.
      if (bookingVehicleIsPassengerRowEmpty(formValues, i)) continue;

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

    final approvedTBP =
        state.selectedApproverEmployeeId ??
        bookingVehicleParseApproverId(formValues['approver']);
    final timeNeedPresent = bookingVehicleParseFormDateTime(
      formValues['time_need_present'],
    );
    final isProblemArises = ValidateHelper.bookingVehicleShouldShowProblemArisesCard(
      timeNeedPresent,
      null,
    );
    final problemArises = bookingVehicleTrimFormValue(
      formValues['problem_rule_reason'],
    );

    final payloads = buildAllPassengerReturnCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      passengerLineCount: n,
      existingBookingId: existingBookingId,
      approvedTBP: approvedTBP,
      isProblemArises: isProblemArises,
      problemArises: problemArises.isEmpty ? null : problemArises,
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
    Emitter<BookingVehicleState> emit, {
    int? existingBookingId,
  }) async {
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

    final n = bookingVehicleEffectiveCommercialReceiverLineCount(
      form: formValues,
      stateCount: state.commercialReceiverLineCount,
    );
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
    final needGiao = bookingVehicleParseFormDateTime(
      formValues['time_need_present'],
    );
    final layHang = bookingVehicleParseFormDateTime(formValues['time_return']);
    if (needGiao != null &&
        layHang != null &&
        layHang.isAfter(needGiao)) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message:
              'Thời gian lấy hàng không được lớn hơn thời gian cần giao đến.',
        ),
      );
      return;
    }

    for (var i = 0; i < n; i++) {
      // Skip dòng trống sau khi shift.
      if (bookingVehicleIsCommercialReceiverRowEmpty(formValues, i)) continue;

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

    final approvedTBP =
        state.selectedApproverEmployeeId ??
        bookingVehicleParseApproverId(formValues['approver']);
    final timeNeedPresent = bookingVehicleParseFormDateTime(
      formValues['time_need_present'],
    );
    final isProblemArises = ValidateHelper.bookingVehicleShouldShowProblemArisesCard(
      timeNeedPresent,
      null,
    );
    final problemArises = bookingVehicleTrimFormValue(
      formValues['problem_rule_reason'],
    );

    final payloads = buildAllCommercialDeliveryCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      receiverLineCount: n,
      apiCategory: apiCategory,
      existingBookingId: existingBookingId,
      approvedTBP: approvedTBP,
      isProblemArises: isProblemArises,
      problemArises: problemArises.isEmpty ? null : problemArises,
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
    Emitter<BookingVehicleState> emit, {
    int? existingBookingId,
  }) async {
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

    final n = bookingVehicleEffectivePickupGiverLineCount(
      form: formValues,
      stateCount: state.pickupGiverLineCount,
    );
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
    final needLay = bookingVehicleParseFormDateTime(
      formValues['pickup_need_arrive_time'],
    );
    final xuatPhatLay = bookingVehicleParseFormDateTime(
      formValues['pickup_departure_time'],
    );
    if (needLay != null &&
        xuatPhatLay != null &&
        xuatPhatLay.isAfter(needLay)) {
      emit(
        state.copyWith(
          isSubmitting: false,
          message:
              'Thời gian xuất phát không được lớn hơn thời gian cần đến lấy.',
        ),
      );
      return;
    }

    for (var i = 0; i < n; i++) {
      // Skip dòng trống sau khi shift.
      if (bookingVehicleIsPickupGiverRowEmpty(formValues, i)) continue;

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

    final approvedTBP =
        state.selectedApproverEmployeeId ??
        bookingVehicleParseApproverId(formValues['approver']);
    final timeNeedPresent = bookingVehicleParseFormDateTime(
      formValues['pickup_need_arrive_time'],
    );
    final isProblemArises = ValidateHelper.bookingVehicleShouldShowProblemArisesCard(
      timeNeedPresent,
      null,
    );
    final problemArises = bookingVehicleTrimFormValue(
      formValues['problem_rule_reason'],
    );

    final payloads = buildAllCommercialPickupCreatePayloads(
      formValues: formValues,
      bookerEmployeeId: employeeId,
      bookerFullName: bookerName,
      projects: state.projects,
      employees: state.employee,
      giverLineCount: n,
      apiCategory: apiCategory,
      existingBookingId: existingBookingId,
      approvedTBP: approvedTBP,
      isProblemArises: isProblemArises,
      problemArises: problemArises.isEmpty ? null : problemArises,
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
