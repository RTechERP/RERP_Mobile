import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../common/constants.dart';

import '../../data/datasource/models/auth_model.dart';
import '../../data/repository/auth_repo.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../data/repository/auth_repository.dart';
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

    final isLogin = await AuthRepository.checkLogin(log: _log);

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: isLogin
            ? BaseStateStatus.success
            : BaseStateStatus.init,
      ),
    );
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


            if (emit.isDone) return;
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            message: BlocMessages.loginSuccess,
            loginResponse: r,
          ),
        );
      },
    );
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    await AuthRepository.clearToken(log: _log);

    if (emit.isDone) return;
    emit(AuthState.init());
  }


}
