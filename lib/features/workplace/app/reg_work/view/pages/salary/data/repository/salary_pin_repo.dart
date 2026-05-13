import 'package:dartz/dartz.dart';
import '../../../../../../../../../base/network/errors/error.dart';

abstract class SalaryPinRepo {
  Future<Either<BaseError, bool>> checkPin();
  Future<Either<BaseError, void>> setPin({required String pin});
  Future<Either<BaseError, bool>> verifyPin({required String pin});
  Future<Either<BaseError, void>> requestPin();
}
