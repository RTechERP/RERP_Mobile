import 'package:dartz/dartz.dart';
import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/pin_verify_model.dart';

abstract class SalaryPinRepo {
  Future<Either<BaseError, bool>> checkPin();
  Future<Either<BaseError, void>> setPin({required String pin});
  Future<Either<BaseError, VerifiedPinResponse>> verifyPin({required String pin});
  Future<Either<BaseError, void>> requestPin();
}
