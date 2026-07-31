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
        scanQrCode: (code) => _scanQrCode(emit, code),
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
      'KhoType': _defaultKhoType,
      'PageNumber': 1,
      'PageSize': 99999999,
      'Status': -1,
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

  Future<void> _scanQrCode(Emitter<SaleGdnState> emit, String code) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      isSearching: true,
    ));

    final res =
        await _repo.getBillExports(payload: _buildPayload(filterText: code));

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
          searchKeyword: code,
          isSearching: false,
        ));
      },
    );
  }
}
