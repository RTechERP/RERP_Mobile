// Bloc cho màn Duyệt phiếu thanh toán Đặt phòng nhà nghỉ.
// Quản lý danh sách phiếu chờ duyệt TBP + bộ lọc (search / project / employee).

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
        init: (dateStart, dateEnd) => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) => _onChangeDateRange(emit),
        changeFilterText: (filterText) =>
            _onChangeFilterText(emit, filterText: filterText),
        refresh: () => _onRefresh(emit),
        loadFilters: () => _onLoadFilters(emit),
        changeProjectFilter: (project) =>
            _onChangeProjectFilter(emit, project: project),
        changeEmployeeFilter: (employee) =>
            _onChangeEmployeeFilter(emit, employee: employee),
        changeStatusFilter: (status) =>
            _onChangeStatusFilter(emit, status: status),
        toggleSelection: (id) => _onToggleSelection(emit, id: id),
        clearSelection: () => _onClearSelection(emit),
        selectAll: () => _onSelectAll(emit),
        approveSelected: () => _onApproveSelected(emit),
        rejectSelected: () => _onRejectSelected(emit),
      );
    });
  }

  //---(Init)---//

  Future<void> _onInit(
    Emitter<ApproveBookingGuestHouseState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));
    await _fetch(emit);
  }

  //---(Change Date Range)---//
  // API mới không dùng date range — giữ method để UI không bị lỗi.

  Future<void> _onChangeDateRange(
    Emitter<ApproveBookingGuestHouseState> emit, {
    DateTime? dateStart,
    DateTime? dateEnd,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: dateStart,
      dateEnd: dateEnd,
      message: null,
    ));
    await _fetch(emit);
  }

  //---(Change Filter Text)---//

  Future<void> _onChangeFilterText(
    Emitter<ApproveBookingGuestHouseState> emit, {
    required String filterText,
  }) async {
    if (filterText == state.filterText) return;

    emit(state.copyWith(
      status: BaseStateStatus.loading,
      filterText: filterText,
      message: null,
    ));

    await _fetch(emit);
  }

  //---(Refresh)---//

  Future<void> _onRefresh(
      Emitter<ApproveBookingGuestHouseState> emit) async {
    emit(state.copyWith(isRefreshing: true, message: null));

    await _fetch(
      emit,
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
        selectedEmployee: null,
        message: null,
      ),
    );

    await _fetch(emit);
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
        selectedProject: null,
        message: null,
      ),
    );

    await _fetch(emit);
  }

  //---(Change Status Filter)---//

  Future<void> _onChangeStatusFilter(
    Emitter<ApproveBookingGuestHouseState> emit, {
    required int? status,
  }) async {
    if (status == state.statusFilter) return;

    emit(state.copyWith(
      status: BaseStateStatus.loading,
      statusFilter: status,
      message: null,
    ));

    await _fetch(emit);
  }

  //---(Fetch)---//

  Future<void> _fetch(
    Emitter<ApproveBookingGuestHouseState> emit, {
    Function(List<ApproveBookingGuestHouseItem> bookings)?
        onSuccessExtra,
    VoidCallback? onFailureExtra,
  }) async {
    _log.logI(
      '📋 fetch approveBookingGuestHouse filterText="${state.filterText}" '
      'projectId=${state.selectedProject?.id ?? 0} '
      'employeeId=${state.selectedEmployee?.userId ?? 0}',
    );

    final res = await _repo.getPendingForTbp();

    res.fold(
      (err) {
        _log.logE('❌ API failed: $err');
        onFailureExtra?.call();
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (bookings) {
        _log.logI('✅ API success - total: ${bookings.length}');
        final filtered = _applyStatusFilter(bookings, state.statusFilter);
        onSuccessExtra?.call(filtered);
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            bookings: filtered,
            message: null,
          ),
        );
      },
    );
  }

  /// Lọc theo `statusFilter` (chưa duyệt / đã duyệt / tất cả).
  List<ApproveBookingGuestHouseItem> _applyStatusFilter(
    List<ApproveBookingGuestHouseItem> source,
    int? statusFilter,
  ) {
    if (statusFilter == null) return source;
    return source
        .where((b) => b.detailStatus == statusFilter)
        .toList(growable: false);
  }

  //---(Selection)---//

  _onToggleSelection(
    Emitter<ApproveBookingGuestHouseState> emit, {
    required int id,
  }) {
    final next = Set<int>.from(state.selectedIds);
    if (next.contains(id)) {
      next.remove(id);
    } else {
      next.add(id);
    }
    emit(state.copyWith(selectedIds: next));
  }

  _onClearSelection(
    Emitter<ApproveBookingGuestHouseState> emit,
  ) {
    emit(state.copyWith(selectedIds: {}));
  }

  _onSelectAll(
    Emitter<ApproveBookingGuestHouseState> emit,
  ) {
    final all = state.bookings.map((b) => b.id).toSet();
    emit(state.copyWith(selectedIds: all));
  }

  //---(Approve / Reject)---//

  Future<void> _onApproveSelected(
    Emitter<ApproveBookingGuestHouseState> emit,
  ) async {
    final ids = state.selectedIds.toList();
    if (ids.isEmpty) return;

    emit(state.copyWith(isApproving: true));

    var success = true;
    for (final id in ids) {
      final res = await _repo.updateDetailStatus(detailId: id, status: 3);
      res.fold(
        (err) {
          _log.logE('❌ Approve failed id=$id: $err');
          success = false;
        },
        (_) => _log.logI('✅ Approved id=$id'),
      );
    }

    emit(state.copyWith(selectedIds: {}, isApproving: false));
    if (success) {
      await _fetch(emit);
    }
  }

  Future<void> _onRejectSelected(
    Emitter<ApproveBookingGuestHouseState> emit,
  ) async {
    final ids = state.selectedIds.toList();
    if (ids.isEmpty) return;

    emit(state.copyWith(isApproving: true));

    var success = true;
    for (final id in ids) {
      final res = await _repo.updateDetailStatus(detailId: id, status: 2);
      res.fold(
        (err) {
          _log.logE('❌ Reject failed id=$id: $err');
          success = false;
        },
        (_) => _log.logI('✅ Rejected id=$id'),
      );
    }

    emit(state.copyWith(selectedIds: {}, isApproving: false));
    if (success) {
      await _fetch(emit);
    }
  }
}
