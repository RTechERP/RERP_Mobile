import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../base/network/errors/error.dart';
import '../datasource/models/auth_model.dart';
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

      return right(res.data);
    } on DioException catch (e) {
      return left( e.baseError);
    }
  }
}
