import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Exception, String?>> login({
    required String loginName,
    required String passwordHash,
  });
}