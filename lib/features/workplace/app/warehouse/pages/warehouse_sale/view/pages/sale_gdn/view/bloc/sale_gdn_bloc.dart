import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/repository/sale_gdn_repo.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/repository/sale_gdn_repository.dart';

part 'sale_gdn_event.dart';
part 'sale_gdn_state.dart';
part 'sale_gdn_detail_state.dart';
part 'sale_gdn_bloc.g.dart';
part 'sale_gdn_bloc.freezed.dart';

const _maxErrorLength = 200;

extension _BaseErrorExt on BaseError {
  String get truncatedMsg {
    return when(
      httpInternalServerError: (body) =>
          body.length > _maxErrorLength
              ? '${body.substring(0, _maxErrorLength)}...'
              : body,
      httpUnAuthorizedError: () => 'Unauthorized',
      httpUnknownError: (m) =>
          m.length > _maxErrorLength
              ? '${m.substring(0, _maxErrorLength)}...'
              : m,
    );
  }
}

@injectable
class SaleGdnBloc extends BaseBloc<SaleGdnEvent, SaleGdnState> {
  final SaleGdnRepo _repo;
  final LogUtils _log;

  SaleGdnBloc(this._repo, this._log) : super(SaleGdnState.init()) {
    on<SaleGdnEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        fetchGdns: () => _fetchGdns(emit),
        searchByKeyword: (keyword) => _searchByKeyword(emit, keyword),
        searchByVoucherNumber: (voucherNumber) =>
            _searchByVoucherNumber(emit, voucherNumber),
        clearSearch: () => _clearSearch(emit),
        scanQrToDetail: (code) => _scanQrToDetail(emit, code),
        clearOpenedDetail: () => _clearOpenedDetail(emit),
        clearScanResultMessage: () => _clearScanResultMessage(emit),
        fetchWarehouseTypes: () => _fetchWarehouseTypes(emit),
        filterByWarehouseType: (warehouseTypeId) =>
            _filterByWarehouseType(emit, warehouseTypeId),
        filterByStatus: (status) => _filterByStatus(emit, status),
        clearFilters: () => _clearFilters(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _changeDateRange(emit, dateStart, dateEnd),
        initDetail: (id, bill) => _onInitDetail(emit, id: id, bill: bill),
        setWarehouseCode: (code) {
          _onSetWarehouseCode(emit, code);
          // Trả về Future<void> để khớp await event.when() yêu cầu.
          return Future<void>.value();
        },
        addImages: (stt, paths) => _onAddImages(emit, stt, paths),
        markImageToDelete: (fileId, localPath) =>
            _onMarkImageToDelete(emit, fileId: fileId, localPath: localPath),
        markImagesToDeleteBulk: (fileIds, localPaths) =>
            _onMarkImagesToDeleteBulk(
              emit,
              fileIds: fileIds,
              localPaths: localPaths,
            ),
        unmarkImageToDelete: (fileId, localPath) =>
            _onUnmarkImageToDelete(emit, fileId: fileId, localPath: localPath),
        submitImages: () => _onSubmitImages(emit),
        clearUploadStatus: () => _onClearUploadStatus(emit),
        fetchLookupData: () => _fetchLookupData(emit),
        prefetchLookupData: () => _prefetchLookupData(emit),
        fetchUsers: () => _fetchLookupData(emit),
        selectSupplier: (id) => _selectSupplier(emit, id),
        selectSender: (id) => _selectSender(emit, id),
        selectReceiver: (id) => _selectReceiver(emit, id),
        selectBorrower: (id) => _selectBorrower(emit, id),
        selectCustomer: (id) => _selectCustomer(emit, id),
        selectWarehouse: (id) => _selectWarehouse(emit, id),
        selectKhoType: (id) => _selectKhoType(emit, id),
        selectStatus: (id) => _selectStatus(emit, id),
        selectProject: (id) => _selectProject(emit, id),
        changeDeliveryDate: (date) => _changeDeliveryDate(emit, date),
        changeRequestDate: (date) => _changeRequestDate(emit, date),
        changeReceiveTime: (time) => _changeReceiveTime(emit, time),
        selectLoaiKho: (text) => _selectLoaiKho(emit, text),
        selectProductType: (id) => _selectProductType(emit, id),
        selectCustomerWithAddress: (id, address) =>
            _selectCustomerWithAddress(emit, id, address),
        toggleTransferInternal: (value) =>
            _toggleTransferInternal(emit, value),
        toggleInternal: (value) => _toggleInternal(emit, value),
        selectInternalWarehouse: (id) =>
            _selectInternalWarehouse(emit, id),
        selectInternalKhoType: (id) => _selectInternalKhoType(emit, id),
        changeDeliveryAddress: (address) =>
            _changeDeliveryAddress(emit, address),
        selectNcc: (id) => _selectNcc(emit, id),
        fetchAddressStockByCustomer: (customerId) =>
            _fetchAddressStockByCustomer(emit, customerId),
      );
    });
  }

  Future<void> _onClearUploadStatus(Emitter<SaleGdnState> emit) async {
    final current = state.detail;
    if (current == null) return;
    emit(state.copyWith(
      detail: current.copyWith(uploadStatus: BaseStateStatus.init),
    ));
  }

  /// KhoType mặc định theo yêu cầu.
  static const String _defaultKhoType =
      '4,5,13,14,15,48,53,55,56,57,70,73,74,75,76,77,78,79,80,83,84,85';

  String get _dateStartString {
    final s = state.dateStart ?? DateTime.now();
    final start = DateTime(s.year, s.month, s.day);
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(start);
  }

  String get _dateEndString {
    final e = state.dateEnd ?? DateTime.now();
    final end = DateTime(e.year, e.month, e.day, 23, 59, 59);
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(end);
  }

  Map<String, dynamic> _buildPayload({String filterText = ''}) {
    return {
      'DateEnd': '$_dateEndString.999+07:00',
      'DateStart': '$_dateStartString.000+07:00',
      'FilterText': filterText,
      'KhoType': state.selectedWarehouseTypeIds.isEmpty
          ? _defaultKhoType
          : state.selectedWarehouseTypeIds.join(','),
      'PageNumber': 1,
      'PageSize': 99999999,
      'Status': state.selectedStatus,
      'WarehouseCode': state.warehouseCode,
      'checkedAll': false,
    };
  }


  Future<void> _onInit(Emitter<SaleGdnState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _repo.getBillExports(payload: _buildPayload());

    await res.fold(
      (l) async {
        _log.logE('❌ API failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.truncatedMsg,
        ));
      },
      (r) async {
        _log.logI('✅ API success - total: ${r.length}');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          gdns: r,
        ));
      },
    );
  }

  /// Cập nhật `warehouseCode` cho bloc (lấy từ màn chọn khu vực).
  /// Chỉ set state, không gọi API.
  /// Sau khi set, screen sẽ tự dispatch `init` để fetch lại danh sách theo kho mới.
  void _onSetWarehouseCode(Emitter<SaleGdnState> emit, String? code) {
    if (code == null || code.isEmpty) return;
    if (state.warehouseCode == code) return;
    emit(state.copyWith(warehouseCode: code));
  }

  Future<void> _fetchGdns(Emitter<SaleGdnState> emit) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      isSearching: false,
      searchKeyword: '',
    ));

    final res = await _repo.getBillExports(payload: _buildPayload());

    await res.fold(
      (l) async {
        _log.logE('❌ API failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.truncatedMsg,
        ));
      },
      (r) async {
        _log.logI('✅ API success - total: ${r.length}');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          gdns: r,
        ));
      },
    );
  }

  Future<void> _searchByKeyword(
      Emitter<SaleGdnState> emit, String keyword) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      isSearching: true,
    ));

    final res = await _repo.getBillExports(
        payload: _buildPayload(filterText: keyword));

    await res.fold(
      (l) async {
        _log.logE('❌ API failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.truncatedMsg,
        ));
      },
      (r) async {
        _log.logI('✅ API success - total: ${r.length}');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          gdns: r,
          searchKeyword: keyword,
          isSearching: false,
        ));
      },
    );
  }

  Future<void> _searchByVoucherNumber(
      Emitter<SaleGdnState> emit, String voucherNumber) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      isSearching: true,
    ));

    final res = await _repo.getBillExports(
        payload: _buildPayload(filterText: voucherNumber));

    await res.fold(
      (l) async {
        _log.logE('❌ API failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.truncatedMsg,
        ));
      },
      (r) async {
        _log.logI('✅ API success - total: ${r.length}');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          gdns: r,
          searchKeyword: voucherNumber,
          isSearching: false,
        ));
      },
    );
  }

  Future<void> _clearSearch(Emitter<SaleGdnState> emit) async {
    emit(state.copyWith(searchKeyword: '', isSearching: false));
    await _fetchGdns(emit);
  }

  /// Quét QR/Barcode với code là chuỗi → tìm phiếu để mở trang Detail.
