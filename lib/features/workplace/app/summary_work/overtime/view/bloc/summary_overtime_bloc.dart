import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/summary_overtime_model.dart';
import '../../data/repository/summary_overtime_repo.dart';

part 'summary_overtime_event.dart';
part 'summary_overtime_state.dart';
part 'summary_overtime_bloc.g.dart';
part 'summary_overtime_bloc.freezed.dart';

/// Bloc xử lý logic nghiệp vụ cho màn tổng hợp phiếu làm thêm.
/// Bao gồm 2 tab: danh sách phiếu và xếp hạng giờ OT theo nhân viên.
@injectable
class SummaryOvertimeBloc
    extends BaseBloc<SummaryOvertimeEvent, SummaryOvertimeState> {
  final SummaryOvertimeRepo _repo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  SummaryOvertimeBloc(
    this._repo,
    this._authRepo,
    this._log,
  ) : super(SummaryOvertimeState.init()) {
    on<SummaryOvertimeEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        changeEmployeeKeyword: (keyword) =>
            _onChangeEmployeeKeyword(emit, keyword: keyword),
        loadEmployees: (keyword) => _onLoadEmployees(emit, keyword: keyword),
        selectEmployee: (employeeId, employeeName) async =>
            _onSelectEmployee(emit, employeeId, employeeName),
        changeFilters: (departmentId, idApprovedTp) => _onChangeFilters(
          emit,
          departmentId: departmentId,
          idApprovedTp: idApprovedTp,
        ),
        refresh: () => _onInit(emit),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
      );
    });  }

  /// Khởi tạo: lấy phòng ban mặc định của user, danh sách phòng ban
  /// và tải dữ liệu trong tháng hiện tại.
  Future<void> _onInit(Emitter<SummaryOvertimeState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

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

    final deptRes = await _repo.getDepartments();
    List<SummaryOvertimeDepartment> departments = [];
    deptRes.fold(
      (l) => _log.logE('Get departments failed: $l'),
      (r) => departments = r,
    );

    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0);

    await _loadOvertime(
      emit,
      start: start,
      end: end,
      departments: departments,
      departmentId: defaultDepartmentId,
    );
  }

  Future<void> _onChangeDateRange(
    Emitter<SummaryOvertimeState> emit, {
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

    await _loadOvertime(
      emit,
      start: start,
      end: end,
      departments: state.departments,
    );
  }

  Future<void> _onChangeEmployeeKeyword(
    Emitter<SummaryOvertimeState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(employeeKeyword: keyword));
    await _onLoadEmployees(emit, keyword: keyword);
  }

  Future<void> _onLoadEmployees(
    Emitter<SummaryOvertimeState> emit, {
    String keyword = '',
  }) async {
    final res = await _repo.getEmployees(keyword: keyword);
    res.fold(
      (l) => _log.logE('Load employees failed: $l'),
      (r) => emit(state.copyWith(employees: r)),
    );
  }

  void _onSelectEmployee(
    Emitter<SummaryOvertimeState> emit,
    int? employeeId,
    String? employeeName,
  ) {
    emit(state.copyWith(
      selectedEmployeeId: employeeId,
      selectedEmployeeName: employeeName,
    ));
  }

  _onChangeFilters(
    Emitter<SummaryOvertimeState> emit, {
    int? departmentId,
    int? idApprovedTp,
  }) async {
    emit(state.copyWith(
      departmentId: departmentId,
      filterApprovedTp: idApprovedTp,
    ));
    if (state.dateStart == null || state.dateEnd == null) return;
    await _loadOvertime(
      emit,
      start: state.dateStart!,
      end: state.dateEnd!,
      departments: state.departments,
    );
  }

  /// Cập nhật từ khoá tìm kiếm phiếu OT (không reload API,
  /// filter keyword được apply trên client-side trong displayItems).
  _onChangeKeyword(
    Emitter<SummaryOvertimeState> emit, {
    required String keyword,
  }) {
    emit(state.copyWith(keyword: keyword));
  }

  /// Gọi API lấy danh sách phiếu + xếp hạng.
  Future<void> _loadOvertime(
    Emitter<SummaryOvertimeState> emit, {
    required DateTime start,
    required DateTime end,
    required List<SummaryOvertimeDepartment> departments,
    int? departmentId,
  }) async {
    final effectiveDepartmentId = departmentId ?? state.departmentId;

    if (state.status != BaseStateStatus.loading) {
      emit(state.copyWith(status: BaseStateStatus.loading));
    }

    final dateStartStr = DateTime(start.year, start.month, start.day, 0, 0, 0)
        .toUtc()
        .toIso8601String();
    final dateEndStr = DateTime(end.year, end.month, end.day, 23, 59, 59)
        .toUtc()
        .toIso8601String();

    final payload = {
      "filterText": state.selectedEmployeeName ?? '',
      "page": 1,
      "size": 100000,
      "dateStart": dateStartStr,
      "dateEnd": dateEndStr,
      "departmentID": effectiveDepartmentId ?? 0,
      "idApprovedTP": state.filterApprovedTp ?? 0,
      "employeeID": state.selectedEmployeeId ?? 0,
    };

    _log.logI('SummaryOvertime payload: $payload');

    final res = await _repo.getOvertimeSummary(payload: payload);
    await res.fold(
      (l) async {
        _log.logE('Get overtime summary failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          departments: departments,
        ));
      },
      (r) async {
        _log.logI(
          'SummaryOvertime success - items: ${r.items.length}, persons: ${r.persons.length}',
        );
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            overtime: r.items,
            persons: r.persons,
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