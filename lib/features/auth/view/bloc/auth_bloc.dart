import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../common/constants.dart';
import '../../data/datasource/models/auth_model.dart';
import '../../data/repository/auth_repo.dart';

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
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final result = await _authRepo.login(
      loginName: loginName,
      passwordHash: passwordHash,
    );

    result.fold(
          (error) {
        final err = error.toString().toLowerCase();

        final isWrongCredential =
            err.contains('401') ||
                err.contains('unauthorized') ||
                err.contains('invalid') ||
                err.contains('sai') ||
                err.contains('không đúng') ||
                err.contains('wrong_credential');

        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: isWrongCredential
                ? 'Tài khoản hoặc mật khẩu không chính xác!'
                : BlocMessages.notLoggedIn,
          ),
        );
      },
          (token) async {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            message: BlocMessages.loginSuccess,
            loginResponse: LoginResponse(accessToken: token ?? ''),
          ),
        );
      },
    );
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    emit(AuthState.init());
  }
}