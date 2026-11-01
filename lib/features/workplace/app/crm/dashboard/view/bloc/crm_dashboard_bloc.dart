import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../../../base/bloc/base_bloc.dart';
import '../../../../../../../base/bloc/base_bloc_state.dart';
import '../../../../../../../base/bloc/bloc_status.dart';
import '../../data/datasource/models/crm_dashboard_model.dart';
import '../../data/repo/crm_dashboard_repo.dart';

part 'crm_dashboard_bloc.freezed.dart';
part 'crm_dashboard_bloc.g.dart';
part 'crm_dashboard_event.dart';
part 'crm_dashboard_state.dart';

/// Bloc xử lý logic Dashboard CRM.
@injectable
class CrmDashboardBloc extends BaseBloc<CrmDashboardEvent, CrmDashboardState> {
  final CrmDashboardRepo _repo;

  CrmDashboardBloc(this._repo) : super(CrmDashboardState.init()) {
    on<_Init>(_onInit);
    on<_Refresh>(_onRefresh);
    on<_ChangeDateRange>(_onChangeDateRange);
  }

  Future<void> _onInit(
    _Init event,
    Emitter<CrmDashboardState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await _loadDashboard(emit);
  }

  Future<void> _onRefresh(
    _Refresh event,
    Emitter<CrmDashboardState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    await _loadDashboard(emit);
  }

  Future<void> _onChangeDateRange(
    _ChangeDateRange event,
    Emitter<CrmDashboardState> emit,
  ) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: event.dateStart,
      dateEnd: event.dateEnd,
    ));
    await _loadDashboard(emit);
  }

  Future<void> _loadDashboard(Emitter<CrmDashboardState> emit) async {
    final result = await _repo.getDashboard(
      dateStart: state.dateStart,
      dateEnd: state.dateEnd,
    );

    result.fold(
      (error) => emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: error.toString(),
      )),
      (data) => emit(state.copyWith(
        status: BaseStateStatus.success,
        data: data,
        message: null,
      )),
    );
  }
}
