// Date: 16/10/2026
// Nội dung/Chức năng: Repository implementation cho chức năng thuê xe tải.

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/rental_vehicle/data/datasource/models/rental_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/rental_vehicle/data/repository/rental_vehicle_repo.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import '../datasource/service/rental_vehicle_service.dart';

@LazySingleton(as: RentalVehicleRepo)
class RentalVehicleRepoImpl implements RentalVehicleRepo {
  final RentalVehicleService _service;

  RentalVehicleRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<RentalVehicleItem>>> searchRentalVehicle({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.searchRentalVehicle(payload: payload);

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
  Future<Either<BaseError, List<RentalVehicleEmployee>>> getEmployees({
    required int status,
    required int departmentId,
    required String keyword,
  }) async {
    try {
      final res = await _service.getEmployees(
        status: status,
        departmentId: departmentId,
        keyword: keyword,
      );
      if (res.status == 1 && res.data != null) return right(res.data!);
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không tải được danh sách nhân viên',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<RentalVehicleDepartment>>> getDepartments() async {
    try {
      final res = await _service.getDepartments();
      if (res.status == 1 && res.data != null) return right(res.data!);
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không tải được danh sách phòng ban',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<RentalVehicleProject>>> getProjects() async {
    try {
      final res = await _service.getProjects();
      if (res.status == 1 && res.data != null) return right(res.data!);
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không tải được danh sách dự án',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, bool>> saveData({
    required List<Map<String, dynamic>> payload,
  }) async {
    try {
      final res = await _service.saveData(payload: payload);
      if (res.status == 1) return right(true);
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Có lỗi xảy ra',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, bool>> deleteData({
    required List<int> ids,
  }) async {
    try {
      final res = await _service.deleteData(ids: ids);
      if (res.status == 1) return right(true);
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Xoá thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
