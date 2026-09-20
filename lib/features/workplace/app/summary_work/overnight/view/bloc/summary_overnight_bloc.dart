import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/summary_overnight_model.dart';
import '../../data/repository/summary_overnight_repo.dart';

part 'summary_overnight_event.dart';
part 'summary_overnight_state.dart';
part 'summary_overnight_bloc.g.dart';
part 'summary_overnight_bloc.freezed.dart';

/// Bloc xử lý logic nghiệp vụ cho màn tổng hợp phiếu làm đêm.
@injectable
class SummaryOvernightBloc
    extends BaseBloc<SummaryOvernightEvent, SummaryOvernightState> {
  final SummaryOvernightRepo _repo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  SummaryOvernightBloc(
    this._repo,
    this._authRepo,
    this._log,
  ) : super(SummaryOvernightState.init()) {
    on<SummaryOvernightEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
        changeFilters: (departmentId, status) =>
            _onChangeFilters(emit, departmentId: departmentId, status: status),
        refresh: () => _onInit(emit),
      );
    });
  }

  /// Khởi tạo: lấy user hiện tại (default department), danh sách phòng ban
  /// và tải dữ liệu trong tháng hiện tại.
  Future<void> _onInit(Emitter<SummaryOvernightState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // Lấy phòng ban mặc định từ user hiện tại.
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
    List<SummaryOvernightDepartment> departments = [];
    deptRes.fold(
      (l) => _log.logE('Get departments failed: $l'),
      (r) => departments = r,
    );

    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0);

    await _loadOvernight(
      emit,
      start: start,
      end: end,
      departments: departments,
      departmentId: defaultDepartmentId,
    );
  }

  /// Thay đổi khoảng ngày: cập nhật state và reload dữ liệu.
  Future<void> _onChangeDateRange(
    Emitter<SummaryOvernightState> emit, {
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

    await _loadOvernight(
      emit,
      start: start,
      end: end,
      departments: state.departments,
    );
  }

  /// Thay đổi từ khoá tìm kiếm và reload dữ liệu.
  _onChangeKeyword(
    Emitter<SummaryOvernightState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(keyword: keyword));
    if (state.dateStart == null || state.dateEnd == null) return;
    await _loadOvernight(
      emit,
      start: state.dateStart!,
      end: state.dateEnd!,
      departments: state.departments,
    );
  }

  /// Thay đổi bộ lọc (phòng ban, trạng thái) và reload dữ liệu.
  _onChangeFilters(
    Emitter<SummaryOvernightState> emit, {
    int? departmentId,
    int? status,
  }) async {
    emit(state.copyWith(
      departmentId: departmentId,
      filterStatus: status,
    ));
    if (state.dateStart == null || state.dateEnd == null) return;
    await _loadOvernight(
      emit,
      start: state.dateStart!,
      end: state.dateEnd!,
      departments: state.departments,
    );
  }

  /// Gọi API lấy danh sách phiếu làm đêm theo payload.
  Future<void> _loadOvernight(
    Emitter<SummaryOvernightState> emit, {
    required DateTime start,
    required DateTime end,
    required List<SummaryOvernightDepartment> departments,
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
      "EmployeeID": 0,
      "Page": 1,
      "Size": 100000,
      "KeyWord": state.keyword,
      "DateStart": dateStartStr,
      "DateEnd": dateEndStr,
      "IsApproved": state.filterStatus ?? -1,
      "DepartmentID": effectiveDepartmentId ?? 0,
    };

    _log.logI('SummaryOvernight payload: $payload');

    final res = await _repo.getOvernight(payload: payload);
    await res.fold(
      (l) async {
        _log.logE('Get overnight failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          departments: departments,
        ));
      },
      (r) async {
        _log.logI('SummaryOvernight success - total: ${r.length}');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            overnight: r,
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