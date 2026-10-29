import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../../data/repo/lead_marketing_repo.dart';

part 'lead_marketing_event.dart';
part 'lead_marketing_state.dart';
part 'lead_marketing_bloc.g.dart';
part 'lead_marketing_bloc.freezed.dart';

/// Bloc xử lý logic nghiệp vụ cho màn Lead Marketing của CRM.
@injectable
class LeadMarketingBloc extends BaseBloc<LeadMarketingEvent, LeadMarketingState> {
  final LeadMarketingRepo _repo;
  final LogUtils _log;

  LeadMarketingBloc(
    this._repo,
    this._log,
  ) : super(LeadMarketingState.init()) {
    on<LeadMarketingEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
        refresh: () => _onInit(emit),
      );
    });
  }

  /// Tải quyền, danh sách bộ lọc và danh sách phiếu lead.
  Future<void> _onInit(Emitter<LeadMarketingState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // Giữ khoảng thời gian đang chọn khi refresh, nếu chưa chọn thì
    // mặc định là tháng hiện tại.
    final now = DateTime.now();
    final start = state.dateStart ?? DateTime(now.year, now.month, 1);
    final end = state.dateEnd ?? DateTime(now.year, now.month + 1, 0);

    await _loadRoleContext(emit);

    await _loadLeads(
      emit,
      dateStart: start,
      dateEnd: end,
    );
  }

  /// Tải quyền của người dùng hiện tại trong module Lead.
  Future<void> _loadRoleContext(Emitter<LeadMarketingState> emit) async {
    final res = await _repo.getRoleContext();
    res.fold(
      (l) => _log.logE('Get lead role context failed: $l'),
      (r) => emit(state.copyWith(roleContext: r)),
    );
  }

  /// Thay đổi khoảng thời gian — tải lại danh sách phiếu lead.
  Future<void> _onChangeDateRange(
    Emitter<LeadMarketingState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    await _loadLeads(
      emit,
      dateStart: DateTime(dateStart.year, dateStart.month, dateStart.day),
      dateEnd: DateTime(dateEnd.year, dateEnd.month, dateEnd.day),
    );
  }

  /// Thay đổi từ khoá tìm kiếm — lọc trên dữ liệu đã tải, không gọi lại API.
  Future<void> _onChangeKeyword(
    Emitter<LeadMarketingState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(keyword: keyword));
  }

  /// Gọi API lấy danh sách phiếu lead theo khoảng thời gian đang lọc.
  Future<void> _loadLeads(
    Emitter<LeadMarketingState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: dateStart,
      dateEnd: dateEnd,
    ));

    final res = await _repo.getLeadData(
      viewMode: state.viewMode,
      dateStart: dateStart,
      dateEnd: dateEnd,
      leadType: state.leadType,
      includeOpen: state.includeOpen,
    );

    await res.fold(
      (l) async {
        _log.logE('Get lead data failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Get lead data success - total: ${r.length}');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          leads: r,
        ));
      },
    );
  }
}
