import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../../../../../base/network/errors/extension.dart';
import '../datasource/service/app_version_service.dart';
import '../datasource/models/app_version_model.dart';
import 'app_version_repo.dart';

@LazySingleton(as: AppVersionRepo)
class AppVersionRepoImpl implements AppVersionRepo {
  final AppVersionService _service;

  AppVersionRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<AppVersion>>> getAppVersion() async {
    try {
      final res = await _service.getAppVersion();

      if (res.data == null || res.data!.isEmpty) {
        return right([AppVersion(id: 1, minSupportedVersion: '1.1.0')]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
