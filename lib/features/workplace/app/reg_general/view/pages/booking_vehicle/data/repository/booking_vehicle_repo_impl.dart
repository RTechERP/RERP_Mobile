import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/service/booking_vehicle_service.dart';
import 'booking_vehicle_repo.dart';

@LazySingleton(as: BookingVehicleRepo)
class BookingVehicleRepoImpl implements BookingVehicleRepo {
  final BookingVehicleService _service;

  BookingVehicleRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<BookingVehicleItem>>> getBookingVehicle({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getBookingVehicle(payload: payload);

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
  Future<Either<BaseError, List<ProvinceArrivesItem>>> getProvinceArrives({
    required int employeeId,
  }) async {
    try {
      final res = await _service.getProvinceArrives(employeeId: employeeId);
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ProvinceDepartureItem>>> getProvinceDeparture({
    required int employeeId,
  }) async {
    try {
      final res = await _service.getProvinceDeparture(employeeId: employeeId);
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ApproverItem>>> getApprover() async {
    try {
      final res = await _service.getApprover();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<BookingVehiclePersonalItem>>> getEmployee() async {
    try {
      final res = await _service.getEmployee();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, BookingVehiclePersonalItem>> getEmployeeById({required int employeeId}) async {
    try {
      final res = await _service.getEmployeeById(employeeId: employeeId);
      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<BookingVehicleProjectItem>>> getProject() async {
    try {
      final res = await _service.getProject();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
