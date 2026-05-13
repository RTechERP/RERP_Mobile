import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/service/salary_pin_service.dart';
import 'salary_pin_repo.dart';

@LazySingleton(as: SalaryPinRepo)
class SalaryPinRepoImpl implements SalaryPinRepo {
  SalaryPinRepoImpl(this._service);

  final SalaryPinService _service;

  @override
  Future<Either<BaseError, bool>> checkPin() async {
    try {
      final res = await _service.checkPin();
      if (res.status == 1 && res.data != null) {
        return right(res.data!.hasPin ?? false);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> setPin({required String pin}) async {
    try {
      final res = await _service.setPin(pin: pin);
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, bool>> verifyPin({required String pin}) async {
    try {
      final res = await _service.verifyPin(pin: pin);
      if (res.status == 1 && res.data != null) {
        return right(res.data!.verified ?? false);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> requestPin() async {
    try {
      final res = await _service.requestPin();
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Co loi xay ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
