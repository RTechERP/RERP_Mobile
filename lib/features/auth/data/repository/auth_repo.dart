import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../datasource/models/auth_model.dart';

abstract class AuthRepo {
  Future<Either<BaseError, LoginResponse?>> login({
    required String loginName,
    required String passwordHash,
  });
}
