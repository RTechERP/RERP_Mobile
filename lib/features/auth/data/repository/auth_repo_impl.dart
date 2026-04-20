// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Auth repository implementation - gọi AuthService, handle errors

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/network/errors/error.dart';
import '../../../../base/network/errors/extension.dart';
import '../../../../common/local_data/shared_pref.dart';
import '../../../more/data/repository/more_repo.dart';
import '../datasource/models/auth_model.dart';
import '../datasource/models/user_model.dart';
import '../datasource/service/auth_service.dart';
import 'auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthService _service;
  final MoreRepo _moreRepo;
  final LocalStorage _localStorage;

  AuthRepoImpl(this._service, this._moreRepo, this._localStorage);

  @override
  Future<Either<BaseError, LoginResponse?>> login({
    required String loginName,
    required String passwordHash,
    String? fcmToken,
    String? deviceId,
  }) async {
    try {
      final res = await _service.loginByPlatform(
        loginName,
        passwordHash,
        fcmToken: fcmToken,
        deviceId: deviceId,
      );
      return right(res);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, User?>> getCurrentUser() async {
    try {
      final user = await _service.getCurrentUser();
      return right(user);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<void> initDefaultNotificationsForNewUser({required int userId}) async {
    final key = 'notification_defaults_set_$userId';
    final alreadySet = await _localStorage.getBool(key);
    if (alreadySet) return;

    final res = await _moreRepo.getTypeNotification();
    await res.fold(
      (l) async {
        // ignore: avoid_print
        print('❌ Init default notifications failed: $l');
      },
      (data) async {
        if (data.every((e) => !e.isSelected)) {
          final payload = data.map((item) => {
            'ID': item.typeLinkId,
            'NotificationTypeID': item.id,
            'UserID': userId,
            'IsSelected': true,
          }).toList();
          await _moreRepo.saveNotificationType(payload: payload);
        }
      },
    );

    await _localStorage.setBool(key, true);
  }
}
