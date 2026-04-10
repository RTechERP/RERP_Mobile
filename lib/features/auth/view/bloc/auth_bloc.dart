import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../../base/bloc/index.dart';
import '../../../../common/constants.dart';

import '../../../../common/helpers/index.dart';
import '../../../../common/services/permissions/permission_service.dart';
import '../../data/datasource/models/auth_model.dart';
import '../../data/datasource/models/user_model.dart';
import '../../data/repository/auth_repo.dart';
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
        login: (loginName, passwordHash, rememberMe) =>
            _onLogin(loginName, passwordHash, rememberMe, emit),
        logout: () => _onLogout(emit),
        toggleRememberMe: (value) => _onToggleRememberMe(value, emit),
      );
    });
  }

  Future<void> _onInit(Emitter<AuthState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final prefs = await SharedPreferences.getInstance();

    final rememberMe =
        prefs.getBool(SharedKeys.rememberMe) ?? false;

    final savedUsername =
    prefs.getString(SharedKeys.savedUsername);

    final savedPassword =
    prefs.getString(SharedKeys.savedPassword);

    emit(
      state.copyWith(
        status: BaseStateStatus.init,
        rememberMe: rememberMe,
        savedUsername: savedUsername,
        savedPassword: savedPassword,
      ),
    );

    final isValid =
    await AuthRepository.isLoggedInAndValid(log: _log);

    if (!isValid) {
      AuthScheduledLogout.cancel();
      return;
    }

    if (await AuthScheduledLogout.logoutIfMissedDailyBoundary(log: _log)) {
      if (emit.isDone) return;
      emit(state.copyWith(status: BaseStateStatus.init, user: null));
      return;
    }

    final cached = await AuthRepository.getCurrentUser(log: _log);

    final user =
        cached ?? await AuthRepository.fetchAndSaveCurrentUser(log: _log);

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: user != null
            ? BaseStateStatus.success
            : BaseStateStatus.init,
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
    bool rememberMe,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading, rememberMe: rememberMe));

    final res = await _authRepo.login(
      loginName: loginName,
      passwordHash: passwordHash,
    );

    final prefs = await SharedPreferences.getInstance();


    if (rememberMe) {
      await prefs.setBool(SharedKeys.rememberMe, true);
      await prefs.setString(SharedKeys.savedUsername, loginName);
      await prefs.setString(SharedKeys.savedPassword, passwordHash);
    } else {
      await prefs.remove(SharedKeys.rememberMe);
      await prefs.remove(SharedKeys.savedUsername);
      await prefs.remove(SharedKeys.savedPassword);
    }

    await res.fold(
      (l) async {
        if (emit.isDone) return;
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: 'Sai tài khoản hoặc mật khẩu!',
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

        if (user != null) {
          // Sync FCM Token khi login thành công
          try {
            if (Platform.isIOS) {
              await FirebaseMessaging.instance.getAPNSToken();
            }
            final fcmToken = await FirebaseMessaging.instance.getToken();
            if (fcmToken != null) {
              final deviceId = await DeviceInfoHelper.getDeviceId();
              await _authRepo.updateDeviceToken(fcmToken, deviceId);
            }
          } catch (e) {
            _log.logE('Lỗi đồng bộ FCM Token: $e');
          }
        }

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
            rememberMe: rememberMe,
            savedUsername: rememberMe ? loginName : null,
            savedPassword: rememberMe ? passwordHash : null,
          ),
        );
      },
    );
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();

    final rememberMe =
        prefs.getBool(SharedKeys.rememberMe) ?? false;

    final savedUsername =
    prefs.getString(SharedKeys.savedUsername);

    final savedPassword =
    prefs.getString(SharedKeys.savedPassword);

    AuthScheduledLogout.cancel();
    await AuthRepository.clearAll(log: _log);
    PermissionService.reset();

    if (emit.isDone) return;

    emit(
      AuthState.init().copyWith(
        rememberMe: rememberMe,
        savedUsername: savedUsername,
        savedPassword: savedPassword,
      ),
    );

    _log.logI('rememberMe=$rememberMe');
    _log.logI('savedUsername=$savedUsername');
    _log.logI('savedPassword=$savedPassword');
  }

  _onToggleRememberMe(bool value, Emitter<AuthState> emit) {
    emit(state.copyWith(rememberMe: value));
  }
}
