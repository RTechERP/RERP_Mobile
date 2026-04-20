import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/stationery/data/datasource/models/stationery_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/stationery/data/repository/stationery_repo.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/service/stationery_service.dart';

@LazySingleton(as: StationeryRepo)
class StationeryRepoImpl implements StationeryRepo {
  final StationeryService _service;

  StationeryRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<StationeryItem>>> getStationeryItem({
    String keyword = '',
    String monthInput = '',
    int departmentId = 0,
  }) async {
    try {
      final res = await _service.getStationeryItem(
        keyword: keyword,
        monthInput: monthInput,
        departmentId: departmentId,
      );

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
  Future<Either<BaseError, List<StationerySupplyItem>>> getSupplyItem() async {
    try {
      final res = await _service.getSupplyItem();

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
  Future<Either<BaseError, List<StationeryDetailItem>>> getStationeryDetailItem({
    required int officeSupplyRequestsId,
  }) async {
    try {
      final res = await _service.getStationeryDetailItem(
        officeSupplyRequestsId: officeSupplyRequestsId,
      );

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
  Future<Either<BaseError, void>> saveStationery({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveStationery(payload: payload);

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
