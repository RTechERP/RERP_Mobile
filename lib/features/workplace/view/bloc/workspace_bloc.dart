// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: BLoC quản lý workspace - load user, resolve role, navigate

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../common/logger/logger.dart';
import '../../../../common/services/permissions/permission_service.dart';
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

  //---(Init)---//

  /// Handles init event — load user từ cache trước, nếu không có thì fetch từ API.
  Future<void> _onInit(Emitter<WorkspaceState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final cached = await AuthRepository.getCurrentUser(log: _log);

    if (cached != null) {
      await PermissionService.init();

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

    if (user != null) {
      await PermissionService.init();
    }

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

  //---(Refresh)---//

  /// Handles refresh event — force fetch user từ API, bỏ qua cache.
  Future<void> _onRefresh(Emitter<WorkspaceState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final user = await AuthRepository.fetchAndSaveCurrentUser(
      log: _log,
      forceRefresh: true,
    );

    if (emit.isDone) return;

    if (user != null) {
      await PermissionService.init();
    }

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
