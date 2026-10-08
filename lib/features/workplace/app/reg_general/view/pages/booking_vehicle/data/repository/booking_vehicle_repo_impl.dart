import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
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

  @override
  Future<Either<BaseError, BookingVehicleItem>> createBookingVehicle({required Map<String, dynamic> payload}) async {
    try {
      final res = await _service.createBookingVehicle(payload: payload);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? res.msg ?? 'Có lỗi xảy ra',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, void>> uploadBookingVehicleFile({
    required int vehicleBookingId,
    required PlatformFile file,
    required String subPath,
  }) async {
    try {
      final res = await _service.uploadBookingVehicleFile(
        vehicleBookingId: vehicleBookingId,
        file: file,
        subPath: subPath,
      );

      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Tải ảnh lên thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } on ArgumentError catch (e) {
      return left(BaseError.httpInternalServerError(e.message ?? '$e'));
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, void>> cancelBookingVehicle({
    required int vehicleBookingId,
  }) async {
    try {
      final res = await _service.cancelBookingVehicle(
        vehicleBookingId: vehicleBookingId,
      );

      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Hủy đặt xe thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<int>>> getDepartmentIds({
    required int configType,
  }) async {
    try {
      final res = await _service.getDepartmentIds(configType: configType);
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
