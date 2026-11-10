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
        fetchSheet: (countId) => _onFetchSheet(emit, countId: countId),
        searchSheet: (keyword) async => _onSearchSheet(emit, keyword: keyword),
        filterSheet: (filter) async => _onFilterSheet(emit, filter: filter),
        fetchProductGroupsRtc: (warehouseId, warehouseType) =>
            _onFetchProductGroupsRtc(
              emit,
              warehouseId: warehouseId,
              warehouseType: warehouseType,
            ),
        filterSheetProductGroup: (groupId) async =>
            _onFilterSheetProductGroup(emit, groupId: groupId),
        saveCountDetails: (countId, changedItems) =>
            _onSaveCountDetails(emit, countId: countId, changedItems: changedItems),
        findCountByCode: (code) => _onFindCountByCode(emit, code: code),
        clearScanCountResult: () => _onClearScanCountResult(emit),
        startSheetScan: (mode) => _onStartSheetScan(emit, mode: mode),
        sheetScanned: (code) => _onSheetScanned(emit, code: code),
        stopSheetScan: () => _onStopSheetScan(emit),
        confirmComplete: (id, isComplete) =>
            _onConfirmComplete(emit, id: id, isComplete: isComplete),
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
      state.copyWith(isDeleting: true, deleteSuccess: false, deleteError: null),
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

    // Cờ thành công chỉ dùng để báo 1 lần → reset sau khi đã gán.
    emit(state.copyWith(deleteSuccess: false));
  }

  /// Lấy phiếu kiểm kê kèm danh sách sản phẩm đã kiểm kê.
  Future<void> _onFetchSheet(
    Emitter<InventoryCheckState> emit, {
    required int countId,
  }) async {
    emit(
      state.copyWith(
        isLoadingSheet: true,
        sheet: null,
        sheetKeyword: '',
        sheetFilter: null,
      ),
    );

    final res = await _repo.getInventoryCountSheet(countId: countId);

    res.fold(
      (err) {
        _log.logE('❌ getInventoryCountSheet failed: $err');
        emit(state.copyWith(isLoadingSheet: false));
      },
      (sheet) {
        _log.logI(
          '✅ getInventoryCountSheet success - items: ${sheet.items.length}',
        );
        emit(state.copyWith(isLoadingSheet: false, sheet: sheet));
      },
    );
  }

  /// Tìm kiếm trong danh sách sản phẩm của phiếu (lọc cục bộ).
  void _onSearchSheet(
    Emitter<InventoryCheckState> emit, {
    required String keyword,
  }) {
    emit(state.copyWith(sheetKeyword: keyword.trim()));
  }

  /// Đổi bộ lọc sắp xếp danh sách sản phẩm của phiếu (lọc cục bộ).
  ///
  /// [filter] null = không lọc (hiển thị tất cả).
  void _onFilterSheet(
    Emitter<InventoryCheckState> emit, {
    required InventoryCheckSheetFilter? filter,
  }) {
    emit(state.copyWith(sheetFilter: filter));
  }

  /// Format ngày theo `yyyy-MM-dd` đúng format API `get-all` yêu cầu.
  String _formatApiDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  /// Lọc danh sách sản phẩm của phiếu theo nhóm sản phẩm (hãng).
  ///
  /// [groupId] null = không lọc theo nhóm sản phẩm.
  void _onFilterSheetProductGroup(
    Emitter<InventoryCheckState> emit, {
    required int? groupId,
  }) {
    emit(state.copyWith(sheetProductGroupId: groupId));
  }

  /// Tải nhóm sản phẩm RTC để bổ sung sản phẩm vào phiếu kiểm kê.
  Future<void> _onFetchProductGroupsRtc(
    Emitter<InventoryCheckState> emit, {
    required int warehouseId,
    required int warehouseType,
  }) async {
    emit(state.copyWith(isLoadingProductGroupsRtc: true));

    final res = await _repo.getProductGroupRtcNew(
      warehouseId: warehouseId,
      warehouseType: warehouseType,
    );

    res.fold(
      (err) {
        _log.logE('❌ getProductGroupRtcNew failed: $err');
        emit(
          state.copyWith(
            isLoadingProductGroupsRtc: false,
            productGroupsRtcWarehouseId: warehouseId,
            message: err.getErrorMessage,
          ),
        );
      },
      (groups) {
        _log.logI(
          '✅ getProductGroupRtcNew success - total: ${groups.length}',
        );
        emit(
          state.copyWith(
            isLoadingProductGroupsRtc: false,
            productGroupsRtc: groups,
            productGroupsRtcWarehouseId: warehouseId,
          ),
        );
      },
    );
  }

  /// Lưu kết quả kiểm kê thực tế cho các dòng sản phẩm trong phiếu.
  Future<void> _onSaveCountDetails(
    Emitter<InventoryCheckState> emit, {
    required int countId,
    required List<Map<String, dynamic>> changedItems,
  }) async {
    // Reset trạng thái lần trước để listener luôn nhận thông báo mới.
    emit(
      state.copyWith(
        saveCountDetailsSuccess: false,
        status: BaseStateStatus.success,
        message: null,
      ),
    );

    final res = await _repo.saveCountDetails(
      countId: countId,
      changedItems: changedItems,
    );

    var succeeded = false;

    res.fold(
      (err) {
        _log.logE('❌ saveCountDetails failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (success) {
        _log.logI('✅ saveCountDetails success - count: ${changedItems.length}');
        succeeded = success;
        emit(
          state.copyWith(
            saveCountDetailsSuccess: true,
            status: BaseStateStatus.success,
            message: null,
          ),
        );
      },
    );

    if (!succeeded) return;

    // Cờ thành công chỉ dùng để báo 1 lần → reset sau khi đã gán.
    emit(state.copyWith(saveCountDetailsSuccess: false));

    // Tải lại phiếu để cập nhật số lượng thực tế và chênh lệch.
    await _onFetchSheet(emit, countId: countId);
  }

  /// Tìm đợt kiểm kê theo mã đợt vừa quét (barcode/QR in trên phiếu).
  ///
  /// Ưu tiên tìm trong danh sách đợt đang hiển thị; nếu không có (đợt nằm
  /// ngoài khoảng ngày đang lọc) thì tải danh sách rộng hơn để tìm lại.
  Future<void> _onFindCountByCode(
    Emitter<InventoryCheckState> emit, {
    required String code,
  }) async {
    final scannedCode = code.trim();
    if (scannedCode.isEmpty) return;

    final matched = _matchCountByCode(state.items, scannedCode);
    if (matched != null) {
      _log.logI('✅ findCountByCode success - code: $scannedCode');
      emit(state.copyWith(openedCountFromScan: matched, scanCountMessage: null));
      return;
    }

    // Đợt kiểm kê có thể nằm ngoài khoảng ngày đang lọc → tải rộng hơn.
    final res = await _repo.getInventoryCounts(
      dateStart: _formatApiDate(
        DateTime.now().subtract(const Duration(days: 365)),
      ),
      dateEnd: _formatApiDate(
        DateTime.now().add(const Duration(days: 365)),
      ),
    );

    res.fold(
      (err) {
        _log.logE('❌ findCountByCode failed: $err');
        emit(
          state.copyWith(
            openedCountFromScan: null,
            scanCountMessage: 'Không tìm thấy đợt kiểm kê với mã "$scannedCode"',
          ),
        );
      },
      (items) {
        final found = _matchCountByCode(items, scannedCode);
        if (found == null) {
          _log.logW('⚠️ findCountByCode not found - code: $scannedCode');
          emit(
            state.copyWith(
              openedCountFromScan: null,
              scanCountMessage:
                  'Không tìm thấy đợt kiểm kê với mã "$scannedCode"',
            ),
          );
          return;
        }
        _log.logI('✅ findCountByCode success - code: $scannedCode');
        emit(state.copyWith(openedCountFromScan: found, scanCountMessage: null));
      },
    );
  }

  /// Tìm đợt kiểm kê có mã đợt khớp chính xác [code] (không phân biệt hoa
  /// thường).
  InventoryCountItem? _matchCountByCode(
    List<InventoryCountItem> items,
    String code,
  ) {
    final target = code.toLowerCase();
    for (final item in items) {
      if ((item.code ?? '').trim().toLowerCase() == target) return item;
    }
    return null;
  }

  /// Xoá cờ đợt kiểm kê đã mở từ quét + thông báo quét.
  Future<void> _onClearScanCountResult(Emitter<InventoryCheckState> emit) async {
    emit(state.copyWith(openedCountFromScan: null, scanCountMessage: null));
  }

  /// Bật chế độ quét PDA trong phiếu kiểm kê, reset mã quét cũ.
  Future<void> _onStartSheetScan(
    Emitter<InventoryCheckState> emit, {
    required InventoryScanMode mode,
  }) async {
    emit(
      state.copyWith(
        sheetScanMode: mode,
        sheetScanCode: null,
        sheetScanCount: 0,
        sheetScanMessage: null,
      ),
    );
  }

  /// Xử lý mã vừa quét trong phiếu kiểm kê.
  ///
  /// Mã quét được dùng để lọc danh sách sản phẩm:
  /// - Chế độ sản phẩm → chỉ hiển thị đúng sản phẩm vừa quét.
  /// - Chế độ vị trí → hiển thị tất cả sản phẩm có cùng mã vị trí.
  Future<void> _onSheetScanned(
    Emitter<InventoryCheckState> emit, {
    required String code,
  }) async {
    final mode = state.sheetScanMode;
    if (mode == null) return;

    final scannedCode = code.trim();
    if (scannedCode.isEmpty) return;

    // Áp dụng mã quét rồi đếm số dòng khớp để báo kết quả cho người dùng.
    emit(
      state.copyWith(
        sheetScanCode: scannedCode,
        sheetScanCount: state.sheetScanCount + 1,
        sheetScanMessage: null,
      ),
    );

    final matched = state.visibleSheetItems.length;
    emit(
      state.copyWith(
        sheetScanMessage: matched == 0
            ? 'Không tìm thấy sản phẩm nào khớp mã "$scannedCode"'
            : mode == InventoryScanMode.product
            ? 'Tìm thấy $matched sản phẩm khớp mã "$scannedCode"'
            : 'Vị trí "$scannedCode" có $matched sản phẩm',
      ),
    );
  }

  /// Tắt chế độ quét PDA trong phiếu kiểm kê và bỏ lọc theo mã quét.
  Future<void> _onStopSheetScan(Emitter<InventoryCheckState> emit) async {
    emit(
      state.copyWith(
        sheetScanMode: null,
        sheetScanCode: null,
        sheetScanCount: 0,
        sheetScanMessage: null,
      ),
    );
  }

  /// Xác nhận hoàn thành / mở lại một đợt kiểm kê.
  ///
  /// [isComplete] = `true` → hoàn thành (cache số lượng tồn kho & mượn),
  /// `false` → mở lại (số lượng tính động theo dữ liệu kho hiện thời).
  Future<void> _onConfirmComplete(
    Emitter<InventoryCheckState> emit, {
    required int id,
    required bool isComplete,
  }) async {
    // Reset trạng thái lần trước để listener luôn nhận thông báo mới.
    emit(
      state.copyWith(
        confirmCompleteSuccess: false,
        confirmCompleteMessage: null,
        confirmCompleteError: null,
      ),
    );

    final res = await _repo.confirmComplete(id: id, isComplete: isComplete);

    var succeeded = false;

    res.fold(
      (err) {
        _log.logE('❌ confirmComplete failed: $err');
        emit(
          state.copyWith(
            confirmCompleteSuccess: false,
            confirmCompleteError: err.getErrorMessage,
          ),
        );
      },
      (detail) {
        _log.logI('✅ confirmComplete success - id: $id, isComplete: $isComplete');
        succeeded = true;
        emit(
          state.copyWith(
            confirmCompleteSuccess: true,
            confirmCompleteMessage: isComplete
                ? 'Xác nhận hoàn thành đợt kiểm kê thành công!'
                : 'Mở lại đợt kiểm kê thành công!',
            confirmCompleteError: null,
          ),
        );
      },
    );

    if (!succeeded) return;

    // Cờ thành công chỉ dùng để báo 1 lần → reset sau khi đã gán.
    emit(state.copyWith(confirmCompleteSuccess: false));
  }
}
