// Bloc xử lý logic màn Personal Summary (8 tab phiếu cá nhân).
// Quản lý: khoảng ngày, filter trạng thái duyệt, từ khoá tìm kiếm và dữ liệu nhận về.
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../auth/data/repository/auth_repo.dart';
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
        changeStatusFilter: (status) async =>
            _onChangeStatusFilter(emit, status: status),
        changeKeyword: (keyword) async =>
            _onChangeKeyword(emit, keyword: keyword),
        refresh: () async => _onRefresh(emit),
      );
    });
  }

  /// Xây payload từ state hiện tại + employeeId.
  Map<String, dynamic> _payload({
    required int? employeeId,
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
      'DepartmentID': employeeId ?? 0,
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

    final payload = _payload(
      employeeId: employee?.departmentId,
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
      departmentId: employee?.departmentId,
      dateStart: dateStart,
      dateEnd: dateEnd,
      keyword: state.keyword,
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
  }) {
    String two(int v) => v.toString().padLeft(2, '0');
    final startStr =
        '${dateStart.year}-${two(dateStart.month)}-${two(dateStart.day)}';
    final endStr =
        '${dateEnd.year}-${two(dateEnd.month)}-${two(dateEnd.day)}';
    return <String, dynamic>{
      'departmentID': departmentId ?? 0,
      'employeeID': 0,
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

      final now = DateTime.now();
      // Mặc định: 2 ngày gần nhất (hôm qua → hôm nay).
      final defaultEnd = DateTime(now.year, now.month, now.day);
      final defaultStart =
          defaultEnd.subtract(const Duration(days: 1));

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

  Future<void> _onChangeStatusFilter(
    Emitter<PersonalSummaryState> emit, {
    required int status,
  }) async {
    if (status == state.statusFilter) return;
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      statusFilter: status,
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
}

/// Làm phẳng `List<List<T>>` của BE thành một `List<T>`.
List<T> flatten<T>(List<List<T>> input) {
  final out = <T>[];
  for (final sub in input) {
    out.addAll(sub);
  }
  return out;
}
