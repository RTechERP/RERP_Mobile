import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../datasource/service/auth_service.dart';
import 'auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthService _service;

  AuthRepoImpl(this._service);

  @override
  Future<Either<Exception, String?>> login({
    required String loginName,
    required String passwordHash,
  }) async {
    try {
      final res = await _service.loginByPlatform(loginName, passwordHash);
      return Right(res.accessToken); // hoặc res.data / res.accessToken tuỳ API
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}