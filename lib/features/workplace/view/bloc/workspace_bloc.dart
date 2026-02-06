import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';

import '../../../../common/logger/logger.dart';
import '../../../auth/data/datasource/models/user_model.dart';
import '../../../auth/data/repository/auth_repository.dart';

part 'workspace_event.dart';
part 'workspace_state.dart';
part 'workspace_bloc.g.dart';
part 'workspace_bloc.freezed.dart';

@injectable
class WorkspaceBloc extends BaseBloc<WorkspaceEvent, WorkspaceState> {
  final LogUtils _log;

  WorkspaceBloc(this._log) : super(WorkspaceState.init()) {
    on<WorkspaceEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<WorkspaceState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final cached = await AuthRepository.getCurrentUser(log: _log);

    if (cached != null) {
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          user: cached,
        ),
      );
      return;
    }

    final user = await AuthRepository.fetchAndSaveCurrentUser(log: _log);

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: user != null
            ? BaseStateStatus.success
            : BaseStateStatus.failed,
        user: user,
        message: user != null ? null : 'Fetch user failed',
      ),
    );
  }


  Future<void> _onRefresh(Emitter<WorkspaceState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final user = await AuthRepository.fetchAndSaveCurrentUser(
      log: _log,
      forceRefresh: true, // nếu bạn có param này
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: user != null
            ? BaseStateStatus.success
            : BaseStateStatus.failed,
        user: user,
      ),
    );
  }

}
