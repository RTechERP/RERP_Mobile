// Bloc xử lý logic màn Personal Summary (8 tab phiếu cá nhân).
// Quản lý: khoảng ngày, filter phòng ban + trạng thái duyệt, từ khoá tìm
// kiếm, dữ liệu nhận về, danh sách nhân sự cho drawer (tab Vân tay) và
// nhân sự đang được chọn.
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../../../summary_work/leave/data/datasource/models/summary_leave_model.dart';
import '../../data/datasource/models/personal_summary_model.dart';
import '../../data/repository/personal_summary_repo.dart';

part 'personal_summary_event.dart';
part 'personal_summary_state.dart';
part 'personal_summary_bloc.g.dart';
part 'personal_summary_bloc.freezed.dart';

@injectable
class PersonalSummaryBloc
    extends BaseBloc<PersonalSummaryEvent, PersonalSummaryState> {
  final LogUtils _log;
  final AuthRepo _authRepo;
  final PersonalSummaryRepo _repo;
  bool _loadInFlight = false;

  PersonalSummaryBloc(this._repo, this._authRepo, this._log)
      : super(PersonalSummaryState.init()) {
    on<PersonalSummaryEvent>((event, emit) async {
      await event.when(
        init: () async => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        changeKeyword: (keyword) async =>
            _onChangeKeyword(emit, keyword: keyword),
        changeFilters: (departmentId, status) async => _onChangeFilters(
          emit,
          departmentId: departmentId,
          status: status,
        ),
        refresh: () async => _onRefresh(emit),
        loadEmployees: () async => _onLoadEmployees(emit),
        selectEmployee: (employeeId) async => _onSelectEmployee(
          emit,
          employeeId: employeeId,
        ),
      );
    });
  }

  /// Xây payload từ state hiện tại + employeeId.
  Map<String, dynamic> _payload({
    required int? departmentId,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int status,
    required String keyword,
  }) {
    final lo = DateTime.utc(dateStart.year, dateStart.month, dateStart.day);
    final hi = DateTime.utc(
      dateEnd.year,
      dateEnd.month,
      dateEnd.day,
      23,
      59,
      59,
    );
    return <String, dynamic>{
      'DateStart': lo.toIso8601String(),
      'DateEnd': hi.toIso8601String(),
      'DepartmentID': departmentId ?? 0,
      'EmployeeID': 0,
      'IsApproved': status,
      'Keyword': keyword,
    };
  }

  Future<void> _fetch(
    Emitter<PersonalSummaryState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final userRes = await _authRepo.getCurrentUser();
    final employee = userRes.fold((_) => null, (u) => u);

    // Nếu chưa chọn phòng ban, mặc định theo user hiện tại.
    final effectiveDepartmentId =
        state.departmentId ?? employee?.departmentId;

    final payload = _payload(
      departmentId: effectiveDepartmentId,
      dateStart: dateStart,
      dateEnd: dateEnd,
      status: state.statusFilter,
      keyword: state.keyword,
    );

    _log.logI('PersonalSummary payload: $payload');

    final res = await _repo.getPersonalSummary(payload: payload);

    // Sau khi load summary, gọi thêm API vân tay (GET, song song độc lập).
    // Nếu lỗi thì vẫn hiển thị được dữ liệu summary.
    final attendanceQuery = _attendanceQuery(
      departmentId: effectiveDepartmentId,
      dateStart: dateStart,
      dateEnd: dateEnd,
      keyword: state.keyword,
      employeeId: state.selectedEmployeeId,
    );
    final attendanceRes = await _repo.getEmployeeAttendance(
      query: attendanceQuery,
    );

    await res.fold(
      (l) async {
        _log.logE('❌ PersonalSummary load failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI(
          '✅ PersonalSummary success - onLeave: ${data.dataOnLeave.length}, '
          'earlyLate: ${flatten(data.dataEarlyLate).length}, '
          'overTime: ${flatten(data.dataOverTime).length}, '
          'bussiness: ${flatten(data.dataBussiness).length}, '
          'wfh: ${flatten(data.dataWfh).length}, '
          'enf: ${flatten(data.dataEnf).length}, '
          'nightShift: ${data.dataNightShift.length}',
        );
        final attendance = attendanceRes.fold(
          (_) => const <PersonalAttendanceItem>[],
          (list) => list,
        );
        emit(state.copyWith(
          status: BaseStateStatus.success,
          onLeave: data.dataOnLeave,
          earlyLate: flatten(data.dataEarlyLate),
          overTime: flatten(data.dataOverTime),
          bussiness: flatten(data.dataBussiness),
          wfh: flatten(data.dataWfh),
          enf: flatten(data.dataEnf),
          nightShift: data.dataNightShift,
          attendance: attendance,
          dateStart: dateStart,
          dateEnd: dateEnd,
          departmentId: effectiveDepartmentId,
        ));
      },
    );
  }

  /// Build query cho API vân tay.
  Map<String, dynamic> _attendanceQuery({
    required int? departmentId,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
    int? employeeId,
  }) {
    String two(int v) => v.toString().padLeft(2, '0');
    final startStr =
        '${dateStart.year}-${two(dateStart.month)}-${two(dateStart.day)}';
    final endStr =
        '${dateEnd.year}-${two(dateEnd.month)}-${two(dateEnd.day)}';
    return <String, dynamic>{
      'departmentID': departmentId ?? 0,
      'employeeID': employeeId ?? 0,
      'keyword': keyword,
      'dateStart': startStr,
      'dateEnd': endStr,
    };
  }

  Future<void> _onInit(Emitter<PersonalSummaryState> emit) async {
    if (_loadInFlight) return;
    _loadInFlight = true;
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));

      // Load departments trước để dùng cho bottom sheet lọc.
      final deptRes = await _repo.getDepartments();
      List<SummaryDepartment> departments = const [];
      deptRes.fold(
        (l) => _log.logE('Get departments failed: $l'),
        (r) => departments = r,
      );

      final now = DateTime.now();
      // Mặc định: 2 ngày gần nhất (hôm qua → hôm nay).
      final defaultEnd = DateTime(now.year, now.month, now.day);
      final defaultStart =
          defaultEnd.subtract(const Duration(days: 1));

      emit(state.copyWith(departments: departments));

      await _fetch(
        emit,
        dateStart: defaultStart,
        dateEnd: defaultEnd,
      );
    } finally {
      _loadInFlight = false;
    }
  }

  Future<void> _onRefresh(Emitter<PersonalSummaryState> emit) async {
    if (_loadInFlight) return;
    _loadInFlight = true;
    try {
      // Không đẩy vào loading để tránh flash skeleton khi pull-to-refresh.
      final start = state.dateStart ?? DateTime.now();
      final end = state.dateEnd ?? DateTime.now();
      await _fetch(emit, dateStart: start, dateEnd: end);
    } finally {
      _loadInFlight = false;
    }
  }

  Future<void> _onChangeDateRange(
    Emitter<PersonalSummaryState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final lo = DateTime(
      dateStart.year,
      dateStart.month,
      dateStart.day,
    );
    final hi = DateTime(
      dateEnd.year,
      dateEnd.month,
      dateEnd.day,
    );
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: lo,
      dateEnd: hi,
    ));
    await _fetch(emit, dateStart: lo, dateEnd: hi);
  }

  /// Đổi bộ lọc (phòng ban + trạng thái) → gọi lại API.
  /// Khi đổi phòng ban, danh sách nhân sự cache sẽ bị invalidate.
  Future<void> _onChangeFilters(
    Emitter<PersonalSummaryState> emit, {
    int? departmentId,
    int? status,
  }) async {
    final deptChanged = departmentId != state.departmentId;
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      departmentId: departmentId,
      statusFilter: status ?? state.statusFilter,
      // Reset cache employees khi đổi phòng ban.
      employees: deptChanged ? const [] : state.employees,
      employeesLoadedForDept:
          deptChanged ? null : state.employeesLoadedForDept,
      selectedEmployeeId: deptChanged ? null : state.selectedEmployeeId,
    ));
    final start = state.dateStart ?? DateTime.now();
    final end = state.dateEnd ?? DateTime.now();
    await _fetch(emit, dateStart: start, dateEnd: end);
  }

  /// Đổi từ khoá → chỉ cập nhật state, không gọi API.
  /// Từ khoá sẽ được UI dùng để filter client-side trên từng tab.
  void _onChangeKeyword(
    Emitter<PersonalSummaryState> emit, {
    required String keyword,
  }) {
    emit(state.copyWith(keyword: keyword));
  }

  /// Load danh sách nhân viên cho drawer (chỉ gọi nếu chưa cache cho
  /// phòng ban hiện tại).
  Future<void> _onLoadEmployees(Emitter<PersonalSummaryState> emit) async {
    final userRes = await _authRepo.getCurrentUser();
    final employee = userRes.fold((_) => null, (u) => u);
    final effectiveDeptId = state.departmentId ?? employee?.departmentId;
    if (effectiveDeptId == null || effectiveDeptId == 0) {
      _log.logE('loadEmployees: missing departmentId');
      emit(state.copyWith(
        employees: const [],
        employeesLoadedForDept: null,
      ));
      return;
    }
    if (state.employeesLoadedForDept == effectiveDeptId &&
        state.employees.isNotEmpty) {
      _log.logI('loadEmployees: cache hit for dept=$effectiveDeptId');
      return;
    }
    emit(state.copyWith(employeesLoading: true));
    final res = await _repo.getEmployees(departmentId: effectiveDeptId);
    res.fold(
      (l) {
        _log.logE('loadEmployees failed: $l');
        emit(state.copyWith(
          employeesLoading: false,
          employees: const [],
          employeesLoadedForDept: null,
        ));
      },
      (list) {
        _log.logI('loadEmployees ok - count: ${list.length}');
        emit(state.copyWith(
          employeesLoading: false,
          employees: list,
          employeesLoadedForDept: effectiveDeptId,
        ));
      },
    );
  }

  /// Chọn nhân viên ở tab Vân tay → gọi lại API vân tay theo nhân viên đó.
  /// Truyền `employeeId = null` để bỏ chọn → lấy lại toàn bộ vân tay của
  /// phòng ban.
  Future<void> _onSelectEmployee(
    Emitter<PersonalSummaryState> emit, {
    int? employeeId,
  }) async {
    if (employeeId == state.selectedEmployeeId) return;
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      selectedEmployeeId: employeeId,
    ));
    final start = state.dateStart ?? DateTime.now();
    final end = state.dateEnd ?? DateTime.now();
    await _fetch(emit, dateStart: start, dateEnd: end);
  }
}

/// Làm phẳng `List<List<T>>` của BE thành một `List<T>`.
List<T> flatten<T>(List<List<T>> input) {
  final out = <T>[];
  for (final sub in input) {
    out.addAll(sub);
  }
  return out;
}
