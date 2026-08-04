import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/work_trip_model.dart';
import '../datasource/service/work_trip_service.dart';
import 'work_trip_repo.dart';

@LazySingleton(as: WorkTripRepo)
class WorkTripRepoImpl implements WorkTripRepo {
  final WorkTripService _service;

  WorkTripRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<WorkTripItem>>> getWorkTrip({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getWorkTrip(payload: payload);
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
  Future<Either<BaseError, List<WorkTripTypeItem>>> getWorkTripType() async {
    try {
      final res = await _service.getWorkTripType();
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
  Future<Either<BaseError, List<ApproverItem>>> getApprover() async {
    try {
      final res = await _service.getApprover();
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
  Future<Either<BaseError, List<WorkTripProject>>> getWorkTripProject() async {
    try {
      final res = await _service.getWorkTripProject();
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
  Future<Either<BaseError, void>> saveWorkTrip({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveWorkTrip(payload: payload);
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Lưu dữ liệu thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, WorkTripDetailItem>> getWorkTripById(int id) async {
    try {
      final res = await _service.getWorkTripById(id);
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
  Future<Either<BaseError,
      List<WorkTripTypeVehicle>>> getWorkTripVehicleType() async {
    try {
      final res = await _service.getWorkTripVehicleType();
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
  Future<Either<BaseError, FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  }) async {
    try {
      final res =
          await _service.getFillApprover(
            employeeID: employeeID,
            tableName: tableName,
          );
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
  Future<Either<BaseError, List<WorkTripSelfVehicle>>>
      getVehicleBookingsForBussiness({
    required int employeeId,
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    try {
      final res = await _service.getVehicleBookingsForBussiness(
        employeeId: employeeId,
        dateStart: dateStart,
        dateEnd: dateEnd,
      );
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
}