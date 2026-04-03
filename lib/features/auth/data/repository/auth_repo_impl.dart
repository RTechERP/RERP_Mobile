import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../base/network/errors/error.dart';
import '../datasource/models/auth_model.dart';
import '../datasource/models/user_model.dart';
import '../datasource/service/auth_service.dart';
import 'auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthService _service;

  AuthRepoImpl(this._service);

  @override
  Future<Either<BaseError, LoginResponse?>> login({
    required String loginName,
    required String passwordHash,
  }) async {
    try {
      final res = await _service.loginByPlatform(
        loginName,
        passwordHash,
      );

      // 🔥 res LÀ LoginResponse
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
  Future<Either<BaseError, void>> updateDeviceToken(String fcmToken) async {
    try {
      await _service.updateDeviceToken(fcmToken);
      return right(null);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
