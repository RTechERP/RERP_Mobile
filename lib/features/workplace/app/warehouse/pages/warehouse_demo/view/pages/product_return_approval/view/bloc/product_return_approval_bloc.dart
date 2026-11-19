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
      );
    });
  }

  /// Tải danh sách phiếu trả sản phẩm theo bộ lọc hiện tại.
  Future<void> _onFetch(Emitter<ProductReturnApprovalState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

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
          ),
        );
      },
      (items) {
        _log.logI('✅ getProductHistory success - total: ${items.length}');
        emit(state.copyWith(status: BaseStateStatus.success, items: items));
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
  void _onSearch(
    Emitter<ProductReturnApprovalState> emit, {
    required String keyword,
  }) {
    emit(state.copyWith(searchKeyword: keyword.trim()));
  }

  /// Chọn nhân viên để lọc. `null` = không lọc theo nhân viên.
  void _onSelectEmployee(
    Emitter<ProductReturnApprovalState> emit, {
    required int? employeeId,
  }) {
    emit(state.copyWith(employeeId: employeeId));
  }

  /// Lọc theo kho. `null` = không lọc theo kho.
  void _onChangeWarehouseFilter(
    Emitter<ProductReturnApprovalState> emit, {
    required int? warehouseId,
  }) {
    emit(state.copyWith(warehouseId: warehouseId));
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
      ),
    );
    await _onFetch(emit);
  }

  /// Format ngày theo `yyyy-MM-dd HH:mm:ss` đúng format API yêu cầu.
  String _formatApiDateTime(DateTime date) =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
}
