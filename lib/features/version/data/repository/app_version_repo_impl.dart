import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../../../../../base/network/errors/extension.dart';
import '../datasource/service/app_version_service.dart';
import '../datasource/models/app_version_model.dart';
import 'app_version_repo.dart';

/// ID tương ứng với từng platform trong response của API `/appmobileversion`.
const int _iosPlatformId = 1;
const int _androidPlatformId = 2;

/// Lấy platform id theo thiết bị hiện tại.
int get _currentPlatformId => Platform.isIOS ? _iosPlatformId : _androidPlatformId;

@LazySingleton(as: AppVersionRepo)
class AppVersionRepoImpl implements AppVersionRepo {
  final AppVersionService _service;

  AppVersionRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<AppVersion>>> getAppVersion() async {
    try {
      final res = await _service.getAppVersion();

      if (res.data == null || res.data!.isEmpty) {
        return right([
          AppVersion(id: _currentPlatformId, minSupportedVersion: '1.1.0'),
        ]);
      }

      // API trả về nhiều record, mỗi record ứng với một platform:
      // ID 1 = iOS, ID 2 = Android. Lọc đúng record của platform hiện tại.
      final platformId = _currentPlatformId;
      final matched =
          res.data!.where((e) => e.id == platformId).toList(growable: false);

      if (matched.isNotEmpty) {
        return right(matched);
      }

      // Fallback khi server chưa có record cho platform hiện tại.
      return right([
        AppVersion(id: platformId, minSupportedVersion: '1.1.0'),
      ]);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