///
/// Tối ưu:
/// 1. Trước tiên dò trong danh sách hiện tại (`state.gdns`) theo `code` —
///    nếu khớp đúng 1 phiếu thì emit `openedDetailBill` luôn (0 RTT).
/// 2. Nếu không có trong list hiện tại → gọi API `getBillExports` với
///    `FilterText` để tìm kiếm trên server (cache cũ cũng dùng payload này,
///    nhưng gọi riêng không đồng thời với refresh nào khác).
Future<void> _scanQrToDetail(
    Emitter<SaleGdnState> emit, String code) async {
  final trimmed = code.trim();
  if (trimmed.isEmpty) return;

  // Bước 1: dò nhanh trong list hiện tại trước (không phát spinner toàn list).
  final local = _findGdnInList(trimmed);
  if (local != null) {
    emit(state.copyWith(
      status: BaseStateStatus.success,
      openedDetailBill: local,
    ));
    return;
  }

  // Bước 2: fallback — search trên server.
  emit(state.copyWith(
    status: BaseStateStatus.loading,
    isSearching: true,
    openedDetailBill: null,
    scanResultMessage: null,
  ));

  final res =
      await _repo.getBillExports(payload: _buildPayload(filterText: trimmed));

  await res.fold(
    (l) async {
      _log.logE('❌ scanQrToDetail failed: $l');
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: l.truncatedMsg,
        isSearching: false,
      ));
    },
    (r) async {
      _log.logI('✅ scanQrToDetail - total: ${r.length}');
      if (r.length == 1 && r.first.id != null && r.first.id! > 0) {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          gdns: r,
          searchKeyword: trimmed,
          isSearching: false,
          openedDetailBill: r.first,
        ));
      } else if (r.isEmpty) {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          gdns: r,
          searchKeyword: trimmed,
          isSearching: false,
          scanResultMessage: 'Không tìm thấy phiếu với mã "$trimmed"',
        ));
      } else {
        emit(state.copyWith(
          status: BaseStateStatus.success,
          gdns: r,
          searchKeyword: trimmed,
          isSearching: false,
          scanResultMessage:
              'Có ${r.length} phiếu trùng mã "$trimmed", vui lòng dùng tìm kiếm',
        ));
      }
    },
  );
}

