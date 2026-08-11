import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../../common/utils/datetime_utils.dart';
import '../../../../../../../../auth/data/datasource/models/user_model.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/work_trip_model.dart';
import '../../data/repository/work_trip_repo.dart';
import '../../data/repository/work_trip_repository.dart';
import '../widgets/work_trip_add_constants.dart';

part 'work_trip_event.dart';
part 'work_trip_state.dart';
part 'work_trip_bloc.g.dart';
part 'work_trip_bloc.freezed.dart';

(DateTime start, DateTime end) _calendarMonthBounds(DateTime anyDayInMonth) {
  final y = anyDayInMonth.year, m = anyDayInMonth.month;
  return (DateTime(y, m, 1), DateTime(y, m + 1, 0));
}

@injectable
class WorkTripBloc extends BaseBloc<WorkTripEvent, WorkTripState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final WorkTripRepo _workTripRepo;
  bool _isBusy = false;
  bool _isInitAddInFlight = false;

  WorkTripBloc(this._workTripRepo, this._authRepo, this._log)
      : super(WorkTripState.init()) {
    on<WorkTripEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: () => _onInitAdd(emit),
        submit: (data) => _onSubmit(emit, data: data),
        onCancelSubmit: (id) => _onCancelSubmit(emit, id: id),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        clearSubmitState: () async => _onClearSubmitState(emit),
        fetchDetail: (id) => _onFetchDetail(emit, id: id),
        editSubmit: (id, data) => _onEditSubmit(emit, id: id, data: data),
        fetchCopy: (id) => _onFetchCopy(emit, id: id),
        clearCopyData: () async =>
            emit(state.copyWith(copyData: null, isFetchingCopy: false)),
        loadBookingVehicleList: () => _onLoadBookingVehicleList(emit),
      );
    });
  }

  Map<String, dynamic> _listPayload({
    required int month,
    required int year,
  }) {
    final dateStart = DateTime(year, month, 1).toUtc();
    final dateEnd = DateTime.utc(year, month + 1, 0, 23, 59, 59);
    return <String, dynamic>{
      'DateStart': dateStart.toIso8601String(),
      'DateEnd': dateEnd.toIso8601String(),
      'KeyWord': '',
      'EmployeeID': 0,
      'IsApprove': -1,
      'NotCheckIn': -1,
      'Type': null,
      'VehicleID': null,
    };
  }

