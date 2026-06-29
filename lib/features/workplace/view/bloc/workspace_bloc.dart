// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: BLoC quản lý workspace - load user, resolve role, navigate

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../common/logger/logger.dart';
import '../../../../common/services/permissions/permission_service.dart';
import '../../../../routes/route_names.dart';
import '../../../auth/data/datasource/models/user_model.dart';
import '../../../auth/data/repository/auth_repo.dart';
import '../../../auth/data/repository/auth_repository.dart';

part 'workspace_event.dart';
part 'workspace_state.dart';
part 'workspace_bloc.g.dart';
part 'workspace_bloc.freezed.dart';

@injectable
class WorkspaceBloc extends BaseBloc<WorkspaceEvent, WorkspaceState> {
  final LogUtils _log;
  final AuthRepo _authRepo;

  WorkspaceBloc(
    this._authRepo,
    this._log,
  ) : super(WorkspaceState.init()) {
    on<WorkspaceEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  //---(Init)---//

  /// Load user (cache → API fallback), sau đó resolve sẵn route "Phê duyệt"
  /// để user bấm là vào thẳng — không phải chờ gọi API lần nữa.
  Future<void> _onInit(Emitter<WorkspaceState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final cached = await AuthRepository.getCurrentUser(log: _log);

    if (cached != null) {
      await PermissionService.init();
      final route = await _resolvePersonalApproveRoute(cached);
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          user: cached,
          personalApproveRoute: route,
        ),
      );
      return;
    }

    final user = await AuthRepository.fetchAndSaveCurrentUser(log: _log);

    if (emit.isDone) return;

    if (user != null) {
      await PermissionService.init();
    }

    final route = user != null ? await _resolvePersonalApproveRoute(user) : null;

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: user != null
            ? BaseStateStatus.success
            : BaseStateStatus.failed,
        user: user,
        personalApproveRoute: route,
        message: user != null ? null : 'Fetch user failed',
      ),
    );
  }

  //---(Refresh)---//

  /// Refresh — force fetch user từ API, đồng thời resolve lại route "Phê duyệt".
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

    final route = user != null ? await _resolvePersonalApproveRoute(user) : null;

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: user != null
            ? BaseStateStatus.success
            : BaseStateStatus.failed,
        user: user,
        personalApproveRoute: route,
      ),
    );
  }

  /// Resolve route "Phê duyệt" dựa trên permission Senior đã resolve sẵn
  /// qua `PermissionService.init()` ở trên (role `senior` ← permission N85).
  /// - Có quyền `personal_approve:senior` → Senior screen.
  /// - Ngược lại → Menu screen.
  /// Trả về null nếu lỗi / không resolve được (để caller xử lý).
  Future<String?> _resolvePersonalApproveRoute(User user) async {
    try {
      final isSenior = PermissionService.hasAccess(
        'personal_approve:senior',
      );
      _log.logI(
        'PersonalApprove.resolveRoute: employeeId=${user.employeeId}, isSenior=$isSenior',
      );

      return isSenior
          ? RouteNames.personalApproveSeniorTimesheet
          : RouteNames.personalApprove;
    } catch (e) {
      _log.logE('Resolve personalApprove route failed: $e');
      return RouteNames.personalApprove;
    }
  }
}