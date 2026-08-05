import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/index.dart';
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
      );
    });
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

        // Bước 2: Gọi API detail -> DetailGDNResponse
        final detailRes = await _repo.getBillExportDetail(id: id);

        await detailRes.fold(
          (l) async {
            _log.logE('❌ getBillExportDetail failed: $l');
          },
          (detailData) async {
            _log.logI('✅ getBillExportDetail success - total: ${detailData.length}');

            // Debug: log childId của từng item
            for (int i = 0; i < detailData.length; i++) {
              _log.logI('🔍 detailData[$i] childId=${detailData[i].childId} stt=${detailData[i].stt}');
            }

            // Bước 3: Gọi API files cho từng childId
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
  Future<void> _onSubmitImages(Emitter<SaleGdnState> emit) async {
    final current = state.detail;
    if (current == null) return;

    // Collect all local image paths from all detail items
    final allPaths = <String>[];
    for (final paths in current.localImagePathsByStt.values) {
      allPaths.addAll(paths);
    }

    if (allPaths.isEmpty) return;

    emit(state.copyWith(
      detail: current.copyWith(status: BaseStateStatus.loading),
    ));

    // Convert paths to File objects
    final files = allPaths.map((p) => File(p)).toList();

    final res = await _repo.uploadBillExportFiles(files: files);

    await res.fold(
      (l) async {
        _log.logE('❌ submitImages failed: $l');
        emit(state.copyWith(
          detail: current.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        ));
      },
      (r) async {
        _log.logI('✅ submitImages success - uploaded: ${r.length} files');
        emit(state.copyWith(
          detail: current.copyWith(
            status: BaseStateStatus.success,
            uploadedImages: r,
          ),
        ));
      },
    );
  }
}
