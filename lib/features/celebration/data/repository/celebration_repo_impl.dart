import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../../../../../base/network/errors/extension.dart';
import '../datasource/model/celebration_model.dart';
import '../datasource/service/celebration_service.dart';
import 'celebration_repo.dart';

@LazySingleton(as: CelebrationRepo)
class CelebrationRepoImpl implements CelebrationRepo {
  final CelebrationService _service;

  CelebrationRepoImpl(this._service);

  @override
  Future<Either<BaseError, CelebrationItem>> checkBirthdaySeniority() async {
    try {
      final res = await _service.checkBirthdaySeniority();

      if (res.data == null) {
        return right(const CelebrationItem());
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
