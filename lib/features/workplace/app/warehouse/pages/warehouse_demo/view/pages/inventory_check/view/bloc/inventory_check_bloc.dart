import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';

import '../../data/datasource/models/inventory_check_model.dart';
import '../../data/repository/inventory_check_repo.dart';

part 'inventory_check_event.dart';
part 'inventory_check_state.dart';
part 'inventory_check_bloc.freezed.dart';
part 'inventory_check_bloc.g.dart';

/// Bloc quản lý danh sách đợt kiểm kê kho: tải dữ liệu theo khoảng ngày,
/// lọc cục bộ theo từ khoá, nhân viên kiểm kê, kho; đồng thời xử lý form tạo
/// mới đợt kiểm kê (sinh mã đợt + lưu đợt kiểm kê).
@injectable
class InventoryCheckBloc
    extends BaseBloc<InventoryCheckEvent, InventoryCheckState> {
  final InventoryCheckRepo _repo;
  final LogUtils _log;

  InventoryCheckBloc(this._repo, this._log)
    : super(InventoryCheckState.init()) {
    on<InventoryCheckEvent>((event, emit) async {
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
        generateCode: (date) => _onGenerateCode(emit, date: date),
        save: (payload) => _onSave(emit, payload: payload),
        getById: (id) => _onGetById(emit, id: id),
        delete: (id) => _onDelete(emit, id: id),
      );
    });
  }

  /// Tải danh sách đợt kiểm kê theo khoảng ngày hiện tại.
  Future<void> _onFetch(Emitter<InventoryCheckState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _repo.getInventoryCounts(
      dateStart: _formatApiDate(state.dateStart ?? DateTime.now()),
      dateEnd: _formatApiDate(state.dateEnd ?? DateTime.now()),
    );

    res.fold(
      (err) {
        _log.logE('❌ getInventoryCounts failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (items) {
        _log.logI('✅ getInventoryCounts success - total: ${items.length}');
        emit(state.copyWith(status: BaseStateStatus.success, items: items));
      },
    );
  }

  /// Tải danh sách nhân viên được giao kiểm kê (dùng cho sheet chọn NV).
  /// Lỗi tải NV không chặn danh sách đợt kiểm kê.
  Future<void> _onFetchEmployees(Emitter<InventoryCheckState> emit) async {
    final res = await _repo.getEmployees();

    res.fold(
      (err) {
        _log.logE('❌ getInventoryCountEmployees failed: $err');
        emit(state.copyWith(employees: const []));
      },
      (employees) {
        _log.logI(
          '✅ getInventoryCountEmployees success - total: ${employees.length}',
        );
        emit(state.copyWith(employees: employees));
      },
    );
  }

  /// Lưu từ khoá rồi lọc lại danh sách (lọc cục bộ, không gọi API).
  void _onSearch(Emitter<InventoryCheckState> emit, {required String keyword}) {
    emit(state.copyWith(searchKeyword: keyword.trim()));
  }

  /// Chọn nhân viên kiểm kê để lọc. `null` = không lọc theo nhân viên.
  void _onSelectEmployee(
    Emitter<InventoryCheckState> emit, {
    required int? employeeId,
  }) {
    emit(state.copyWith(employeeId: employeeId));
  }

  /// Lọc theo kho. `null` = tất cả kho.
  void _onChangeWarehouseFilter(
    Emitter<InventoryCheckState> emit, {
    required int? warehouseId,
  }) {
    emit(state.copyWith(warehouseId: warehouseId));
  }

  /// Đổi khoảng ngày lọc rồi tải lại danh sách.
  Future<void> _onChangeDateRange(
    Emitter<InventoryCheckState> emit, {
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

  /// Sinh mã đợt kiểm kê theo ngày đã chọn.
  Future<void> _onGenerateCode(
    Emitter<InventoryCheckState> emit, {
    required DateTime date,
  }) async {
    emit(state.copyWith(isGeneratingCode: true, message: null));

    final res = await _repo.generateCode(date: _formatApiDate(date));

    res.fold(
      (err) {
        _log.logE('❌ generateInventoryCountCode failed: $err');
        emit(
          state.copyWith(
            isGeneratingCode: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (code) {
        _log.logI('✅ generateInventoryCountCode success - code: $code');
        emit(
          state.copyWith(
            isGeneratingCode: false,
            status: BaseStateStatus.success,
            message: null,
            generatedCode: code,
          ),
        );
      },
    );
  }

  /// Lưu đợt kiểm kê mới.
  Future<void> _onSave(
    Emitter<InventoryCheckState> emit, {
    required InventoryCountSavePayload payload,
  }) async {
    emit(
      state.copyWith(
        isSaving: true,
        saveSuccess: false,
        message: null,
        status: BaseStateStatus.loading,
      ),
    );

    final res = await _repo.saveInventoryCount(payload: payload);

    res.fold(
      (err) {
        _log.logE('❌ saveInventoryCount failed: $err');
        emit(
          state.copyWith(
            isSaving: false,
            saveSuccess: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (result) {
        _log.logI('✅ saveInventoryCount success - id: ${result.id}');
        emit(
          state.copyWith(
            isSaving: false,
            saveSuccess: true,
            status: BaseStateStatus.success,
            message: null,
            savedResult: result,
          ),
        );
      },
    );
  }

  /// Lấy chi tiết một đợt kiểm kê (dùng để fill màn chỉnh sửa).
  Future<void> _onGetById(
    Emitter<InventoryCheckState> emit, {
    required int id,
  }) async {
    emit(
      state.copyWith(
        isLoadingDetail: true,
        message: null,
        detail: null,
        status: BaseStateStatus.loading,
      ),
    );

    final res = await _repo.getInventoryCountById(id: id);

    res.fold(
      (err) {
        _log.logE('❌ getInventoryCountById failed: $err');
        emit(
          state.copyWith(
            isLoadingDetail: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (detail) {
        _log.logI('✅ getInventoryCountById success - id: ${detail.id}');
        emit(
          state.copyWith(
            isLoadingDetail: false,
            status: BaseStateStatus.success,
            message: null,
            detail: detail,
          ),
        );
      },
    );
  }

  /// Xoá một đợt kiểm kê (kèm toàn bộ chi tiết kiểm kê liên quan).
  Future<void> _onDelete(
    Emitter<InventoryCheckState> emit, {
    required int id,
  }) async {
    emit(
      state.copyWith(
        isDeleting: true,
        deleteSuccess: false,
        deleteError: null,
      ),
    );

    final res = await _repo.deleteInventoryCount(id: id);

    res.fold(
      (err) {
        _log.logE('❌ deleteInventoryCount failed: $err');
        emit(
          state.copyWith(
            isDeleting: false,
            deleteSuccess: false,
            deleteError: err.getErrorMessage,
          ),
        );
      },
      (success) {
        _log.logI('✅ deleteInventoryCount success - id: $id');
        emit(
          state.copyWith(
            isDeleting: false,
            deleteSuccess: success,
            deleteError: null,
          ),
        );
      },
    );
  }

  /// Format ngày theo `yyyy-MM-dd` đúng format API `get-all` yêu cầu.
  String _formatApiDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
}
