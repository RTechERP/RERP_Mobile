import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';

import '../../data/datasource/models/product_return_approval_model.dart';
import '../../data/repository/product_return_approval_repo.dart';

part 'product_return_approval_event.dart';
part 'product_return_approval_state.dart';
part 'product_return_approval_bloc.freezed.dart';
part 'product_return_approval_bloc.g.dart';

/// Bloc quản lý màn duyệt trả sản phẩm: tải danh sách nhân viên được giao
/// duyệt, tải danh sách phiếu trả sản phẩm theo khoảng ngày / kho / nhân
/// viên; lọc cục bộ theo từ khoá.
@injectable
class ProductReturnApprovalBloc
    extends BaseBloc<ProductReturnApprovalEvent, ProductReturnApprovalState> {
  final ProductReturnApprovalRepo _repo;
  final LogUtils _log;

  ProductReturnApprovalBloc(this._repo, this._log)
    : super(ProductReturnApprovalState.init()) {
    on<ProductReturnApprovalEvent>((event, emit) async {
      await event.when(
        fetch: () => _onFetch(emit),
        fetchEmployees: () => _onFetchEmployees(emit),
        search: (keyword) async => _onSearch(emit, keyword: keyword),
        selectEmployee: (employeeId) async =>
            _onSelectEmployee(emit, employeeId: employeeId),
        changeWarehouseFilter: (warehouseId) async =>
            _onChangeWarehouseFilter(emit, warehouseId: warehouseId),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        toggleSelection: (id) async => _onToggleSelection(emit, id: id),
        selectAll: () async => _onSelectAll(emit),
        clearSelection: () async => _onClearSelection(emit),
        approveSelected: () => _onApproveSelected(emit),
        approveSingle: (id) => _onApproveSingle(emit, id: id),
      );
    });
  }

  /// Tải danh sách phiếu trả sản phẩm theo bộ lọc hiện tại.
  ///
  /// [silent] = true → không hiện màn loading toàn màn, giữ list cũ trong lúc
  /// tải (dùng khi refresh sau khi duyệt).
  Future<void> _onFetch(
    Emitter<ProductReturnApprovalState> emit, {
    bool silent = false,
  }) async {
    if (silent) {
      emit(state.copyWith(isRefreshing: true));
    } else {
      emit(state.copyWith(status: BaseStateStatus.loading));
    }

    final res = await _repo.getProductHistory(
      keyWords: state.searchKeyword.isEmpty ? null : state.searchKeyword,
      dateStart: _formatApiDateTime(state.dateStart ?? DateTime.now()),
      dateEnd: _formatApiDateTime(state.dateEnd ?? DateTime.now()),
      warehouseId:
          state.warehouseId ?? ProductReturnApprovalState.defaultWarehouseId,
      userId: state.selectedEmployee?.userId ?? 0,
    );

    res.fold(
      (err) {
        _log.logE('❌ getProductHistory failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
            isRefreshing: false,
          ),
        );
      },
      (items) {
        _log.logI('✅ getProductHistory success - total: ${items.length}');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            items: items,
            isRefreshing: false,
          ),
        );
      },
    );
  }

  /// Tải danh sách nhân viên được giao duyệt trả sản phẩm.
  /// Lỗi tải NV không chặn danh sách phiếu.
  Future<void> _onFetchEmployees(
    Emitter<ProductReturnApprovalState> emit,
  ) async {
    final res = await _repo.getEmployeeTeamAndDepartment();

    res.fold(
      (err) {
        _log.logE('❌ getEmployeeTeamAndDepartment failed: $err');
        emit(state.copyWith(employees: const []));
      },
      (employees) {
        _log.logI(
          '✅ getEmployeeTeamAndDepartment success - total: ${employees.length}',
        );
        emit(state.copyWith(employees: employees));
      },
    );
  }

  /// Lưu từ khoá rồi lọc lại danh sách (lọc cục bộ, không gọi API).
  ///
  /// Đổi từ khoá → bỏ chọn các phiếu đang chọn để tránh duyệt nhầm phiếu bị ẩn.
  void _onSearch(
    Emitter<ProductReturnApprovalState> emit, {
    required String keyword,
  }) {
    emit(state.copyWith(searchKeyword: keyword.trim(), selectedIds: const {}));
  }

  /// Chọn nhân viên để lọc. `null` = không lọc theo nhân viên.
  void _onSelectEmployee(
    Emitter<ProductReturnApprovalState> emit, {
    required int? employeeId,
  }) {
    emit(state.copyWith(employeeId: employeeId, selectedIds: const {}));
  }

  /// Lọc theo kho. `null` = không lọc theo kho.
  void _onChangeWarehouseFilter(
    Emitter<ProductReturnApprovalState> emit, {
    required int? warehouseId,
  }) {
    emit(state.copyWith(warehouseId: warehouseId, selectedIds: const {}));
  }

  /// Đổi khoảng ngày lọc rồi tải lại danh sách.
  Future<void> _onChangeDateRange(
    Emitter<ProductReturnApprovalState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(
      state.copyWith(
        dateStart: DateTime(dateStart.year, dateStart.month, dateStart.day),
        dateEnd: DateTime(dateEnd.year, dateEnd.month, dateEnd.day),
        selectedIds: const {},
      ),
    );
    await _onFetch(emit);
  }

  /// Format ngày theo `yyyy-MM-dd HH:mm:ss` đúng format API yêu cầu.
  String _formatApiDateTime(DateTime date) =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(date);

  //---(Selection)---//

  /// Bật / tắt chọn 1 phiếu.
  void _onToggleSelection(
    Emitter<ProductReturnApprovalState> emit, {
    required int id,
  }) {
    if (id == 0) return;
    final next = Set<int>.from(state.selectedIds);
    if (!next.remove(id)) next.add(id);
    emit(state.copyWith(selectedIds: next));
  }

  /// Chọn tất cả các phiếu đang hiển thị.
  void _onSelectAll(Emitter<ProductReturnApprovalState> emit) {
    final next = state.visibleItems
        .map((item) => item.id ?? 0)
        .where((id) => id != 0)
        .toSet();
    emit(state.copyWith(selectedIds: next));
  }

  /// Bỏ chọn tất cả.
  void _onClearSelection(Emitter<ProductReturnApprovalState> emit) {
    emit(state.copyWith(selectedIds: const {}));
  }

  //---(Approve)---//

  /// Duyệt các phiếu đang chọn.
  Future<void> _onApproveSelected(
    Emitter<ProductReturnApprovalState> emit,
  ) async {
    await _approveIds(emit, state.selectedIds.toList(), clearSelection: true);
  }

  /// Duyệt 1 phiếu (dùng khi bấm nút duyệt trong bottom sheet chi tiết).
  Future<void> _onApproveSingle(
    Emitter<ProductReturnApprovalState> emit, {
    required int id,
  }) async {
    await _approveIds(emit, [id]);
  }

  /// Duyệt danh sách phiếu.
  ///
  /// Với mỗi phiếu: gọi API chi tiết (`get-history-product-rtc-by-id`) để lấy
  /// `ID`, sau đó gọi API duyệt (`return-productrtc`) với `HistoryId` là `ID`
  /// vừa lấy.
  ///
  /// - [clearSelection] = true → xóa lựa chọn sau khi duyệt (dùng khi duyệt
  ///   hàng loạt). Duyệt 1 phiếu thì giữ nguyên lựa chọn đang dở.
  Future<void> _approveIds(
    Emitter<ProductReturnApprovalState> emit,
    List<int> ids, {
    bool clearSelection = false,
  }) async {
    if (ids.isEmpty) return;
    // Chặn duyệt chồng nhau (double tap).
    if (state.isApproving) return;

    emit(
      state.copyWith(
        isApproving: true,
        approveTotal: ids.length,
        approvedCount: 0,
        failedCount: 0,
        message: null,
      ),
    );

    var approved = 0;
    var failed = 0;
    String? errorMessage;

    for (final id in ids) {
      final detailRes = await _repo.getHistoryDetail(productHistoryId: id);

      final historyId = detailRes.fold((err) {
        _log.logE('❌ getHistoryDetail failed id=$id: $err');
        errorMessage = err.getErrorMessage;
        return null;
      }, (detail) => detail.id ?? id);
      if (historyId == null) {
        failed++;
        emit(state.copyWith(approvedCount: approved, failedCount: failed));
        continue;
      }

      final approveRes = await _repo.approveReturnProduct(historyId: historyId);
      approveRes.fold(
        (err) {
          _log.logE('❌ approveReturnProduct failed id=$historyId: $err');
          errorMessage = err.getErrorMessage;
          failed++;
        },
        (_) {
          _log.logI('✅ approved id=$historyId');
          approved++;
        },
      );

      // Cập nhật tiến trình sau mỗi phiếu.
      emit(state.copyWith(approvedCount: approved, failedCount: failed));
    }

    emit(
      state.copyWith(
        selectedIds: clearSelection ? const {} : state.selectedIds,
        isApproving: false,
        approvedCount: approved,
        failedCount: failed,
        message: failed > 0 ? errorMessage : null,
        approveRound: state.approveRound + 1,
      ),
    );

    // Tải lại danh sách để loại bỏ các phiếu đã duyệt (giữ list cũ trong lúc tải).
    await _onFetch(emit, silent: true);
  }
}
