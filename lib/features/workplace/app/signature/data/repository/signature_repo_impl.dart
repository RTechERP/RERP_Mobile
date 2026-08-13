import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/service/signature_service.dart';
import 'signature_repo.dart';

@LazySingleton(as: SignatureRepo)
class SignatureRepoImpl implements SignatureRepo {
  final SignatureService _service;

  SignatureRepoImpl(this._service);

  @override
  Future<Either<BaseError, Uint8List?>> getEmployeeSignature() async {
    try {
      final res = await _service.getEmployeeSignature();
      return right(res);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpUnknownError(e.toString()));
    }
  }
}
