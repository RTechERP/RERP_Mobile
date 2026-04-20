import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/notification_model.dart';
import '../datasource/service/more_service.dart';
import 'more_repo.dart';

@LazySingleton(as: MoreRepo)
class MoreRepoImpl implements MoreRepo {
  final MoreService _service;

  MoreRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<TypeNotiItem>>> getTypeNotification() async {
    try {
      final res = await _service.getTypeNotification();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> saveNotificationType({required List<dynamic> payload}) async {
    try {
      final res = await _service.saveNotificationType(payload: payload);

      if (res.status == 1) {
        return right(null);
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

}