/// Tìm phiếu trong `state.gdns` theo `code` (so khớp chính xác sau khi trim).
/// Trả về phần tử đầu tiên khớp. Chuỗi là 1 phiếu duy nhất cho QR/Barcode.
BillExporResponse? _findGdnInList(String code) {
  final candidates =
      state.gdns.where((b) => (b.code ?? '').trim() == code).toList();
  if (candidates.isEmpty) return null;
  final valid = candidates
      .where((b) => b.id != null && b.id! > 0)
      .toList();
  return valid.isNotEmpty ? valid.first : null;
}

  /// Reset cờ one-shot `openedDetailBill` sau khi UI đã mở trang Detail.
  Future<void> _clearOpenedDetail(Emitter<SaleGdnState> emit) async {
    emit(state.copyWith(openedDetailBill: null));
  }

  /// Reset cờ one-shot `scanResultMessage` sau khi UI đã hiển thị snackbar.
  Future<void> _clearScanResultMessage(Emitter<SaleGdnState> emit) async {
    emit(state.copyWith(scanResultMessage: null));
  }

  Future<void> _fetchWarehouseTypes(Emitter<SaleGdnState> emit) async {
    final res = await _repo.getProductGroups(
      isAdmin: false,
      departmentId: 24,
    );

    await res.fold(
      (l) async {
        _log.logE('❌ getProductGroups failed: $l');
      },
      (r) async {
        _log.logI('✅ getProductGroups success - total: ${r.length}');
        emit(state.copyWith(warehouseTypes: r));
      },
    );
  }

  /// Pre-fetch all lookup data (suppliers, senders, customers, projects,
  /// warehouses, productGroups, users) and save to SharedPreferences cache.
  /// This is called from sale_gdn_screen.dart so that when user opens
  /// detail_screen, the data is already available without additional API calls.
  Future<void> _prefetchLookupData(Emitter<SaleGdnState> emit) async {
    _log.logI('📡 Pre-fetching SaleGdn lookup data...');

    final suppliersRes = await _repo.getSuppliers();
    final sendersRes = await _repo.getSenders();
    final customersRes = await _repo.getCustomers();
    final projectsRes = await _repo.getAllProjects();
    final warehousesRes = await _repo.getWarehouses();
    final productGroupsRes = await _repo.getProductGroupNew(
      warehouseId: 1,
      isDeleted: false,
      isVisible: true,
    );
    final usersRes = await _repo.getBillExportUsers();

    final suppliers = suppliersRes.fold((_) => <SupplierResponse>[], (r) => r);
    final senders = sendersRes.fold((_) => <SenderResponse>[], (r) => r);
    final customers = customersRes.fold((_) => <CustomerResponse>[], (r) => r);
    final projects = projectsRes.fold((_) => <ProjectGDNResponse>[], (r) => r);
    final warehouses = warehousesRes.fold((_) => <WarehouseResponse>[], (r) => r);
    final productGroups = productGroupsRes.fold(
        (_) => <ProductGroupNewResponse>[], (r) => r);
    final users = usersRes.fold((_) => <BillExportUserResponse>[], (r) => r);

    _log.logI(
        '✅ Pre-fetch complete: '
        '${suppliers.length} suppliers, ${senders.length} senders, '
        '${customers.length} customers, ${projects.length} projects, '
        '${warehouses.length} warehouses, ${productGroups.length} productGroups, '
        '${users.length} users');

    // Save to SharedPreferences cache for persistence across app sessions
    // ignore: invalid_use_of_visible_for_testing_member
    await SaleGdnRepository.saveLookupCache(
      suppliers: suppliers,
      senders: senders,
      customers: customers,
      projects: projects,
      warehouses: warehouses,
      productGroups: productGroups,
      users: users,
      log: _log,
    );

    // Also emit to state for current session (so detail screen can use them)
    if (!emit.isDone) {
      emit(state.copyWith(
        suppliers: suppliers,
        senders: senders,
        customers: customers,
        projects: projects,
        warehouses: warehouses,
        productGroups: productGroups,
        users: users,
      ));
    }
  }

  Future<void> _filterByWarehouseType(
      Emitter<SaleGdnState> emit, List<int> warehouseTypeIds) async {
    emit(state.copyWith(selectedWarehouseTypeIds: warehouseTypeIds));
    await _fetchGdns(emit);
  }

  Future<void> _filterByStatus(Emitter<SaleGdnState> emit, int status) async {
    emit(state.copyWith(selectedStatus: status));
    await _fetchGdns(emit);
  }

  Future<void> _clearFilters(Emitter<SaleGdnState> emit) async {
    emit(state.copyWith(
      selectedWarehouseTypeIds: [],
      selectedStatus: -1,
    ));
    await _fetchGdns(emit);
  }

  /// Cập nhật khoảng thời gian lọc và fetch lại danh sách phiếu xuất.
  Future<void> _changeDateRange(
    Emitter<SaleGdnState> emit,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(
      dateEnd.year,
      dateEnd.month,
      dateEnd.day,
      23,
      59,
      59,
      999,
    );
    emit(state.copyWith(dateStart: start, dateEnd: end));
    await _fetchGdns(emit);
  }

  Future<void> _onInitDetail(
    Emitter<SaleGdnState> emit, {
    required int id,
    BillExporResponse? bill,
  }) async {
    if (id <= 0) return;

    emit(state.copyWith(detail: GdnDetailState.init(id: id, bill: bill)));

    // Bước 1+2+3: Fire song song 3 API chính + lookup data.
    // Lookup chạy nền (Future) — sẽ được await ở cuối cùng cùng với detail.
    // Việc chạy song song giúp NCC/senders/customers/... sẵn sàng cho bottomSheet
    // ngay khi user mở form, thay vì phải đợi xong cả vòng file-fetch ở bước 3.
    final viewFuture = _repo.getViewExportDetail(id: id);
    final headerFuture = _repo.getBillExportById(id: id);
    final detailFuture = _repo.getBillExportDetail(id: id);
    final lookupFuture = _loadLookupDataOnly();

    // Đợi API view trước (nhanh nhất) → hiển thị skeleton detail items.
    final viewRes = await viewFuture;

    await viewRes.fold(
      (l) async {
        _log.logE('❌ getViewExportDetail failed: $l');
        final current = state.detail;
        if (current == null) return;
        emit(state.copyWith(
          detail: current.copyWith(
            status: BaseStateStatus.failed,
            message: l.truncatedMsg,
          ),
        ));
      },
      (viewData) async {
        _log.logI('✅ getViewExportDetail success - total: ${viewData.length}');
        final current = state.detail;
        if (current == null) return;

        // Hiển thị view data trước
        emit(state.copyWith(
          detail: current.copyWith(
            status: BaseStateStatus.loading,
            details: viewData,
          ),
        ));

        // Bước 2: Gọi API header bill -> DetailGDNItemResponse để fill form
        final headerRes = await headerFuture;
        final billInfo = headerRes.fold(
          (l) {
            _log.logE('❌ getBillExportById failed: $l');
            return null;
          },
          (r) {
            _log.logI('✅ getBillExportById success');
            return r;
          },
        );
        if (billInfo != null) {
          final currentAfterHeader = state.detail;
          if (currentAfterHeader != null) {
            // Set đầy đủ các ID/text đang chọn theo billInfo để form hiển thị
            // đúng giá trị ban đầu từ server. Trước đây chỉ set 5 ID
            // (supplier/sender/customer/warehouse/khoType) — các field còn
            // lại (status, dates, internal warehouse, address, ...) bị null
            // và form phải dùng fallback billInfo, dẫn đến mismatch khi
            // state.copyWith ở bước 3 dùng reference cũ ghi đè mất.
            emit(state.copyWith(
              detail: currentAfterHeader.copyWith(
                billInfo: billInfo,
                selectedSupplierId: billInfo.supplierId,
                selectedSenderId: billInfo.senderId,
                selectedReceiverId: billInfo.receiverId,
                userId: billInfo.userId,
                selectedCustomerId: billInfo.customerId,
                selectedWarehouseId: billInfo.warehouseId,
                selectedKhoTypeId: billInfo.khoTypeId,
                selectedStatus: billInfo.status,
                selectedProductType: billInfo.productType,
                deliveryDate: billInfo.deliveryTime,
                requestDate: billInfo.requestDate,
                receiveTime: billInfo.deliveryTime,
                selectedLoaiKhoText: billInfo.warehouseType,
                selectedInternalWarehouseId: billInfo.wareHouseTranferId,
                selectedInternalKhoTypeId: billInfo.khoTypeTransferId,
                isTransferInternalChecked:
                    billInfo.isTransferInternal ?? false,
              ),
            ));
          }
        }

        // Bước 3: Gọi API detail -> DetailGDNResponse
        final detailRes = await detailFuture;

        await detailRes.fold(
          (l) async {
            _log.logE('❌ getBillExportDetail failed: $l');
            final current = state.detail;
            if (current == null) return;
            emit(state.copyWith(
              detail: current.copyWith(
                status: BaseStateStatus.failed,
                message: l.truncatedMsg,
              ),
            ));
          },
          (detailData) async {
            _log.logI('✅ getBillExportDetail success - total: ${detailData.length}');

            // Debug: log childId của từng item
            for (int i = 0; i < detailData.length; i++) {
              _log.logI('🔍 detailData[$i] childId=${detailData[i].childId} stt=${detailData[i].stt}');
            }

            // Bước 4: Gọi API files cho từng childId
            final serverImagesByChildId = <int, List<ReadFileResponse>>{};
            for (final detail in detailData) {
              final childId = detail.childId;
              if (childId == null || childId <= 0) {
                _log.logW('⚠️ childId is null or <= 0, skipping: $childId');
                continue;
              }

              _log.logI('📞 Calling getBillExportFiles for childId=$childId');
              final fileRes = await _repo.getBillExportFiles(
                billExportDetailId: childId,
              );

              await fileRes.fold(
                (l) async {
                  _log.logE('❌ getBillExportFiles failed for childId=$childId: $l');
                },
                (files) async {
                  _log.logI('✅ getBillExportFiles for childId=$childId: ${files.length} files');
                  print('files: ${files.length}');
                  if (files.isNotEmpty) {
                    serverImagesByChildId[childId] = files;
                  }
                },
              );
            }

            // Bước 5: Đợi lookup data (đã chạy song song từ đầu).
            final lookup = await lookupFuture;

            // QUAN TRỌNG: dùng `state.detail` (latest) thay vì `current`
            // (đã capture từ đầu handler). Trước đây code dùng `current` ở
            // đây → billInfo + selected IDs (set ở bước 2) bị mất, gây ra
            // "vào màn detail có dữ liệu rồi load xong API là mất hết".
            final latest = state.detail;
            if (latest == null) return;

            emit(state.copyWith(
              detail: latest.copyWith(
                status: BaseStateStatus.success,
                details: viewData,
                detailFull: detailData,
                serverImagesByChildId: serverImagesByChildId,
              ),
              suppliers: lookup.suppliers,
              senders: lookup.senders,
              customers: lookup.customers,
              projects: lookup.projects,
              warehouses: lookup.warehouses,
              productGroups: lookup.productGroups,
              users: lookup.users,
            ));

            // Load warehouseTypes cho form
            await _fetchWarehouseTypes(emit);
          },
        );
      },
    );
  }

  /// Helper: gọi 7 API lookup song song và trả về data (không emit).
  /// Dùng để chạy song song với các API detail ở `_onInitDetail` để NCC,
  /// người giao, KH, kho, ... sẵn sàng cho bottomSheet ngay khi form mount.
  /// Load lookup data: first check in-memory/SharedPreferences cache,
  /// if not available then call APIs. This ensures detail screen has data
  /// ready immediately if pre-fetch was called from sale_gdn_screen.
  Future<_LookupDataResult> _loadLookupDataOnly() async {
    // First, try to load from in-memory cache (populated by prefetchLookupData)
    if (SaleGdnRepository.isLookupCacheLoaded) {
      // Verify cache has data (not empty)
      if (SaleGdnRepository.suppliersSync.isNotEmpty) {
        _log.logI('✅ Using in-memory lookup cache (pre-fetched, ${SaleGdnRepository.suppliersSync.length} suppliers)');
        return _LookupDataResult(
          suppliers: SaleGdnRepository.suppliersSync,
          senders: SaleGdnRepository.sendersSync,
          customers: SaleGdnRepository.customersSync,
          projects: SaleGdnRepository.projectsSync,
          warehouses: SaleGdnRepository.warehousesSync,
          productGroups: SaleGdnRepository.productGroupsSync,
          users: SaleGdnRepository.usersSync,
        );
      }
      _log.logW('⚠️ Cache marked as loaded but data is empty, will refetch from API');
    }

    // Fallback: load from SharedPreferences cache
    final loaded = await SaleGdnRepository.loadLookupCacheToMemory(log: _log);
    if (loaded && SaleGdnRepository.suppliersSync.isNotEmpty) {
      _log.logI('✅ Loaded lookup data from SharedPreferences cache');
      return _LookupDataResult(
        suppliers: SaleGdnRepository.suppliersSync,
        senders: SaleGdnRepository.sendersSync,
        customers: SaleGdnRepository.customersSync,
        projects: SaleGdnRepository.projectsSync,
        warehouses: SaleGdnRepository.warehousesSync,
        productGroups: SaleGdnRepository.productGroupsSync,
        users: SaleGdnRepository.usersSync,
      );
    }

    // Cache miss or empty: call APIs
    _log.logI('⚠️ Cache miss, fetching lookup data from API...');
    final suppliersRes = await _repo.getSuppliers();
    final sendersRes = await _repo.getSenders();
    final customersRes = await _repo.getCustomers();
    final projectsRes = await _repo.getAllProjects();
    final warehousesRes = await _repo.getWarehouses();
    final productGroupsRes = await _repo.getProductGroupNew(
      warehouseId: 1,
      isDeleted: false,
      isVisible: true,
    );
    final usersRes = await _repo.getBillExportUsers();

    return _LookupDataResult(
      suppliers: _unwrapEither(suppliersRes),
      senders: _unwrapEither(sendersRes),
      customers: _unwrapEither(customersRes),
      projects: _unwrapEither(projectsRes),
      warehouses: _unwrapEither(warehousesRes),
      productGroups: _unwrapEither(productGroupsRes),
      users: _unwrapEither(usersRes),
    );
  }

  /// Unwrap `Either<BaseError, List<T>>` về `List<T>` (rỗng nếu lỗi).
  List<T> _unwrapEither<T>(Either<BaseError, List<T>> either) {
    return either.fold((_) => <T>[], (r) => r);
  }

  /// Thêm 1 hoặc nhiều ảnh local vào dòng chi tiết theo `stt`.
  /// Sau khi thêm, tự động gọi upload lên server.
  Future<void> _onAddImages(
    Emitter<SaleGdnState> emit,
    int stt,
    List<String> imagePaths,
  ) async {
    if (imagePaths.isEmpty) return;
    final current = state.detail;
    if (current == null) return;

    // Chống gọi trùng: nếu đang submit thì bỏ qua lời gọi add mới
    // (cũng chính là submit ngay) để tránh duplicate save-data.
    if (current.uploadStatus == BaseStateStatus.loading) return;

    final existing = current.localImagePathsByStt[stt] ?? [];
    final updated = Map<int, List<String>>.from(current.localImagePathsByStt);
    updated[stt] = [...existing, ...imagePaths];
    emit(state.copyWith(
      detail: current.copyWith(localImagePathsByStt: updated),
    ));

    // Tự động upload sau khi thêm ảnh
    await _onSubmitImages(emit);
  }

  /// Đánh dấu 1 ảnh cần xoá (chưa gọi API).
  /// - Ảnh server: truyền `fileId` (sẽ gửi lên server qua `DeletedFileIds` khi submit).
  /// - Ảnh local: truyền `localPath` (sẽ bị loại khỏi upload và remove khỏi state khi submit).
  /// Ảnh đã đánh dấu sẽ hiển thị overlay "đã xoá" trên preview.
  _onMarkImageToDelete(
    Emitter<SaleGdnState> emit, {
    int? fileId,
    String? localPath,
  }) {
    final current = state.detail;
    if (current == null) return;
    if (fileId == null && localPath == null) return;

    final updatedFileIds = Set<int>.from(current.pendingDeletedFileIds);
    final updatedLocalPaths = Set<String>.from(current.pendingDeletedLocalPaths);

    if (fileId != null) {
      updatedFileIds.add(fileId);
    }
    if (localPath != null) {
      updatedLocalPaths.add(localPath);
    }

    emit(state.copyWith(
      detail: current.copyWith(
        pendingDeletedFileIds: updatedFileIds,
        pendingDeletedLocalPaths: updatedLocalPaths,
      ),
    ));
  }

  /// Đánh dấu nhiều ảnh cần xoá trong 1 lần (chưa gọi API).
  /// Dùng cho flow xoá nhiều ảnh đã chọn từ bottomSheet.
  _onMarkImagesToDeleteBulk(
    Emitter<SaleGdnState> emit, {
    Set<int> fileIds = const <int>{},
    Set<String> localPaths = const <String>{},
  }) {
    final current = state.detail;
    if (current == null) return;
    if (fileIds.isEmpty && localPaths.isEmpty) return;

    final updatedFileIds = Set<int>.from(current.pendingDeletedFileIds)
      ..addAll(fileIds);
    final updatedLocalPaths = Set<String>.from(current.pendingDeletedLocalPaths)
      ..addAll(localPaths);

    emit(state.copyWith(
      detail: current.copyWith(
        pendingDeletedFileIds: updatedFileIds,
        pendingDeletedLocalPaths: updatedLocalPaths,
      ),
    ));
  }

  /// Bỏ đánh dấu xoá (khi user tap lại ảnh đã mark).
  _onUnmarkImageToDelete(
    Emitter<SaleGdnState> emit, {
    int? fileId,
    String? localPath,
  }) {
    final current = state.detail;
    if (current == null) return;
    if (fileId == null && localPath == null) return;

    final updatedFileIds = Set<int>.from(current.pendingDeletedFileIds);
    final updatedLocalPaths = Set<String>.from(current.pendingDeletedLocalPaths);

    if (fileId != null) {
      updatedFileIds.remove(fileId);
    }
    if (localPath != null) {
      updatedLocalPaths.remove(localPath);
    }

    emit(state.copyWith(
      detail: current.copyWith(
        pendingDeletedFileIds: updatedFileIds,
        pendingDeletedLocalPaths: updatedLocalPaths,
      ),
    ));
  }

  /// Upload ảnh local đã chọn lên server + apply các ảnh đã đánh dấu xoá.
  /// Sau khi upload thành công, build payload gán FileIds theo childId
  /// và gọi API /BillExport/save-data để lưu liên kết file + xoá file.
  Future<void> _onSubmitImages(Emitter<SaleGdnState> emit) async {
    final current = state.detail;
    if (current == null) return;

    // Chống gọi trùng: nếu đang submit thì bỏ qua để tránh duplicate
    // save-data khi event được dispatch nhiều lần liên tiếp.
    if (current.uploadStatus == BaseStateStatus.loading) return;

    final localFilesByStt = current.localImagePathsByStt;
    final pendingDeletedFileIds = current.pendingDeletedFileIds;
    final pendingDeletedLocalPaths = current.pendingDeletedLocalPaths;

    final hasLocalToUpload = localFilesByStt.values
        .any((paths) => paths.any((p) => !pendingDeletedLocalPaths.contains(p)));
    final hasDelete = pendingDeletedFileIds.isNotEmpty ||
        pendingDeletedLocalPaths.isNotEmpty;

    // Không có gì để làm → bỏ qua.
    if (!hasLocalToUpload && !hasDelete) return;

    emit(state.copyWith(
      detail: current.copyWith(uploadStatus: BaseStateStatus.loading),
    ));

    // Bước 1: Upload các file local chưa bị đánh dấu xoá.
    final allFiles = <File>[];
    for (final paths in localFilesByStt.values) {
      for (final path in paths) {
        if (pendingDeletedLocalPaths.contains(path)) continue;
        allFiles.add(File(path));
      }
    }

    List<UploadFileResponse> uploadedFiles = const [];
    if (allFiles.isNotEmpty) {
      _log.logI('📤 Uploading ${allFiles.length} files');
      final uploadRes = await _repo.uploadBillExportFiles(files: allFiles);

      final uploadOk = await uploadRes.fold(
        (l) async {
          _log.logE('❌ upload failed: $l');
          return null;
        },
        (list) async => list,
      );

      if (uploadOk == null) {
        // Upload fail - emit failed
        final updated = state.detail;
        if (updated != null) {
          emit(state.copyWith(
            detail: updated.copyWith(
              uploadStatus: BaseStateStatus.failed,
              message: 'Upload ảnh thất bại',
            ),
          ));
        }
        return;
      }
      uploadedFiles = uploadOk;
      _log.logI('✅ upload success: ${uploadedFiles.length} files');
    }

    final updated = state.detail;
    if (updated == null) return;

    // Bước 2: Map fileID → childId
    // Flat order theo từng STT, từng file trong STT đó - trùng với allFiles.
    final sttToFileIds = <int, List<int>>{};
    var uploadIdx = 0;
    final sortedStts = localFilesByStt.keys.toList()..sort();
    for (final stt in sortedStts) {
      final paths = localFilesByStt[stt] ?? const <String>[];
      for (final path in paths) {
        if (pendingDeletedLocalPaths.contains(path)) continue;
        if (uploadIdx >= uploadedFiles.length) break;
        final fileId = uploadedFiles[uploadIdx].fileID;
        if (fileId > 0) {
          sttToFileIds.putIfAbsent(stt, () => []).add(fileId);
        }
        uploadIdx++;
      }
    }

    // Map stt → childId (1 stt có thể xuất hiện nhiều detail trùng stt nếu trùng STT)
    final sttToChildIds = <int, List<int>>{};
    for (final d in updated.detailFull) {
      final stt = d.stt;
      final childId = d.childId;
      if (stt == null || childId == null || childId <= 0) continue;
      sttToChildIds.putIfAbsent(stt, () => []).add(childId);
    }

    // Build map childId -> fileIds:
    //   - Server images hiện có (loại bỏ các fileId đã mark xoá).
    //   - FileIds mới upload từ local.
    final childIdToFileIds = <int, List<int>>{};
    for (final entry in sttToFileIds.entries) {
      final stt = entry.key;
      final uploadedIds = entry.value;
      final childIds = sttToChildIds[stt] ?? const <int>[];
      for (final childId in childIds) {
        childIdToFileIds[childId] = [
          ...(childIdToFileIds[childId] ?? const <int>[]),
          ...uploadedIds,
        ];
      }
    }

    // Bổ sung các fileIds server cũ CHƯA bị mark xoá cho mỗi childId
    // có liên kết ảnh server. Quan trọng: payload `FileIds` phải chứa
    // TẤT CẢ fileIds muốn giữ (server hiện tại + mới upload), nếu không
    // server sẽ xoá các ảnh không nằm trong `FileIds`.
    for (final childId in updated.serverImagesByChildId.keys) {
      final existing = updated.serverImagesByChildId[childId] ?? [];
      final keptIds = existing
          .map((f) => f.id)
          .whereType<int>()
          .where((id) => !updated.pendingDeletedFileIds.contains(id))
          .toList();
      if (keptIds.isEmpty) continue;
      final merged = [
        ...(childIdToFileIds[childId] ?? const <int>[]),
        ...keptIds,
      ];
      childIdToFileIds[childId] = merged;
    }

    // Bước 3: Build payload save-data (kèm deletedFileIds)
    final payload = _buildSaveBillExportDataPayload(
      bill: updated.bill,
      billInfoUpdated: updated,
      detailFull: updated.detailFull,
      childIdToFileIds: childIdToFileIds,
      deletedFileIds: updated.pendingDeletedFileIds.toList(),
    );

    _log.logI('📤 Calling saveBillExportData...');
    final saveRes = await _repo.saveBillExportData(payload: payload);

    await saveRes.fold(
      (l) async {
        _log.logE('❌ saveBillExportData failed: $l');
        emit(state.copyWith(
          detail: updated.copyWith(
            uploadStatus: BaseStateStatus.failed,
            message: l.truncatedMsg,
          ),
        ));
      },
      (saveResult) async {
        final billExportId = saveResult.billExportId;
        _log.logI('✅ saveBillExportData success: BillExportID=$billExportId');

        // Bước 4: Merge ảnh server mới upload + xoá ảnh đã mark.
        final mergedServerImages =
            Map<int, List<ReadFileResponse>>.from(updated.serverImagesByChildId);

        // Remove ảnh server đã mark xoá.
        for (final childId in mergedServerImages.keys.toList()) {
          final list = mergedServerImages[childId] ?? [];
          final filtered = list
              .where((f) => !updated.pendingDeletedFileIds.contains(f.id))
              .toList();
          if (filtered.isEmpty) {
            mergedServerImages.remove(childId);
          } else {
            mergedServerImages[childId] = filtered;
          }
        }

        // Add ảnh server mới upload.
        for (final entry in childIdToFileIds.entries) {
          final childId = entry.key;
          final fileIds = entry.value;
          final newOnes = <ReadFileResponse>[];
          for (int i = 0; i < fileIds.length; i++) {
            final uploadedFile = uploadedFiles.firstWhere(
              (f) => f.fileID == fileIds[i],
              orElse: () => UploadFileResponse(
                fileID: fileIds[i],
                filePath: '',
                serverPath: '',
                fileName: '',
              ),
            );
            newOnes.add(ReadFileResponse(
              id: uploadedFile.fileID,
              originPath: uploadedFile.filePath,
              serverPath: uploadedFile.serverPath,
              fileName: uploadedFile.fileName,
            ));
          }
          mergedServerImages[childId] = [
            ...(mergedServerImages[childId] ?? []),
            ...newOnes,
          ];
        }

        // Remove ảnh local đã mark xoá khỏi localImagePathsByStt.
        final updatedLocalPaths =
            Map<int, List<String>>.from(updated.localImagePathsByStt);
        for (final stt in updatedLocalPaths.keys.toList()) {
          final list = updatedLocalPaths[stt] ?? [];
          final filtered = list
              .where((p) => !updated.pendingDeletedLocalPaths.contains(p))
              .toList();
          if (filtered.isEmpty) {
            updatedLocalPaths.remove(stt);
          } else {
            updatedLocalPaths[stt] = filtered;
          }
        }

        // Xác định message thành công dựa trên hành động đã thực hiện.
        final hasUpload = uploadedFiles.isNotEmpty;
        final hasDelete = updated.pendingDeletedFileIds.isNotEmpty ||
            updated.pendingDeletedLocalPaths.isNotEmpty;
        String successMessage;
        if (hasUpload && hasDelete) {
          successMessage = 'Upload & xoá ảnh thành công';
        } else if (hasDelete) {
          successMessage = 'Xoá ảnh thành công';
        } else {
          successMessage = 'Upload thành công';
        }

        emit(state.copyWith(
          detail: updated.copyWith(
            uploadStatus: billExportId != null && billExportId > 0
                ? BaseStateStatus.success
                : BaseStateStatus.failed,
            message: billExportId != null && billExportId > 0
                ? successMessage
                : 'Lưu ảnh thất bại',
            uploadedImages: uploadedFiles,
            localImagePathsByStt: updatedLocalPaths,
            serverImagesByChildId: mergedServerImages,
            pendingDeletedFileIds: const {},
            pendingDeletedLocalPaths: const {},
          ),
        ));
      },
    );
  }

  /// Build payload cho API /BillExport/save-data.
  Map<String, dynamic> _buildSaveBillExportDataPayload({
    required BillExporResponse? bill,
    required GdnDetailState billInfoUpdated,
    required List<DetailGDNResponse> detailFull,
    required Map<int, List<int>> childIdToFileIds,
    List<int> deletedFileIds = const [],
  }) {
    // Lấy trực tiếp từ state hiện tại để tránh stale data.
    final billInfo = billInfoUpdated.billInfo;
    final isTransferInternal =
        billInfoUpdated.isTransferInternalChecked || (billInfo?.isTransferInternal ?? false);
    final khoTypeTransferId = billInfoUpdated.selectedInternalKhoTypeId ??
        billInfo?.khoTypeTransferId;
    final wareHouseTranferId =
        billInfoUpdated.selectedInternalWarehouseId ?? bill?.wareHouseTranferId;

    // Khi phiếu ở trạng thái Mượn (0) hoặc Y/C mượn (7), field "Người mượn"
    // được map sang `ReceiverID` của BillExport. Ưu tiên giá trị user vừa
    // chọn (`selectedBorrowerId`); fallback sang `billInfo.userId`.
    final currentStatus =
        billInfoUpdated.selectedStatus ?? bill?.status;
    final isBorrowStatus = currentStatus == 0 || currentStatus == 7;
    final receiverId = isBorrowStatus
        ? (billInfoUpdated.selectedBorrowerId ?? billInfo?.userId ?? 0)
        : (billInfoUpdated.selectedReceiverId ??
            billInfo?.receiverId ??
            0);

    // BillExport header
    final billExport = <String, dynamic>{
      'ID': bill?.id,
      'Code': bill?.code,
      'TypeBill': bill?.typeBill,
      'SupplierID': bill?.supplierId ?? 0,
      'CustomerID': bill?.customerId ?? 0,
      'UserID': bill?.userId ?? 0,
      'SenderID': bill?.senderId ?? 0,
      'StockID': bill?.stockId ?? 0,
      'Description': bill?.description ?? '',
      'Address': bill?.address ?? '',
      'Status': bill?.status ?? 2,
      'GroupID': bill?.groupId ?? '',
      'WarehouseType': bill?.warehouseType ?? '',
      'KhoTypeID': bill?.khoTypeId ?? 0,
      'CreatDate': bill?.creatDate ?? DateTime.now().toIso8601String(),
      'CreatedDate': bill?.createdDate ?? DateTime.now().toIso8601String(),
      'UpdatedDate': DateTime.now().toIso8601String(),
      'ProductType': bill?.productType ?? 0,
      'AddressStockID': bill?.addressStockId ?? 0,
      'WarehouseID': bill?.warehouseId ?? 0,
      'RequestDate': bill?.requestDate ?? DateTime.now().toIso8601String(),
      'DeliveryTime': bill?.deliveryTime ?? DateTime.now().toIso8601String(),
      'IsAfterHours': bill?.isAfterHours ?? false,
      'BillDocumentExportType': bill?.billDocumentExportType ?? 0,
      'IsApproved': bill?.isApproved ?? false,
      'IsTransfer': bill?.isTransfer ?? false,
      'WareHouseTranferID': wareHouseTranferId,
      'IsTransferInternal': isTransferInternal,
      'KhoTypeTransferID': khoTypeTransferId,
      'ReceiverID': receiverId,
      'IsPrepared': bill?.isPrepared ?? false,
      'IsReceived': bill?.isReceived ?? false,
      'IsDeleted': false,
    };

    // Detail items
    final billExportDetail = <Map<String, dynamic>>[];
    for (final detail in detailFull) {
      final childId = detail.childId;
      final fileIds = childId != null ? (childIdToFileIds[childId] ?? []) : <int>[];

      billExportDetail.add({
        'ID': detail.id,
        'ProductID': detail.productId,
        'ProductName': detail.productName ?? '',
        'ProductCode': detail.productCode ?? '',
        'ProductNewCode': detail.productNewCode ?? '',
        'ProductFullName': detail.productFullName ?? '',
        'Qty': detail.qty ?? 0,
        'ProjectName': detail.projectName ?? '',
        'Note': detail.note ?? '',
        'STT': detail.stt ?? 0,
        'TotalQty': detail.totalQty ?? 0,
        'ProjectID': detail.projectId ?? 0,
        'ProductType': detail.productType ?? 0,
        'POKHID': detail.pokhId ?? 0,
        'GroupExport': detail.groupExport ?? '',
        'IsInvoice': detail.isInvoice ?? false,
        'InvoiceNumber': detail.invoiceNumber ?? '',
        'SerialNumber': detail.serialNumber ?? '',
        'ReturnedStatus': detail.returnedStatus ?? false,
        'ProjectPartListID': detail.projectPartListId ?? 0,
        'TradePriceDetailID': detail.tradePriceDetailId ?? 0,
        'POKHDetailID': detail.pokhDetailId ?? 0,
        'Specifications': detail.specifications ?? '',
        'BillImportDetailID': detail.billImportDetailId ?? 0,
        'TotalInventory': detail.totalInventory ?? 0,
        'ExpectReturnDate': detail.expectReturnDate?.toIso8601String(),
        'CustomerResponse': detail.customerResponse ?? '',
        'POKHDetailIDActual': detail.pokhDetailIdActual ?? 0,
        'PONumber': detail.poNumber ?? '',
        'ChosenInventoryProject': detail.chosenInventoryProject ?? '',
        'Unit': detail.unit ?? '',
        'UnitName': detail.unit ?? '',
        'ChildID': detail.childId,
        'ImportDetailID': 0,
        'ForceReallocate': false,
        'UnitPricePOKH': detail.unitPricePOKH ?? 0,
        'UnitPricePurchase': detail.unitPricePurchase ?? 0,
        'BillCode': detail.billCode ?? '',
        'FileIds': fileIds,
      });
    }

    return {
      'BillExport': billExport,
      'billExportDetail': billExportDetail,
      'DeletedDetailIds': <int>[],
      'DeletedFileIds': deletedFileIds,
    };
  }

  // ---------------------------------------------------------------------------
  // Lookup data for BillExport form
  // ---------------------------------------------------------------------------

  /// Fetch song song 6 danh sách lookup. Mỗi danh sách lỗi riêng thì bỏ qua
  /// nhưng vẫn trả về danh sách rỗng để form không bị trắng field.
  Future<void> _fetchLookupData(Emitter<SaleGdnState> emit) async {
    _log.logI('📡 Fetching BillExport lookup data...');
    final Either<BaseError, List<SupplierResponse>> suppliersRes =
        await _repo.getSuppliers();
    final Either<BaseError, List<SenderResponse>> sendersRes =
        await _repo.getSenders();
    final Either<BaseError, List<CustomerResponse>> customersRes =
        await _repo.getCustomers();
    final Either<BaseError, List<ProjectGDNResponse>> projectsRes =
        await _repo.getAllProjects();
    final Either<BaseError, List<WarehouseResponse>> warehousesRes =
        await _repo.getWarehouses();
    final Either<BaseError, List<ProductGroupNewResponse>> productGroupsRes =
        await _repo.getProductGroupNew(
      warehouseId: 1,
      isDeleted: false,
      isVisible: true,
    );
    final Either<BaseError, List<BillExportUserResponse>> usersRes =
        await _repo.getBillExportUsers();

    final List<SupplierResponse> suppliers = suppliersRes.fold(
      (_) => const <SupplierResponse>[],
      (r) => r,
    );
    final List<SenderResponse> senders = sendersRes.fold(
      (_) => const <SenderResponse>[],
      (r) => r,
    );
    final List<CustomerResponse> customers = customersRes.fold(
      (_) => const <CustomerResponse>[],
      (r) => r,
    );
    final List<ProjectGDNResponse> projects = projectsRes.fold(
      (_) => const <ProjectGDNResponse>[],
      (r) => r,
    );
    final List<WarehouseResponse> warehouses = warehousesRes.fold(
      (_) => const <WarehouseResponse>[],
      (r) => r,
    );
    final List<ProductGroupNewResponse> productGroups = productGroupsRes.fold(
      (_) => const <ProductGroupNewResponse>[],
      (r) => r,
    );
    final List<BillExportUserResponse> users = usersRes.fold(
      (_) => const <BillExportUserResponse>[],
      (r) => r,
    );

    _log.logI(
      '✅ Lookup data loaded: '
      'suppliers=${suppliers.length}, senders=${senders.length}, '
      'customers=${customers.length}, projects=${projects.length}, '
      'warehouses=${warehouses.length}, productGroups=${productGroups.length}, '
      'users=${users.length}',
    );

    // Guard: tránh "emit after handler completed" nếu emitter đã đóng
    // (ví dụ khi handler bị cancel giữa chừng do state mới).
    if (emit.isDone) return;

    emit(state.copyWith(
      suppliers: suppliers,
      senders: senders,
      customers: customers,
      projects: projects,
      warehouses: warehouses,
      productGroups: productGroups,
      users: users,
    ));

    // Load warehouseTypes cho form
    await _fetchWarehouseTypes(emit);
  }

  // ---------------------------------------------------------------------------
  // Lookup selection handlers — update selected ID trong detail state.
  // Khi ID thay đổi, UI sẽ tự re-lookup display text từ các list ở trên.
  // ---------------------------------------------------------------------------

  Future<void> _selectSupplier(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedSupplierId: id),
    ));
  }

  Future<void> _selectSender(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedSenderId: id),
    ));
  }

  Future<void> _selectReceiver(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedReceiverId: id),
    ));
  }

  Future<void> _selectBorrower(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedBorrowerId: id),
    ));
  }

  Future<void> _selectCustomer(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedCustomerId: id),
    ));
  }

  Future<void> _selectWarehouse(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedWarehouseId: id),
    ));
  }

  Future<void> _selectKhoType(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedKhoTypeId: id),
    ));
  }

  Future<void> _selectStatus(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedStatus: id),
    ));
  }

  Future<void> _selectProject(Emitter<SaleGdnState> emit, int? id) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedProjectId: id),
    ));
  }

  Future<void> _changeDeliveryDate(
      Emitter<SaleGdnState> emit, DateTime? date) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(deliveryDate: date),
    ));
  }

  Future<void> _changeRequestDate(
      Emitter<SaleGdnState> emit, DateTime? date) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(requestDate: date),
    ));
  }

  Future<void> _changeReceiveTime(
      Emitter<SaleGdnState> emit, DateTime? time) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(receiveTime: time),
    ));
  }

  Future<void> _selectLoaiKho(
      Emitter<SaleGdnState> emit, String? text) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedLoaiKhoText: text),
    ));
  }

  Future<void> _selectProductType(
      Emitter<SaleGdnState> emit, int? productType) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedProductType: productType),
    ));
  }

  Future<void> _selectCustomerWithAddress(
    Emitter<SaleGdnState> emit,
    int? customerId,
    String? address,
  ) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(
        selectedCustomerId: customerId,
        selectedCustomerAddress: address,
      ),
    ));
  }

  Future<void> _toggleTransferInternal(
      Emitter<SaleGdnState> emit, bool value) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    // Bỏ tick → clear kho chuyển để tránh data thừa.
    emit(state.copyWith(
      detail: current.copyWith(
        isTransferInternalChecked: value,
        selectedInternalWarehouseId:
            value ? current.selectedInternalWarehouseId : null,
      ),
    ));
  }

  Future<void> _toggleInternal(
      Emitter<SaleGdnState> emit, bool value) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    // Bỏ tick → clear loại kho chuyển để tránh data thừa.
    emit(state.copyWith(
      detail: current.copyWith(
        isInternalChecked: value,
        selectedInternalKhoTypeId:
            value ? current.selectedInternalKhoTypeId : null,
      ),
    ));
  }

  Future<void> _selectInternalWarehouse(
      Emitter<SaleGdnState> emit, int? warehouseId) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedInternalWarehouseId: warehouseId),
    ));
  }

  Future<void> _selectInternalKhoType(
      Emitter<SaleGdnState> emit, int? khoTypeId) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedInternalKhoTypeId: khoTypeId),
    ));
  }

  Future<void> _changeDeliveryAddress(
      Emitter<SaleGdnState> emit, String? address) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(deliveryAddress: address),
    ));
  }

  Future<void> _fetchAddressStockByCustomer(
    Emitter<SaleGdnState> emit,
    int customerId,
  ) async {
    _log.logI('📡 Fetching address stock for customerId: $customerId');
    final res = await _repo.getAddressStockByCustomerId(customerId: customerId);
    res.fold(
      (l) {
        _log.logE('❌ getAddressStockByCustomerId failed: $l');
        // Still emit empty list on error
        emit(state.copyWith(addressStocks: const []));
      },
      (r) {
        _log.logI('✅ getAddressStockByCustomerId success: ${r.length} addresses');
        emit(state.copyWith(addressStocks: r));
      },
    );
  }

  Future<void> _selectNcc(Emitter<SaleGdnState> emit, int? nccId) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedNccId: nccId),
    ));
  }
}

/// Kết quả lookup data (không phải state — chỉ bundle các list trả về từ
/// API lookup). Dùng nội bộ trong `_onInitDetail` để chạy song song với
/// detail API và emit cùng lúc khi tất cả hoàn tất.
class _LookupDataResult {
  const _LookupDataResult({
    required this.suppliers,
    required this.senders,
    required this.customers,
    required this.projects,
    required this.warehouses,
    required this.productGroups,
    required this.users,
  });

  final List<SupplierResponse> suppliers;
  final List<SenderResponse> senders;
  final List<CustomerResponse> customers;
  final List<ProjectGDNResponse> projects;
  final List<WarehouseResponse> warehouses;
  final List<ProductGroupNewResponse> productGroups;
  final List<BillExportUserResponse> users;
}
