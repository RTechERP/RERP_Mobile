import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/summary_customer_model.dart';
import '../../data/repository/summary_customer_repo.dart';

part 'summary_customer_event.dart';
part 'summary_customer_state.dart';
part 'summary_customer_bloc.g.dart';
part 'summary_customer_bloc.freezed.dart';

/// Bloc xử lý logic nghiệp vụ cho màn tổng hợp khách hàng CRM.
@injectable
class SummaryCustomerBloc
    extends BaseBloc<SummaryCustomerEvent, SummaryCustomerState> {
  final SummaryCustomerRepo _repo;
  final LogUtils _log;

  SummaryCustomerBloc(
    this._repo,
    this._log,
  ) : super(SummaryCustomerState.init()) {
    on<SummaryCustomerEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
        refresh: () => _onInit(emit),
      );
    });
  }

  /// Tải danh sách khách hàng + dự án.
  Future<void> _onInit(Emitter<SummaryCustomerState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _repo.getCustomerSynthetic();

    await res.fold(
      (l) async {
        _log.logE('Get customer synthetic failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Get customer synthetic success - total: ${r.length}');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          customers: r,
        ));
      },
    );
  }

  /// Thay đổi từ khoá tìm kiếm — lọc trên dữ liệu đã tải, không gọi lại API.
  Future<void> _onChangeKeyword(
    Emitter<SummaryCustomerState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(keyword: keyword));
  }
}
