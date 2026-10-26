import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/common/logger/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/datasource/models/history_import_export_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/repository/history_import_export_repo.dart';

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
        setWarehouseCode: (code) {
          _onSetWarehouseCode(emit, code);
          return Future<void>.value();
        },
        fetch: () => _fetch(emit),
        search: (keyword) => _search(emit, keyword),
        clearSearch: () => _search(emit, ''),
        changeTypeFilter: (filter) {
          emit(state.copyWith(typeFilter: filter));
          return Future<void>.value();
        },
        changeDateRange: (dateStart, dateEnd) =>
            _changeDateRange(emit, dateStart, dateEnd),
      );
    });
  }

  /// Cập nhật mã kho (HN/HCM/BN) lấy từ màn chọn khu vực. Không gọi API.
  void _onSetWarehouseCode(
    Emitter<HistoryImportExportState> emit,
    String? code,
  ) {
    if (code == null || code.isEmpty || state.warehouseCode == code) return;
    emit(state.copyWith(warehouseCode: code));
  }

  /// Tải lại danh sách theo bộ lọc hiện tại (khoảng ngày + từ khoá + kho).
  Future<void> _fetch(Emitter<HistoryImportExportState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final Either<BaseError, List<HistoryImportExportResponse>> res = await _repo
        .getHistory(payload: _buildPayload());

    res.fold(
      (l) {
        _log.logE('❌ getHistoryImportExport failed: $l');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: _errorText(l),
          ),
        );
      },
      (r) {
        _log.logI('✅ getHistoryImportExport success - total: ${r.length}');
        emit(state.copyWith(status: BaseStateStatus.success, items: r));
      },
    );
  }

  /// Lưu từ khoá rồi tải lại danh sách. Từ khoá rỗng = bỏ tìm kiếm.
  Future<void> _search(
    Emitter<HistoryImportExportState> emit,
    String keyword,
  ) async {
    emit(state.copyWith(searchKeyword: keyword.trim()));
    await _fetch(emit);
  }

  /// Đổi khoảng ngày lọc (đầu ngày → cuối ngày) rồi tải lại danh sách.
  Future<void> _changeDateRange(
    Emitter<HistoryImportExportState> emit,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
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
    await _fetch(emit);
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

  String _errorText(BaseError error) {
    return error.when(
      httpInternalServerError: (body) => body,
      httpUnAuthorizedError: () => 'Unauthorized',
      httpUnknownError: (message) => message,
    );
  }
}
