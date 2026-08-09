import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/repository/sale_gdn_repo.dart';

part 'sale_gdn_event.dart';
part 'sale_gdn_state.dart';
part 'sale_gdn_detail_state.dart';
part 'sale_gdn_bloc.g.dart';
part 'sale_gdn_bloc.freezed.dart';

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
        addImages: (stt, paths) => _onAddImages(emit, stt, paths),
        removeImage: (stt, imageIndex, isLocal) =>
            _onRemoveImage(emit, stt, imageIndex, isLocal),
        submitImages: () => _onSubmitImages(emit),
        clearUploadStatus: () => _onClearUploadStatus(emit),
        fetchLookupData: () => _fetchLookupData(emit),
        selectSupplier: (id) => _selectSupplier(emit, id),
        selectSender: (id) => _selectSender(emit, id),
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
          message: l.getErrorMessage,
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
          message: l.getErrorMessage,
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
          message: l.getErrorMessage,
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
          message: l.getErrorMessage,
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
        message: l.getErrorMessage,
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

    // Bước 1: Gọi API view trước -> ViewGDNDetailResponse
    final viewRes = await _repo.getViewExportDetail(id: id);

    await viewRes.fold(
      (l) async {
        _log.logE('❌ getViewExportDetail failed: $l');
        final current = state.detail;
        if (current == null) return;
        emit(state.copyWith(
          detail: current.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
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
        // (chạy song song với step detail để không tăng latency).
        final headerRes = await _repo.getBillExportById(id: id);
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
            emit(state.copyWith(
              detail: currentAfterHeader.copyWith(
                billInfo: billInfo,
                // Khởi tạo ID đang chọn theo billInfo để form hiển thị
                // đúng giá trị ban đầu từ server.
                selectedSupplierId: billInfo.supplierId,
                selectedSenderId: billInfo.senderId,
                selectedCustomerId: billInfo.customerId,
                selectedWarehouseId: billInfo.warehouseId,
                selectedKhoTypeId: billInfo.khoTypeId,
              ),
            ));
          }

          // Bước 2.1: Fetch lookup data cho các dropdown trên form.
          // Dispatch event riêng để handler có vòng đời emitter riêng —
          // tránh "emit after handler completed" khi handler này emit sau
          // khi `_onInitDetail` đã kết thúc.
          add(SaleGdnEvent.fetchLookupData());
        }

        // Bước 3: Gọi API detail -> DetailGDNResponse
        final detailRes = await _repo.getBillExportDetail(id: id);

        await detailRes.fold(
          (l) async {
            _log.logE('❌ getBillExportDetail failed: $l');
            final current = state.detail;
            if (current == null) return;
            emit(state.copyWith(
              detail: current.copyWith(
                status: BaseStateStatus.failed,
                message: l.getErrorMessage,
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

            emit(state.copyWith(
              detail: current.copyWith(
                status: BaseStateStatus.success,
                details: viewData,
                detailFull: detailData,
                serverImagesByChildId: serverImagesByChildId,
              ),
            ));
          },
        );
      },
    );
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

    final existing = current.localImagePathsByStt[stt] ?? [];
    final updated = Map<int, List<String>>.from(current.localImagePathsByStt);
    updated[stt] = [...existing, ...imagePaths];
    emit(state.copyWith(
      detail: current.copyWith(localImagePathsByStt: updated),
    ));

    // Tự động upload sau khi thêm ảnh
    await _onSubmitImages(emit);
  }

  /// Xoá 1 ảnh khỏi dòng chi tiết theo `stt` và `imageIndex`.
  /// Nếu `isLocal=true` thì xoá local image, ngược lại xoá server image.
  Future<void> _onRemoveImage(
    Emitter<SaleGdnState> emit,
    int stt,
    int imageIndex,
    bool isLocal,
  ) async {
    final current = state.detail;
    if (current == null) return;

    if (isLocal) {
      // Xoá local image
      final existing = current.localImagePathsByStt[stt] ?? [];
      if (imageIndex >= existing.length) return;
      final updatedLocal = Map<int, List<String>>.from(current.localImagePathsByStt);
      final nextLocal = [...existing]..removeAt(imageIndex);
      updatedLocal[stt] = nextLocal;
      emit(state.copyWith(
        detail: current.copyWith(localImagePathsByStt: updatedLocal),
      ));
    } else {
      // Xoá server image - cần tìm childId từ stt
      final detailItem = current.detailFull.firstWhere(
        (d) => d.stt == stt,
        orElse: () => DetailGDNResponse(),
      );
      final childId = detailItem.childId;
      if (childId == null || childId <= 0) return;

      final serverImages = current.serverImagesByChildId[childId] ?? [];
      if (imageIndex >= serverImages.length) return;

      // Gọi API xoá file trên server
      final fileId = serverImages[imageIndex].id;
      if (fileId != null && fileId > 0) {
        final deleteRes = await _repo.deleteBillExportFile(fileId: fileId);
        await deleteRes.fold(
          (l) async {
            _log.logE('❌ deleteBillExportFile failed: $l');
          },
          (r) async {
            _log.logI('✅ deleteBillExportFile success');
          },
        );
      }

      // Cập nhật state sau khi xoá
      final updatedServer = Map<int, List<ReadFileResponse>>.from(current.serverImagesByChildId);
      final nextServer = [...serverImages]..removeAt(imageIndex);
      if (nextServer.isEmpty) {
        updatedServer.remove(childId);
      } else {
        updatedServer[childId] = nextServer;
      }
      emit(state.copyWith(
        detail: current.copyWith(serverImagesByChildId: updatedServer),
      ));
    }
  }

  /// Upload tất cả ảnh local đã chọn lên server.
  /// Sau khi upload thành công, build payload gán FileIds theo childId
  /// và gọi API /BillExport/save-data để lưu liên kết file.
  Future<void> _onSubmitImages(Emitter<SaleGdnState> emit) async {
    final current = state.detail;
    if (current == null) return;

    final localFilesByStt = current.localImagePathsByStt;
    if (localFilesByStt.isEmpty) return;

    emit(state.copyWith(
      detail: current.copyWith(uploadStatus: BaseStateStatus.loading),
    ));

    // Bước 1: Upload tất cả file
    final allFiles = <File>[];
    for (final paths in localFilesByStt.values) {
      for (final path in paths) {
        allFiles.add(File(path));
      }
    }
    if (allFiles.isEmpty) return;

    _log.logI('📤 Uploading ${allFiles.length} files');
    final uploadRes = await _repo.uploadBillExportFiles(files: allFiles);

    final updated = state.detail;
    if (updated == null) return;

    await uploadRes.fold(
      (l) async {
        _log.logE('❌ upload failed: $l');
        emit(state.copyWith(
          detail: updated.copyWith(
            uploadStatus: BaseStateStatus.failed,
            message: l.toString(),
          ),
        ));
      },
      (uploadedFiles) async {
        _log.logI('✅ upload success: ${uploadedFiles.length} files');

        // Bước 2: Map fileID → childId qua stt
        // uploadedFiles order trùng với localFilesByStt.entries order.
        final sttEntries = localFilesByStt.entries.toList();
        final childIdToFileIds = <int, List<int>>{};

        for (int i = 0; i < sttEntries.length; i++) {
          final stt = sttEntries[i].key;
          final detailItem = updated.detailFull.firstWhere(
            (d) => d.stt == stt,
            orElse: () => DetailGDNResponse(),
          );
          final childId = detailItem.childId;
          if (childId == null || childId <= 0) continue;

          // uploadedFiles[i] là file thứ i trong batch (trùng thứ tự với sttEntries[i])
          final fileId = uploadedFiles[i].fileID;
          if (fileId > 0) {
            childIdToFileIds.putIfAbsent(childId, () => []).add(fileId);
          }
        }

        // Bước 3: Build payload save-data
        final payload = _buildSaveBillExportDataPayload(
          bill: updated.bill,
          detailFull: updated.detailFull,
          childIdToFileIds: childIdToFileIds,
        );

        _log.logI('📤 Calling saveBillExportData...');
        final saveRes = await _repo.saveBillExportData(payload: payload);

        await saveRes.fold(
          (l) async {
            _log.logE('❌ saveBillExportData failed: $l');
            emit(state.copyWith(
              detail: updated.copyWith(
                uploadStatus: BaseStateStatus.failed,
                message: l.toString(),
              ),
            ));
          },
          (saveResult) async {
            final billExportId = saveResult.billExportId;
            _log.logI('✅ saveBillExportData success: BillExportID=$billExportId');

            // Merge ảnh server vào state
            final mergedServerImages =
                Map<int, List<ReadFileResponse>>.from(updated.serverImagesByChildId);
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

            emit(state.copyWith(
              detail: updated.copyWith(
                uploadStatus: billExportId != null && billExportId > 0
                    ? BaseStateStatus.success
                    : BaseStateStatus.failed,
                uploadedImages: uploadedFiles,
                localImagePathsByStt: {},
                serverImagesByChildId: mergedServerImages,
              ),
            ));
          },
        );
      },
    );
  }

  /// Build payload cho API /BillExport/save-data.
  Map<String, dynamic> _buildSaveBillExportDataPayload({
    required BillExporResponse? bill,
    required List<DetailGDNResponse> detailFull,
    required Map<int, List<int>> childIdToFileIds,
  }) {
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
      'WareHouseTranferID': bill?.wareHouseTranferId,
      'IsTransferInternal': true,
      'KhoTypeTransferID': bill?.khoTypeId ?? 0,
      'ReceiverID': 0,
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
        'ExpectReturnDate': null,
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
      'DeletedFileIds': <int>[],
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

    _log.logI(
      '✅ Lookup data loaded: '
      'suppliers=${suppliers.length}, senders=${senders.length}, '
      'customers=${customers.length}, projects=${projects.length}, '
      'warehouses=${warehouses.length}, productGroups=${productGroups.length}',
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
    ));
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

  Future<void> _selectNcc(Emitter<SaleGdnState> emit, int? nccId) async {
    final current = state.detail;
    if (current == null || emit.isDone) return;
    emit(state.copyWith(
      detail: current.copyWith(selectedNccId: nccId),
    ));
  }
}
