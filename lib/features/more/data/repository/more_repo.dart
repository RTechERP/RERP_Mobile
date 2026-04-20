import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/notification_model.dart';

abstract class MoreRepo {
  Future<Either<BaseError, List<TypeNotiItem>>> getTypeNotification();

  Future<Either<BaseError, void>> saveNotificationType({
    required List<dynamic> payload,
  });
}