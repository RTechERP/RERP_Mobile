// Bloc cho màn Duyệt phiếu Đặt phòng nhà nghỉ.
// Quản lý danh sách phiếu (theo khoảng ngày, lọc project/employee).
//
// Tại thời điểm này bloc chỉ phục vụ phần hiển thị danh sách + bộ lọc
// (search / date range / project / employee). Các thao tác duyệt
// (approve / reject) sẽ được bổ sung ở bước tiếp theo.

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/approve_booking_guest_house_model.dart';
import '../../data/repository/approve_booking_guest_house_repo.dart';

part 'approve_booking_guest_house_event.dart';
part 'approve_booking_guest_house_state.dart';
part 'approve_booking_guest_house_bloc.g.dart';
part 'approve_booking_guest_house_bloc.freezed.dart';

@injectable
class ApproveBookingGuestHouseBloc extends BaseBloc<
    ApproveBookingGuestHouseEvent, ApproveBookingGuestHouseState> {
  final LogUtils _log;
  final ApproveBookingGuestHouseRepo _repo;

  ApproveBookingGuestHouseBloc(this._repo, this._log)
      : super(ApproveBookingGuestHouseState.init()) {
    on<ApproveBookingGuestHouseEvent>((event, emit) async {
      await event.when(
        init: (dateStart, dateEnd) => _onInit(
          emit,
          dateStart: dateStart,
          dateEnd: dateEnd,
        ),
        changeDateRange: (dateStart, dateEnd) => _onChangeDateRange(
          emit,
          dateStart: dateStart,
          dateEnd: dateEnd,
        ),
        changeFilterText: (filterText) =>
            _onChangeFilterText(emit, filterText: filterText),
        refresh: () => _onRefresh(emit),
        loadFilters: () => _onLoadFilters(emit),
        changeProjectFilter: (project) =>
            _onChangeProjectFilter(emit, project: project),
        changeEmployeeFilter: (employee) =>
            _onChangeEmployeeFilter(emit, employee: employee),
      );
    });
  }

  //---(Init)---//

  Future<void> _onInit(
    Emitter<ApproveBookingGuestHouseState> emit, {
    DateTime? dateStart,
    DateTime? dateEnd,
  }) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final start = dateStart ?? _defaultDateStart();
    final end = dateEnd ?? _defaultDateEnd();

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: state.filterText,
    );
  }

  //---(Change Date Range)---//

  Future<void> _onChangeDateRange(
    Emitter<ApproveBookingGuestHouseState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    final normalizedStart = _dateOnly(dateStart);
    final normalizedEnd = _endOfDay(dateEnd);

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        dateStart: normalizedStart,
        dateEnd: normalizedEnd,
        message: null,
      ),
    );

    await _fetch(
      emit,
      dateStart: normalizedStart,
      dateEnd: normalizedEnd,
      filterText: state.filterText,
    );
  }

  //---(Change Filter Text)---//

  Future<void> _onChangeFilterText(
    Emitter<ApproveBookingGuestHouseState> emit, {
    required String filterText,
  }) async {
    if (filterText == state.filterText) return;

    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        filterText: filterText,
        message: null,
      ),
    );

    final start = state.dateStart ?? _defaultDateStart();
    final end = state.dateEnd ?? _defaultDateEnd();

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: filterText,
    );
  }

  //---(Refresh)---//

  Future<void> _onRefresh(
      Emitter<ApproveBookingGuestHouseState> emit) async {
    final start = state.dateStart ?? _defaultDateStart();
    final end = state.dateEnd ?? _defaultDateEnd();

    emit(state.copyWith(isRefreshing: true, message: null));

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: state.filterText,
      onSuccessExtra: (bookings) => emit(
        state.copyWith(bookings: bookings, isRefreshing: false),
      ),
      onFailureExtra: () => emit(state.copyWith(isRefreshing: false)),
    );
  }

  //---(Load Filters)---//

  Future<void> _onLoadFilters(
      Emitter<ApproveBookingGuestHouseState> emit) async {
    emit(state.copyWith(isLoadingFilters: true));

    // Gọi song song 2 API: dự án + nhân viên.
    final projectRes = await _repo.getApproveBookingGuestHouseProjects();
    final employeeRes = await _repo.getApproveBookingGuestHouseEmployees();

    List<ApproveProjectFilterItem> projects = [];
    List<ApproveEmployeeFilterItem> employees = [];

    projectRes.fold(
      (err) => _log.logE('❌ getApproveBookingGuestHouseProjects failed: $err'),
      (data) => projects = data,
    );

    employeeRes.fold(
      (err) => _log.logE('❌ getApproveBookingGuestHouseEmployees failed: $err'),
      (data) => employees = data,
    );

    emit(state.copyWith(
      isLoadingFilters: false,
      projects: projects,
      employees: employees,
    ));
  }

  //---(Change Project Filter)---//

  Future<void> _onChangeProjectFilter(
    Emitter<ApproveBookingGuestHouseState> emit, {
    required ApproveProjectFilterItem? project,
  }) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        selectedProject: project,
        selectedEmployee: null, // reset employee when project changes
        message: null,
      ),
    );

    final start = state.dateStart ?? _defaultDateStart();
    final end = state.dateEnd ?? _defaultDateEnd();

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: state.filterText,
    );
  }

  //---(Change Employee Filter)---//

  Future<void> _onChangeEmployeeFilter(
    Emitter<ApproveBookingGuestHouseState> emit, {
    required ApproveEmployeeFilterItem? employee,
  }) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        selectedEmployee: employee,
        selectedProject: null, // reset project when employee changes
        message: null,
      ),
    );

    final start = state.dateStart ?? _defaultDateStart();
    final end = state.dateEnd ?? _defaultDateEnd();

    await _fetch(
      emit,
      dateStart: start,
      dateEnd: end,
      filterText: state.filterText,
    );
  }

  //---(Fetch)---//

  /// Gọi repo và emit kết quả về state.
  /// [onSuccessExtra]/[onFailureExtra] dùng để update thêm các cờ
  /// (vd: tắt `isRefreshing` khi pull-to-refresh) sau khi đã set status.
  Future<void> _fetch(
    Emitter<ApproveBookingGuestHouseState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
    required String filterText,
    void Function(List<ApproveBookingGuestHouseItem> bookings)?
        onSuccessExtra,
    VoidCallback? onFailureExtra,
  }) async {
    final startStr = _iso(dateStart);
    final endStr = _iso(dateEnd);

    // projectId: dùng ID của dự án đang chọn, hoặc 0 nếu không chọn.
    final projectId = state.selectedProject?.id ?? 0;
    // employeeId: dùng UserID của nhân viên đang chọn, hoặc 0 nếu không chọn.
    final employeeId = state.selectedEmployee?.userId ?? 0;

    _log.logI(
      '📋 fetch approveBookingGuestHouse dateStart=$startStr '
      'dateEnd=$endStr filterText="$filterText" '
      'projectId=$projectId employeeId=$employeeId',
    );

    final res = await _repo.getApproveBookingGuestHouse(
      dateStart: startStr,
      dateEnd: endStr,
      projectId: projectId,
      employeeId: employeeId,
      filterText: filterText,
    );

    res.fold(
      (err) {
        _log.logE('❌ API failed: $err');
        onFailureExtra?.call();
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
            dateStart: dateStart,
            dateEnd: dateEnd,
          ),
        );
      },
      (bookings) {
        _log.logI('✅ API success - total: ${bookings.length}');
        onSuccessExtra?.call(bookings);
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            bookings: bookings,
            dateStart: dateStart,
            dateEnd: dateEnd,
            filterText: filterText,
            message: null,
          ),
        );
      },
    );
  }

  //---(Helpers)---//

  DateTime _defaultDateStart() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  DateTime _defaultDateEnd() {
    final start = _defaultDateStart();
    final nextMonth = (start.month == 12)
        ? DateTime(start.year + 1, 1, 1)
        : DateTime(start.year, start.month + 1, 1);
    return nextMonth.subtract(const Duration(days: 1));
  }

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  DateTime _endOfDay(DateTime d) =>
      DateTime(d.year, d.month, d.day, 23, 59, 59);

  /// Format ISO giống payload mẫu: `2026-09-30T17:00:00.000Z`.
  String _iso(DateTime d) {
    final utc = d.toUtc();
    final y = utc.year.toString().padLeft(4, '0');
    final m = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    final h = utc.hour.toString().padLeft(2, '0');
    final mi = utc.minute.toString().padLeft(2, '0');
    final s = utc.second.toString().padLeft(2, '0');
    return '$y-$m-${day}T$h:$mi:$s.000Z';
  }
}
