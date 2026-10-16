// Date: 16/10/2026
// Nội dung/Chức năng: BLoC quản lý danh sách yêu cầu thuê xe tải.

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/auth/data/repository/auth_repo.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/rental_vehicle/data/datasource/models/rental_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/rental_vehicle/data/repository/rental_vehicle_repo.dart';

part 'rental_vehicle_event.dart';
part 'rental_vehicle_state.dart';
part 'rental_vehicle_bloc.g.dart';
part 'rental_vehicle_bloc.freezed.dart';

@injectable
class RentalVehicleBloc
    extends BaseBloc<RentalVehicleEvent, RentalVehicleState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final RentalVehicleRepo _rentalVehicleRepo;

  RentalVehicleBloc(this._rentalVehicleRepo, this._authRepo, this._log)
      : super(RentalVehicleState.init()) {
    on<RentalVehicleEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        search: (keyword) => _onSearch(keyword, emit),
        loadAll: () => _onLoadAll(emit),
        loadEmployees: (status, departmentId, keyword) =>
            _onLoadEmployees(status, departmentId, keyword, emit),
        loadDepartments: () => _onLoadDepartments(emit),
        selectDepartment: (departmentId) =>
            _onSelectDepartment(departmentId, emit),
        selectRequester: (employeeId) =>
            _onSelectRequester(employeeId, emit),
        selectBooker: (employeeId) => _onSelectBooker(employeeId, emit),
        initAdd: () => _onInitAdd(emit),
        selectRequesterOnAdd: (employeeId) =>
            _onSelectRequesterOnAdd(employeeId, emit),
        submitAdd: (formValues) => _onSubmitAdd(formValues, emit),
        clearSubmitResult: () => _onClearSubmitResult(emit),
        delete: (id) => _onDelete(id, emit),
      );
    });
  }

  /// Tính khoảng tháng hiện tại (00:00 ngày 1 → 23:59:59 ngày cuối tháng).
  (DateTime, DateTime) _monthBounds(DateTime now) {
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
    return (start, end);
  }

  Future<void> _onInit(Emitter<RentalVehicleState> emit) async {
    final now = DateTime.now();
    final (start, end) = _monthBounds(now);

    await _doSearch(
      emit,
      extraState: {
        'dateStart': start,
        'dateEnd': end,
      },
      // init không cần truyền current user vào employeeId/departmentId
      useCurrentUserFilter: false,
    );
  }

  Future<void> _onChangeDateRange(
    DateTime dateStart,
    DateTime dateEnd,
    Emitter<RentalVehicleState> emit,
  ) async {
    await _doSearch(
      emit,
      extraState: {
        'dateStart': dateStart,
        'dateEnd': dateEnd,
      },
    );
  }

  Future<void> _onSearch(
    String keyword,
    Emitter<RentalVehicleState> emit,
  ) async {
    await _doSearch(
      emit,
      extraState: {
        'keyword': keyword,
      },
    );
  }

  Future<void> _onSelectDepartment(
    int departmentId,
    Emitter<RentalVehicleState> emit,
  ) async {
    await _doSearch(
      emit,
      extraState: {
        'selectedDepartmentId': departmentId,
      },
    );
  }

  Future<void> _onSelectRequester(
    int employeeId,
    Emitter<RentalVehicleState> emit,
  ) async {
    await _doSearch(
      emit,
      extraState: {
        'selectedRequesterId': employeeId,
      },
    );
  }

  Future<void> _onSelectBooker(
    int employeeId,
    Emitter<RentalVehicleState> emit,
  ) async {
    await _doSearch(
      emit,
      extraState: {
        'selectedBookerId': employeeId,
      },
    );
  }

  /// Hàm gọi API search dùng chung cho init / changeDateRange / search /
  /// selectDepartment / selectRequester / selectBooker.
  Future<void> _doSearch(
    Emitter<RentalVehicleState> emit, {
    required Map<String, dynamic> extraState,
    bool useCurrentUserFilter = true,
  }) async {
    // 1) Emit trạng thái loading + cập nhật state từ extraState.
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        keyword: extraState['keyword'] as String? ?? state.keyword,
        dateStart: extraState['dateStart'] as DateTime? ?? state.dateStart,
        dateEnd: extraState['dateEnd'] as DateTime? ?? state.dateEnd,
        selectedDepartmentId:
            extraState['selectedDepartmentId'] as int? ??
                state.selectedDepartmentId,
        selectedRequesterId:
            extraState['selectedRequesterId'] as int? ??
                state.selectedRequesterId,
        selectedBookerId:
            extraState['selectedBookerId'] as int? ?? state.selectedBookerId,
      ),
    );

    // 2) Lấy current user nếu cần dùng làm filter mặc định.
    int employeeId = 0;
    int departmentId = 0;
    if (useCurrentUserFilter) {
      final userRes = await _authRepo.getCurrentUser();
      await userRes.fold(
        (err) async {
          _log.logE('❌ Get current user failed: $err');
        },
        (user) async {
          employeeId = user?.employeeId ?? 0;
          departmentId = user?.departmentId ?? 0;
        },
      );
    }

    // 3) Build payload với filter hiện tại (filter người dùng chọn
    //    sẽ đè lên current user filter).
    final start = state.dateStart ?? DateTime.now();
    final end = state.dateEnd ?? DateTime.now();
    final payload = _buildPayload(
      keyword: state.keyword,
      dateStart: start,
      dateEnd: end,
      employeeRequestId: state.selectedRequesterId == 0
          ? employeeId
          : state.selectedRequesterId,
      employeeId: state.selectedBookerId == 0
          ? employeeId
          : state.selectedBookerId,
      departmentId: state.selectedDepartmentId == 0
          ? departmentId
          : state.selectedDepartmentId,
    );

    _log.logI('📋 rental vehicle search payload: $payload');

    final res = await _rentalVehicleRepo.searchRentalVehicle(payload: payload);

    await res.fold(
      (l) async {
        _log.logE('❌ searchRentalVehicle failed: $l');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) async {
        _log.logI('✅ searchRentalVehicle success: ${r.length} items');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            rentalVehicles: r,
          ),
        );
      },
    );
  }

  /// Build payload đúng schema API /VehicleRentalRequest/search.
  Map<String, dynamic> _buildPayload({
    required String keyword,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int employeeRequestId,
    required int employeeId,
    required int departmentId,
  }) {
    return {
      'Keyword': keyword,
      'StartDate': dateStart.toIso8601String(),
      'EndDate': dateEnd.toIso8601String(),
      'EmployeeRequestID': employeeRequestId,
      'EmployeeID': employeeId,
      'DepartmentID': departmentId,
    };
  }

  /// Tải đồng thời Employee + Department + Project
  /// (gọi khi mở filter sheet hoặc cần data cho add screen).
  Future<void> _onLoadAll(Emitter<RentalVehicleState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    await Future.wait<void>([
      _fetchEmployees(
        emit: emit,
        status: 0,
        departmentId: 0,
        keyword: '',
        isPartOfLoadAll: true,
      ),
      _fetchDepartments(emit: emit, isPartOfLoadAll: true),
      _fetchProjects(emit: emit),
    ]);

    final hasAny = state.employees.isNotEmpty ||
        state.departments.isNotEmpty ||
        state.projects.isNotEmpty;
    emit(
      state.copyWith(
        status: hasAny ? BaseStateStatus.success : BaseStateStatus.failed,
      ),
    );
  }

  Future<void> _onLoadEmployees(
    int status,
    int departmentId,
    String keyword,
    Emitter<RentalVehicleState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await _fetchEmployees(
      emit: emit,
      status: status,
      departmentId: departmentId,
      keyword: keyword,
    );
    emit(state.copyWith(status: BaseStateStatus.success));
  }

  Future<void> _onLoadDepartments(
    Emitter<RentalVehicleState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await _fetchDepartments(emit: emit);
    emit(state.copyWith(status: BaseStateStatus.success));
  }

  Future<void> _fetchEmployees({
    required Emitter<RentalVehicleState> emit,
    required int status,
    required int departmentId,
    required String keyword,
    bool isPartOfLoadAll = false,
  }) async {
    final res = await _rentalVehicleRepo.getEmployees(
      status: status,
      departmentId: departmentId,
      keyword: keyword,
    );
    await res.fold(
      (err) async {
        _log.logE('❌ getEmployees failed: $err');
        if (!isPartOfLoadAll) {
          emit(state.copyWith(status: BaseStateStatus.failed));
        }
      },
      (r) async {
        _log.logI('✅ getEmployees success: ${r.length} items');
        emit(state.copyWith(employees: r));
      },
    );
  }

  Future<void> _fetchDepartments({
    required Emitter<RentalVehicleState> emit,
    bool isPartOfLoadAll = false,
  }) async {
    final res = await _rentalVehicleRepo.getDepartments();
    await res.fold(
      (err) async {
        _log.logE('❌ getDepartments failed: $err');
        if (!isPartOfLoadAll) {
          emit(state.copyWith(status: BaseStateStatus.failed));
        }
      },
      (r) async {
        _log.logI('✅ getDepartments success: ${r.length} items');
        emit(state.copyWith(departments: r));
      },
    );
  }

  // ===== Add screen handlers =====

  /// Init add screen: tính next STT từ state.rentalVehicles (load ở màn list).
  /// Không gọi lại API — dùng data đã có trong state.
  Future<void> _onInitAdd(Emitter<RentalVehicleState> emit) async {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
    ));

    // Tính STT kế tiếp từ state.rentalVehicles (đã load ở màn list).
    int nextStt = 1;
    for (final item in state.rentalVehicles) {
      final stt = item.stt ?? 0;
      if (stt >= nextStt) nextStt = stt + 1;
    }

    emit(state.copyWith(nextStt: nextStt));
  }

  Future<void> _fetchProjects({
    required Emitter<RentalVehicleState> emit,
  }) async {
    final res = await _rentalVehicleRepo.getProjects();
    await res.fold(
      (err) async => _log.logE('❌ getProjects failed: $err'),
      (r) async {
        _log.logI('✅ getProjects success: ${r.length} items');
        emit(state.copyWith(projects: r));
      },
    );
  }

  Future<void> _onSelectRequesterOnAdd(
    int employeeId,
    Emitter<RentalVehicleState> emit,
  ) async {
    emit(state.copyWith(
      selectedRequesterIdOnAdd: employeeId,
    ));
  }

  Future<void> _onSubmitAdd(
    Map<String, dynamic> formValues,
    Emitter<RentalVehicleState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, submitSuccess: false));

    // Build payload.
    final dateRequest = formValues['dateRequest'] as DateTime?;
    final employeeId = formValues['employeeRequestId'] as int?;
    final departmentId = formValues['departmentId'] as int?;
    final vehicleType = formValues['vehicleType'] as int?;
    final stt = formValues['stt'] as int?;
    final packageName = formValues['packageName'] as String? ?? '';
    final projectId = formValues['projectId'] as int?;
    final packageQty = formValues['packageQuantity'] as int?;
    final lengthCm = formValues['packageLengthCm'] as num?;
    final widthCm = formValues['packageWidthCm'] as num?;
    final heightCm = formValues['packageHeightCm'] as num?;
    final weightKg = formValues['packageWeightKg'] as num?;
    final departure = formValues['departureLocation'] as String? ?? '';
    final arrival = formValues['addressLocation'] as String? ?? '';
    final distanceKm = formValues['distanceKm'] as num?;
    final note = formValues['note'] as String? ?? '';

    final payload = [
      {
        'ID': 0,
        'DateRequest': (dateRequest ?? DateTime.now()).toUtc().toIso8601String(),
        'STT': stt ?? state.nextStt,
        'EmployeeRequestID': employeeId ?? 0,
        'DepartmentID': departmentId ?? 0,
        'VehicleType': vehicleType ?? 0,
        'PackageName': packageName,
        'ProjectID': projectId ?? 0,
        'PackageQuantity': packageQty ?? 0,
        'PackageLengthCm': lengthCm ?? 0,
        'PackageWidthCm': widthCm ?? 0,
        'PackageHeightCm': heightCm ?? 0,
        'PackageWeightKg': weightKg ?? 0,
        'DepartureLocation': departure,
        'AddressLocation': arrival,
        'DistanceKm': distanceKm ?? 0,
        'NameNCC': '',
        'Cost': null,
        'Note': note,
      },
    ];

    _log.logI('📋 submitAdd payload: $payload');

    final res = await _rentalVehicleRepo.saveData(payload: payload);

    await res.fold(
      (err) async {
        _log.logE('❌ submitAdd failed: $err');
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          message: 'Lưu thất bại',
        ));
      },
      (_) async {
        _log.logI('✅ submitAdd success');
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
        ));
      },
    );
  }

  Future<void> _onClearSubmitResult(
    Emitter<RentalVehicleState> emit,
  ) async {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
    ));
  }

  /// Xoá 1 yêu cầu thuê xe tải theo id. Sau khi xoá thành công,
  /// remove khỏi `state.rentalVehicles` để UI cập nhật ngay.
  Future<void> _onDelete(
    int id,
    Emitter<RentalVehicleState> emit,
  ) async {
    emit(state.copyWith(
      deletingId: id,
      deleteSuccess: false,
      message: null,
    ));

    final res = await _rentalVehicleRepo.deleteData(ids: [id]);

    await res.fold(
      (err) async {
        _log.logE('❌ deleteData failed: $err');
        emit(state.copyWith(
          deletingId: null,
          deleteSuccess: false,
          message: 'Xoá thất bại',
        ));
      },
      (_) async {
        _log.logI('✅ deleteData success: id=$id');
        final updated = state.rentalVehicles
            .where((item) => item.id != id)
            .toList();
        emit(state.copyWith(
          deletingId: null,
          deleteSuccess: true,
          rentalVehicles: updated,
        ));
      },
    );
  }
}
