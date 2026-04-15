import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/personal_assets/data/datasource/models/personal_asset_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/personal_assets/data/repository/personal_asset_repo.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/service/personal_asset_service.dart';

@LazySingleton(as: PersonalAssetRepo)
class PersonalAssetRepoImpl implements PersonalAssetRepo {
  final PersonalAssetService _service;

  PersonalAssetRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<PersonalAssetItem>>> getPersonalAsset({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getPersonalAsset(payload: payload);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<PersonalPropertyItem>>> getPersonalProperty({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getPersonalProperty(payload: payload);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> approvePersonalProperty({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.approvePersonalProperty(payload: payload);

      if (res.status == 1) {
        return right(null);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<DetailPersonalPropertyItem>>> getPersonalPropertyDetail({
    required Map<String, dynamic> query,
  }) async {
    try {
      final res = await _service.getPersonalPropertyDetail(query: query);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
