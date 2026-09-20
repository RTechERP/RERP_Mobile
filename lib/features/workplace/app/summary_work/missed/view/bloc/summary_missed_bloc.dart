import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/summary_missed_model.dart';
import '../../data/repository/summary_missed_repo.dart';

part 'summary_missed_event.dart';
part 'summary_missed_state.dart';
part 'summary_missed_bloc.g.dart';
part 'summary_missed_bloc.freezed.dart';

/// Bloc xử lý logic nghiệp vụ cho màn tổng hợp phiếu quên chấm công.
@injectable
class SummaryMissedBloc
    extends BaseBloc<SummaryMissedEvent, SummaryMissedState> {
  final SummaryMissedRepo _repo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  SummaryMissedBloc(
    this._repo,
    this._authRepo,
    this._log,
  ) : super(SummaryMissedState.init()) {
    on<SummaryMissedEvent>((event, emit) async {
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
  Future<void> _onInit(Emitter<SummaryMissedState> emit) async {
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
    List<SummaryMissedDepartment> departments = [];
    deptRes.fold(
      (l) => _log.logE('Get departments failed: $l'),
      (r) => departments = r,
    );

    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0);

    await _loadMissed(
      emit,
      start: start,
      end: end,
      departments: departments,
      departmentId: defaultDepartmentId,
    );
  }

  /// Thay đổi khoảng ngày: cập nhật state và reload dữ liệu.
  Future<void> _onChangeDateRange(
    Emitter<SummaryMissedState> emit, {
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

    await _loadMissed(
      emit,
      start: start,
      end: end,
      departments: state.departments,
    );
  }

  /// Thay đổi từ khoá tìm kiếm và reload dữ liệu.
  _onChangeKeyword(
    Emitter<SummaryMissedState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(keyword: keyword));
    if (state.dateStart == null || state.dateEnd == null) return;
    await _loadMissed(
      emit,
      start: state.dateStart!,
      end: state.dateEnd!,
      departments: state.departments,
    );
  }

  /// Thay đổi bộ lọc (phòng ban, trạng thái) và reload dữ liệu.
  _onChangeFilters(
    Emitter<SummaryMissedState> emit, {
    int? departmentId,
    int? status,
  }) async {
    emit(state.copyWith(
      departmentId: departmentId,
      filterStatus: status,
    ));
    if (state.dateStart == null || state.dateEnd == null) return;
    await _loadMissed(
      emit,
      start: state.dateStart!,
      end: state.dateEnd!,
      departments: state.departments,
    );
  }

  /// Gọi API lấy danh sách phiếu quên chấm công theo payload.
  Future<void> _loadMissed(
    Emitter<SummaryMissedState> emit, {
    required DateTime start,
    required DateTime end,
    required List<SummaryMissedDepartment> departments,
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
      "Page": 1,
      "Size": 50,
      "Keyword": state.keyword,
      "DateStart": dateStartStr,
      "DateEnd": dateEndStr,
      "IDApprovedTP": 0,
      "Status": state.filterStatus ?? -1,
      "DepartmentID": effectiveDepartmentId ?? 0,
    };

    _log.logI('SummaryMissed payload: $payload');

    final res = await _repo.getMissed(payload: payload);
    await res.fold(
      (l) async {
        _log.logE('Get missed failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          departments: departments,
        ));
      },
      (r) async {
        _log.logI('SummaryMissed success - total: ${r.length}');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            missed: r,
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