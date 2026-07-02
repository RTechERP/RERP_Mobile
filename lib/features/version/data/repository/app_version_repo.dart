import 'package:dartz/dartz.dart';

import '../../../../../base/network/errors/error.dart';
import '../datasource/models/app_version_model.dart';

abstract class AppVersionRepo {
  Future<Either<BaseError, List<AppVersion>>> getAppVersion();
}
