import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../common/constants.dart';

import '../../../../common/services/permissions/permission_service.dart';
import '../../data/datasource/models/auth_model.dart';
import '../../data/datasource/models/user_model.dart';
import '../../data/repository/auth_repo.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../data/repository/auth_repository.dart';
import '../../helper/auth_scheduled_logout.dart';
import '../../../../common/logger/logger.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.g.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  final LogUtils _log;

  AuthBloc(this._authRepo, this._log) : super(AuthState.init()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        login: (loginName, passwordHash) =>
            _onLogin(loginName, passwordHash, emit),
        logout: () => _onLogout(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<AuthState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final isValid = await AuthRepository.isLoggedInAndValid(log: _log);

    if (!isValid) {
      AuthScheduledLogout.cancel();
      if (emit.isDone) return;
      emit(state.copyWith(status: BaseStateStatus.init));
      return;
    }

    if (await AuthScheduledLogout.logoutIfMissedDailyBoundary(log: _log)) {
      if (emit.isDone) return;
      emit(state.copyWith(status: BaseStateStatus.init));
      return;
    }

    final cached = await AuthRepository.getCurrentUser(log: _log);

    final user =
        cached ?? await AuthRepository.fetchAndSaveCurrentUser(log: _log);

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: user != null ? BaseStateStatus.success : BaseStateStatus.init,
        user: user,
      ),
    );

    if (user != null) {
      AuthScheduledLogout.arm(log: _log);
    } else {
      AuthScheduledLogout.cancel();
    }
  }

  Future<void> _onLogin(
    String loginName,
    String passwordHash,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _authRepo.login(
      loginName: loginName,
      passwordHash: passwordHash,
    );

    await res.fold(
      (l) async {
        if (emit.isDone) return;
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
      (r) async {
        if (r?.accessToken != null && r?.expires != null) {
          await AuthRepository.saveLogin(
            token: r!.accessToken,
            expires: r.expires!,
            log: _log,
          );
        }

        final user = await AuthRepository.fetchAndSaveCurrentUser(log: _log);

        if (emit.isDone) return;

        emit(
          state.copyWith(
            status: user != null
                ? BaseStateStatus.success
                : BaseStateStatus.failed,
            message: user != null
                ? BlocMessages.loginSuccess
                : 'Login success but fetch user failed',
            loginResponse: r,
            user: user,
          ),
        );
      },
    );
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    AuthScheduledLogout.cancel();
    await AuthRepository.clearAll(log: _log);
    PermissionService.reset();
    if (emit.isDone) return;
    emit(AuthState.init());
  }
}