DateTime _normalizeToMinute(DateTime dt) =>
    DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute);


  Future<void> _onInit(Emitter<WorkTripState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (err) async {
        _log.logE('❌ WorkTripBloc _onInit get user failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final now = DateTime.now();
        final (defaultStart, defaultEnd) = _calendarMonthBounds(now);

        late final DateTime rangeStart;
        late final DateTime rangeEnd;
        if (state.dateStart != null && state.dateEnd != null) {
          final a = state.dateStart!;
          final b = state.dateEnd!;
          final lo = a.isAfter(b) ? b : a;
          (rangeStart, rangeEnd) = _calendarMonthBounds(lo);
        } else {
          rangeStart = defaultStart;
          rangeEnd = defaultEnd;
        }

        // ── Tải & cache lookup data cho màn Add ─────────────────────────────
        if (user != null) {
          await _loadAndCacheLookupData(user.employeeId);
        }

        final payload = _listPayload(
          month: rangeStart.month,
          year: rangeStart.year,
        );

        _log.logI('WorkTripBloc _onInit payload: $payload');

        final res = await _workTripRepo.getWorkTrip(payload: payload);

        await res.fold(
          (l) async {
            _log.logE('❌ WorkTripBloc _onInit API failed: $l');
            emit(state.copyWith(
              status: BaseStateStatus.failed,
              message: l.getErrorMessage,
            ));
          },
          (r) async {
            _log.logI('✅ WorkTripBloc _onInit success, total: ${r.length}');
            emit(state.copyWith(
              status: BaseStateStatus.success,
              workTrips: r,
              dateStart: rangeStart,
              dateEnd: rangeEnd,
              employeeId: user?.employeeId,
              loginName: user?.loginName,
              currentEmployee: user,
            ));
          },
        );
      },
    );
  }

  /// Tải lookup data từ API và lưu cache, đồng thời emit vào state nếu có.
  Future<void> _loadAndCacheLookupData(int employeeId) async {
    final cached = await WorkTripRepository.getInitAddCache(
      employeeId: employeeId,
      log: _log,
    );

    List<ApproverItem> approvers = [];
    List<WorkTripProject> projects = [];
    List<WorkTripTypeItem> types = [];
    List<WorkTripTypeVehicle> vehicles = [];
    FillApproverItem? fillApprover;

    if (cached != null && cached.isUsable) {
      _log.logI(
          'WorkTrip cache hit for user=$employeeId (fetchedAt=${cached.fetchedAt})');
      approvers = cached.approvers;
      projects = cached.projects;
      types = cached.types;
      vehicles = cached.vehicles;
      fillApprover = cached.fillApprover;
    } else {
      _log.logI('WorkTrip cache miss for user=$employeeId — fetching API');

      final approverRes = await _workTripRepo.getApprover();
      final typeRes = await _workTripRepo.getWorkTripType();
      final vehicleRes = await _workTripRepo.getWorkTripVehicleType();
      final projectRes = await _workTripRepo.getWorkTripProject();
      final fillApproverRes = await _workTripRepo.getFillApprover(
        employeeID: employeeId,
        tableName: 'EmployeeBussiness',
      );

      approverRes.fold(
          (l) => _log.logE('getApprover failed: $l'), (r) => approvers = r);
      typeRes.fold(
          (l) => _log.logE('getWorkTripType failed: $l'), (r) => types = r);
      vehicleRes.fold(
          (l) => _log.logE('getWorkTripVehicleType failed: $l'),
          (r) => vehicles = r);
      projectRes.fold(
          (l) => _log.logE('getWorkTripProject failed: $l'),
          (r) => projects = r);
      fillApproverRes.fold(
          (l) => _log.logE('getFillApprover failed: $l'),
          (r) => fillApprover = r);

      await WorkTripRepository.saveInitAddCache(
        employeeId: employeeId,
        approvers: approvers,
        projects: projects,
        types: types,
        vehicles: vehicles,
        fillApprover: fillApprover,
        log: _log,
      );
    }

    // Emit lookup data vào state nếu chưa có hoặc cache miss (force update)
    if (approvers.isNotEmpty || types.isNotEmpty || vehicles.isNotEmpty) {
      emit(state.copyWith(
        approvers: approvers,
        workTripProjects: projects,
        workTripTypes: types,
        workTripVehicles: vehicles,
        approveId: fillApprover,
      ));
    }
  }

  Future<void> _onInitAdd(Emitter<WorkTripState> emit) async {
    if (_isInitAddInFlight) {
      _log.logI('ℹ️ WorkTripBloc initAdd skipped: request in-flight');
      return;
    }
    _isInitAddInFlight = true;
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.fold((_) => null, (u) => u);
      if (user == null) {
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: 'Không lấy được thông tin người dùng',
        ));
        return;
      }

      // Ưu tiên đọc từ cache, fallback sang API nếu không có.
      var approvers = state.approvers;
      var types = state.workTripTypes;
      var vehicles = state.workTripVehicles;
      var projects = state.workTripProjects;
      FillApproverItem? fillApprover = state.approveId;
      List<int> saleDepartmentIds = state.saleDepartmentIds;

      if (approvers.isEmpty || types.isEmpty || vehicles.isEmpty) {
        _log.logI('WorkTripBloc initAdd: reading from cache first');
        final cached = await WorkTripRepository.getInitAddCache(
          employeeId: user.employeeId,
          log: _log,
        );

        if (cached != null && cached.isUsable) {
          _log.logI('WorkTripBloc initAdd: cache hit');
          approvers = cached.approvers;
          types = cached.types;
          vehicles = cached.vehicles;
          projects = cached.projects;
          fillApprover = cached.fillApprover;
        } else {
          _log.logI('WorkTripBloc initAdd: cache miss — calling API');

          final approverRes = await _workTripRepo.getApprover();
          final typeRes = await _workTripRepo.getWorkTripType();
          final vehicleRes = await _workTripRepo.getWorkTripVehicleType();
          final projectRes = await _workTripRepo.getWorkTripProject();
          final fillApproverRes = await _workTripRepo.getFillApprover(
            employeeID: user.employeeId,
            tableName: 'EmployeeBussiness',
          );

          approverRes.fold((l) => _log.logE('getApprover failed: $l'),
              (r) => approvers = r);
          typeRes.fold((l) => _log.logE('getWorkTripType failed: $l'),
              (r) => types = r);
          vehicleRes.fold((l) => _log.logE('getVehicle failed: $l'),
              (r) => vehicles = r);
          projectRes.fold((l) => _log.logE('getProject failed: $l'),
              (r) => projects = r);
          fillApproverRes.fold((l) => _log.logE('getFillApprover failed: $l'),
              (r) => fillApprover = r);

          await WorkTripRepository.saveInitAddCache(
            employeeId: user.employeeId,
            approvers: approvers,
            projects: projects,
            types: types,
            vehicles: vehicles,
            fillApprover: fillApprover,
            log: _log,
          );
        }
      }

      // Luôn tải danh sách department IDs từ API
      if (saleDepartmentIds.isEmpty) {
        final deptRes = await _workTripRepo.getDepartmentIds(configType: 1);
        deptRes.fold(
          (l) => _log.logE('getDepartmentIds failed: $l'),
          (r) => saleDepartmentIds = r,
        );
      }

      _log.logI('✅ WorkTripBloc initAdd success');
      emit(state.copyWith(
        status: BaseStateStatus.success,
        approvers: approvers,
        workTripTypes: types,
        workTripVehicles: vehicles,
        workTripProjects: projects,
        employeeId: user.employeeId,
        loginName: user.loginName,
        approveId: fillApprover,
        currentEmployee: user,
        saleDepartmentIds: saleDepartmentIds,
      ));
    } finally {
      _isInitAddInFlight = false;
    }
  }

  Future<void> _onChangeDateRange(
    Emitter<WorkTripState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final lo = dateStart.isAfter(dateEnd) ? dateEnd : dateStart;
    final (rangeStart, rangeEnd) = _calendarMonthBounds(lo);

    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: rangeStart,
      dateEnd: rangeEnd,
    ));

    final userRes = await _authRepo.getCurrentUser();
    await userRes.fold(
      (err) async {
        _log.logE('❌ WorkTripBloc changeDateRange failed: $err');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        final payload = _listPayload(
          month: rangeStart.month,
          year: rangeStart.year,
        );
        final res = await _workTripRepo.getWorkTrip(payload: payload);
        await res.fold(
          (l) async => emit(state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          )),
          (r) async => emit(state.copyWith(
            status: BaseStateStatus.success,
            workTrips: r,
            dateStart: rangeStart,
            dateEnd: rangeEnd,
          )),
        );
      },
    );
  }

  Future<void> _onSubmit(
    Emitter<WorkTripState> emit, {
    required WorkTripSubmitData data,
  }) async {
    if (_isBusy) return;
    _isBusy = true;

    try {
      emit(state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        message: null,
      ));

      int? employeeId = state.employeeId;
      if (employeeId == null || employeeId <= 0) {
        final userRes = await _authRepo.getCurrentUser();
        employeeId = userRes.fold((_) => null, (u) => u?.employeeId);
      }
      if (employeeId == null || employeeId <= 0) {
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Không lấy được ID nhân viên, vui lòng thử lại',
        ));
        return;
      }

      final costWorkEarly = data.workEarly ? 50000.0 : 0.0;
      final costOvernight = data.overnightType > 0 ? 35000.0 : 0.0;
      final overnight = data.overnightType > 0;
      final costVehicle = data.selfVehicle ? 0.0 : data.costVehicle;
      final totalMoney =
          data.costBussiness + costVehicle + costWorkEarly + costOvernight;

      final dayStr =
          toVnIso8601(_normalizeToMinute(data.dayBussiness));

      // VehicleID = 0 khi gửi qua employeeBussinessVehicle (xe máy / khác),
      // ngược lại dùng ID thực của phương tiện đã chọn.
      final vehicleIdForMain = data.needsVehicleRecord
          ? 0
          : (data.vehicles.isNotEmpty ? data.vehicles.first.vehicleTypeId : 0);

      // Case A: Chủ động PT (selfVehicle = true)
      // Case B: Dùng Ô tô công ty (selfVehicle = false)
      final isSelfTransport = data.selfVehicle;
      final isApprovedBgd = isSelfTransport ? false : null;
      final vehicleBookingId = isSelfTransport ? data.bookingVehicleId : null;

      final bussinessObject = <String, dynamic>{
        'ID': 0,
        'EmployeeID': employeeId,
        'ApprovedID': data.approvedId,
        'DayBussiness': dayStr,
        'TypeBusiness': data.typeBusiness,
        'Location': data.location.isEmpty ? ' ' : data.location,
        'VehicleID': vehicleIdForMain,
        'ProjectID': data.projectId ?? 0,
        'CostVehicle': costVehicle,
        'CostBussiness': data.costBussiness,
        'TotalMoney': totalMoney,
        'NotChekIn': data.notCheckIn,
        'Note': data.note.isEmpty ? ' ' : data.note,
        'Overnight': overnight,
        'CostOvernight': costOvernight,
        'WorkEarly': data.workEarly,
        'CostWorkEarly': costWorkEarly,
        'OvernightType': data.overnightType,
        'IsProblem': data.isProblem,
        'Reason': data.reason.isEmpty ? ' ' : data.reason,
        'VehicleBookingID': vehicleBookingId,
        'CustomerName': data.customerName ?? '',
        'CompanyName': data.companyName ?? '',
        'IsApprovedBGD': isApprovedBgd,
        'IsSelfTransport': isSelfTransport,
      };

      final payload = <String, dynamic>{
        'employeeBussiness': bussinessObject,
        'employeeBussinessFiles':
            data.fileInfo != null
                ? <String, dynamic>{
                    'ID': 0,
                    'EmployeeBussinesID': 0,
                    'FileName': data.fileInfo?['fileName'],
                    'OriginPath': data.fileInfo?['originPath'],
                    'ServerPath': null,
                  }
                : null,
      };

      // Case A (selfVehicle=true): KHÔNG gửi employeeBussinessVehicle
      // Case B (selfVehicle=false): Gửi "Ô tô công ty" mặc định khi không có xe máy/khác
      if (!isSelfTransport && !data.needsVehicleRecord) {
        payload['employeeBussinessVehicle'] = <String, dynamic>{
          'ID': 0,
          'EmployeeBussinesID': 0,
          'EmployeeVehicleBussinessID': 2, // Ô tô công ty
          'Cost': 0,
          'BillImage': '',
          'Note': '',
          'VehicleName': 'Ô tô công ty',
        };
      }

      // Gửi employeeBussinessVehicle khi chọn Xe máy hoặc Phương tiện khác.
      // Phương tiện khác → EmployeeVehicleBussinessID = 0, VehicleName = tên tuỳ chỉnh.
      if (data.needsVehicleRecord) {
        final v = data.vehicleRecord!;
        // id < 0 là entry tổng hợp "Phương tiện khác" → gửi 0
        final vehicleRecordTypeId = v.vehicleTypeId < 0 ? 0 : v.vehicleTypeId;
        payload['employeeBussinessVehicle'] = <String, dynamic>{
          'ID': 0,
          'EmployeeBussinesID': 0,
          'EmployeeVehicleBussinessID': vehicleRecordTypeId,
          'Cost': v.cost,
          'BillImage': '',
          'Note': v.note,
          'VehicleName': v.displayName,
        };
      }

      _log.logI('WorkTripBloc submit payload: $payload');

      final saveRes = await _workTripRepo.saveWorkTrip(payload: payload);
      saveRes.fold(
        (err) {
          _log.logE('❌ WorkTripBloc submit failed: $err');
          emit(state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ));
        },
        (_) {
          _log.logI('✅ WorkTripBloc submit success');
          emit(state.copyWith(
            isSubmitting: false,
            submitSuccess: true,
            status: BaseStateStatus.success,
            message: 'Tạo đơn công tác thành công',
          ));
        },
      );
    } catch (e) {
      _log.logE('❌ WorkTripBloc submit exception: $e');
      emit(state.copyWith(
        isSubmitting: false,
        submitSuccess: false,
        status: BaseStateStatus.failed,
        message: 'Có lỗi xảy ra khi gửi dữ liệu',
      ));
    } finally {
      _isBusy = false;
    }
  }

  Future<void> _onCancelSubmit(
    Emitter<WorkTripState> emit, {
    required int id,
  }) async {
    if (_isBusy) return;
    _isBusy = true;

    try {
      emit(state.copyWith(
        isDeleting: true,
        deleteSuccess: false,
        status: BaseStateStatus.loading,
        message: null,
      ));

      final payload = <String, dynamic>{
        'employeeBussiness': <String, dynamic>{
          'ID': id,
          'IsDeleted': true,
        },
        'employeeBussinessFiles': null,
      };

      _log.logI('WorkTripBloc cancelSubmit ID=$id');

      final saveRes = await _workTripRepo.saveWorkTrip(payload: payload);
      await saveRes.fold(
        (err) async {
          _log.logE('❌ WorkTripBloc cancelSubmit failed: $err');
          emit(state.copyWith(
            isDeleting: false,
            deleteSuccess: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ));
        },
        (_) async {
          _log.logI('✅ WorkTripBloc cancelSubmit success ID=$id');
          final updated = state.workTrips.where((e) => e.id != id).toList();
          emit(state.copyWith(
            isDeleting: false,
            deleteSuccess: true,
            status: BaseStateStatus.success,
            workTrips: updated,
            message: null,
          ));
        },
      );
    } catch (e) {
      _log.logE('❌ WorkTripBloc cancelSubmit exception: $e');
      emit(state.copyWith(
        isDeleting: false,
        deleteSuccess: false,
        status: BaseStateStatus.failed,
        message: 'Có lỗi xảy ra khi gửi dữ liệu',
      ));
    } finally {
      _isBusy = false;
    }
  }

  void _onClearSubmitState(Emitter<WorkTripState> emit) {
    emit(state.copyWith(
      submitSuccess: false,
      editSuccess: false,
      message: null,
    ));
  }

  Future<void> _onEditSubmit(
    Emitter<WorkTripState> emit, {
    required int id,
    required WorkTripSubmitData data,
  }) async {
    if (_isBusy) return;
    _isBusy = true;

    try {
      emit(state.copyWith(
        isEditing: true,
        editSuccess: false,
        message: null,
      ));

      int? employeeId = state.employeeId;
      if (employeeId == null || employeeId <= 0) {
        final userRes = await _authRepo.getCurrentUser();
        employeeId = userRes.fold((_) => null, (u) => u?.employeeId);
      }
      if (employeeId == null || employeeId <= 0) {
        emit(state.copyWith(
          isEditing: false,
          editSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Không lấy được ID nhân viên, vui lòng thử lại',
        ));
        return;
      }

      final costWorkEarly = data.workEarly ? 50000.0 : 0.0;
      final costOvernight = data.overnightType > 0 ? 35000.0 : 0.0;
      final overnight = data.overnightType > 0;
      final costVehicle = data.selfVehicle ? 0.0 : data.costVehicle;
      final totalMoney =
          data.costBussiness + costVehicle + costWorkEarly + costOvernight;

      final dayStr = toVnIso8601(_normalizeToMinute(data.dayBussiness));

      // Case A: Chủ động PT (selfVehicle = true)
      // Case B: Dùng Ô tô công ty (selfVehicle = false)
      final isSelfTransport = data.selfVehicle;
      final isApprovedBgd = isSelfTransport ? false : null;
      final vehicleBookingId = isSelfTransport ? data.bookingVehicleId : null;

      final bussinessObject = <String, dynamic>{
        'ID': id,
        'EmployeeID': employeeId,
        'ApprovedID': data.approvedId,
        'DayBussiness': dayStr,
        'TypeBusiness': data.typeBusiness,
        'Location': data.location.isEmpty ? ' ' : data.location,
        'VehicleID': 0,
        'ProjectID': data.projectId ?? 0,
        'CostVehicle': costVehicle,
        'CostBussiness': data.costBussiness,
        'TotalMoney': totalMoney,
        'NotChekIn': data.notCheckIn,
        'Note': data.note.isEmpty ? ' ' : data.note,
        'Overnight': overnight,
        'CostOvernight': costOvernight,
        'WorkEarly': data.workEarly,
        'CostWorkEarly': costWorkEarly,
        'OvernightType': data.overnightType,
        'IsProblem': data.isProblem,
        'Reason': data.reason.isEmpty ? ' ' : data.reason,
        'VehicleBookingID': vehicleBookingId,
        'CustomerName': data.customerName ?? '',
        'CompanyName': data.companyName ?? '',
        'IsApprovedBGD': isApprovedBgd,
        'IsSelfTransport': isSelfTransport,
      };

      final payload = <String, dynamic>{
        'employeeBussiness': bussinessObject,
        'employeeBussinessFiles':
            data.fileInfo != null
                ? <String, dynamic>{
                    'ID': 0,
                    'EmployeeBussinesID': id,
                    'FileName': data.fileInfo?['fileName'],
                    'OriginPath': data.fileInfo?['originPath'],
                    'ServerPath': null,
                  }
                : null,
      };

      // Case A (selfVehicle=true): KHÔNG gửi employeeBussinessVehicle
      // Case B (selfVehicle=false): Gửi "Ô tô công ty" mặc định khi không có xe máy/khác
      if (!isSelfTransport && !data.needsVehicleRecord) {
        payload['employeeBussinessVehicle'] = <String, dynamic>{
          'ID': 0,
          'EmployeeBussinesID': id,
          'EmployeeVehicleBussinessID': 2, // Ô tô công ty
          'Cost': 0,
          'BillImage': '',
          'Note': '',
          'VehicleName': 'Ô tô công ty',
        };
      }

      if (data.needsVehicleRecord) {
        final v = data.vehicleRecord!;
        final vehicleRecordTypeId = v.vehicleTypeId < 0 ? 0 : v.vehicleTypeId;
        payload['employeeBussinessVehicle'] = <String, dynamic>{
          'ID': 0,
          'EmployeeBussinesID': id,
          'EmployeeVehicleBussinessID': vehicleRecordTypeId,
          'Cost': v.cost,
          'BillImage': '',
          'Note': v.note,
          'VehicleName': v.displayName,
        };
      }

      _log.logI('WorkTripBloc editSubmit payload: $payload');

      final saveRes = await _workTripRepo.saveWorkTrip(payload: payload);
      saveRes.fold(
        (err) {
          _log.logE('❌ WorkTripBloc editSubmit failed: $err');
          emit(state.copyWith(
            isEditing: false,
            editSuccess: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ));
        },
        (_) {
          _log.logI('✅ WorkTripBloc editSubmit success');
          emit(state.copyWith(
            isEditing: false,
            editSuccess: true,
            status: BaseStateStatus.success,
            message: 'Cập nhật đơn công tác thành công',
          ));
        },
      );
    } catch (e) {
      _log.logE('❌ WorkTripBloc editSubmit exception: $e');
      emit(state.copyWith(
        isEditing: false,
        editSuccess: false,
        status: BaseStateStatus.failed,
        message: 'Có lỗi xảy ra khi cập nhật',
      ));
    } finally {
      _isBusy = false;
    }
  }

  Future<void> _onFetchCopy(
    Emitter<WorkTripState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(isFetchingCopy: true, copyData: null));
    try {
      final res = await _workTripRepo.getWorkTripById(id);
      res.fold(
        (err) {
          _log.logE('❌ WorkTripBloc fetchCopy failed: $err');
          emit(state.copyWith(
            isFetchingCopy: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ));
        },
        (item) {
          _log.logI('✅ WorkTripBloc fetchCopy success: ${item.id}');
          emit(state.copyWith(isFetchingCopy: false, copyData: item));
        },
      );
    } catch (e) {
      _log.logE('❌ WorkTripBloc fetchCopy exception: $e');
      emit(state.copyWith(
        isFetchingCopy: false,
        status: BaseStateStatus.failed,
        message: 'Không tải được dữ liệu để sao chép',
      ));
    }
  }

  Future<void> _onFetchDetail(
    Emitter<WorkTripState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(
      isFetchingDetail: true,
      detailItem: null,
      message: null,
    ));
    try {
      final res = await _workTripRepo.getWorkTripById(id);
      res.fold(
        (err) {
          _log.logE('❌ WorkTripBloc fetchDetail failed: $err');
          emit(state.copyWith(
            isFetchingDetail: false,
            message: err.getErrorMessage,
            status: BaseStateStatus.failed,
          ));
        },
        (item) {
          _log.logI('✅ WorkTripBloc fetchDetail success: ${item.id}');
          emit(state.copyWith(isFetchingDetail: false, detailItem: item));
        },
      );
    } catch (e) {
      _log.logE('❌ WorkTripBloc fetchDetail exception: $e');
      emit(state.copyWith(
        isFetchingDetail: false,
        status: BaseStateStatus.failed,
        message: 'Không tải được chi tiết đơn',
      ));
    }
  }

  Future<void> _onLoadBookingVehicleList(Emitter<WorkTripState> emit) async {
    try {
      // Lấy employeeId từ currentEmployee (đã được set trong _onInit / _onInitAdd);
      // fallback gọi lại AuthRepo nếu currentEmployee chưa sẵn sàng.
      var employeeId = state.currentEmployee?.employeeId;
      if (employeeId == null) {
        final userRes = await _authRepo.getCurrentUser();
        final user = userRes.fold((_) => null, (u) => u);
        employeeId = user?.employeeId;
      }
      if (employeeId == null) {
        _log.logE('❌ WorkTripBloc loadBookingVehicleList: no employeeId');
        return;
      }

      final now = DateTime.now();
      final dayStart = DateTime(now.year, now.month, now.day);
      final dayEnd = DateTime(now.year, now.month, now.day, 23, 59, 59);

      final res = await _workTripRepo.getVehicleBookingsForBussiness(
        employeeId: employeeId,
        dateStart: dayStart,
        dateEnd: dayEnd,
      );
      res.fold(
        (l) {
          _log.logE('❌ WorkTripBloc loadBookingVehicleList failed: $l');
        },
        (list) {
          _log.logI('✅ WorkTripBloc loadBookingVehicleList success: ${list.length} items');
          emit(state.copyWith(selfVehicleList: list));
        },
      );
    } catch (e) {
      _log.logE('❌ WorkTripBloc loadBookingVehicleList exception: $e');
    }
  }
}
