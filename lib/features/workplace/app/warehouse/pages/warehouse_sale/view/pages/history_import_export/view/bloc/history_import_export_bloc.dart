import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/common/logger/index.dart';

import '../../data/datasource/models/history_import_export_model.dart';
import '../../data/repository/history_import_export_repo.dart';

part 'history_import_export_event.dart';
part 'history_import_export_state.dart';
part 'history_import_export_bloc.freezed.dart';
part 'history_import_export_bloc.g.dart';

/// Bloc quản lý danh sách lịch sử nhập/xuất kho: tải dữ liệu theo khoảng
/// ngày + mã kho và tìm kiếm theo từ khoá.
@injectable
class HistoryImportExportBloc
    extends BaseBloc<HistoryImportExportEvent, HistoryImportExportState> {
  final HistoryImportExportRepo _repo;
  final LogUtils _log;

  HistoryImportExportBloc(this._repo, this._log)
    : super(HistoryImportExportState.init()) {
    on<HistoryImportExportEvent>((event, emit) async {
      await event.when(
        setWarehouseCode: (code) async => _onSetWarehouseCode(emit, code: code),
        fetch: () => _onFetch(emit),
        search: (keyword) => _onSearch(emit, keyword: keyword),
        clearSearch: () => _onSearch(emit, keyword: ''),
        changeTypeFilter: (filter) async =>
            emit(state.copyWith(typeFilter: filter)),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
      );
    });
  }

  /// Cập nhật mã kho (HN/HCM/BN) lấy từ màn chọn khu vực. Không gọi API.
  void _onSetWarehouseCode(
    Emitter<HistoryImportExportState> emit, {
    required String? code,
  }) {
    if (code == null || code.isEmpty || state.warehouseCode == code) return;
    emit(state.copyWith(warehouseCode: code));
  }

  /// Tải lại danh sách theo bộ lọc hiện tại (khoảng ngày + từ khoá + kho).
  Future<void> _onFetch(Emitter<HistoryImportExportState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _repo.getHistory(payload: _buildPayload());

    res.fold(
      (err) {
        _log.logE('❌ getHistoryImportExport failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (items) {
        _log.logI('✅ getHistoryImportExport success - total: ${items.length}');
        emit(state.copyWith(status: BaseStateStatus.success, items: items));
      },
    );
  }

  /// Lưu từ khoá rồi tải lại danh sách. Từ khoá rỗng = bỏ tìm kiếm.
  Future<void> _onSearch(
    Emitter<HistoryImportExportState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(searchKeyword: keyword.trim()));
    await _onFetch(emit);
  }

  /// Đổi khoảng ngày lọc (đầu ngày → cuối ngày) rồi tải lại danh sách.
  Future<void> _onChangeDateRange(
    Emitter<HistoryImportExportState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(
      state.copyWith(
        dateStart: DateTime(dateStart.year, dateStart.month, dateStart.day),
        dateEnd: DateTime(
          dateEnd.year,
          dateEnd.month,
          dateEnd.day,
          23,
          59,
          59,
          999,
        ),
      ),
    );
    await _onFetch(emit);
  }

  /// Build payload cho `POST /HistoryImportExport`.
  /// Ngày được format theo giờ Việt Nam (+07:00) như API yêu cầu.
  Map<String, dynamic> _buildPayload() {
    final fmt = DateFormat('yyyy-MM-ddTHH:mm:ss');
    final start = state.dateStart ?? DateTime.now();
    final end = state.dateEnd ?? DateTime.now();
    return {
      'Status': 0,
      'DateStart':
          '${fmt.format(DateTime(start.year, start.month, start.day))}.000+07:00',
      'DateEnd':
          '${fmt.format(DateTime(end.year, end.month, end.day, 23, 59, 59))}.999+07:00',
      'FilterText': state.searchKeyword,
      'PageNumber': 1,
      'PageSize': 1000000,
      'WarehouseCode': state.warehouseCode,
      'checkedAll': false,
    };
  }
}
