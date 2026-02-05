import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../common/constants.dart';
import '../../data/datasource/models/auth_model.dart';
import '../../data/repository/auth_repo.dart';
import '../../../../../../../../base/network/errors/extension.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.g.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;

  AuthBloc(this._authRepo) : super(AuthState.init()) {
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

    // TODO: load token từ Hive/SecureStorage nếu có
    emit(state.copyWith(status: BaseStateStatus.success));
  }

  Future<void> _onLogin(
    String loginName,
    String passwordHash,
    Emitter<AuthState> emit,
  ) async {
    final res = await _authRepo.login(
      loginName: loginName,
      passwordHash: passwordHash,
    );

    res.fold(
      (l) {
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
      (r) async {
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
    emit(AuthState.init());
  }
}
