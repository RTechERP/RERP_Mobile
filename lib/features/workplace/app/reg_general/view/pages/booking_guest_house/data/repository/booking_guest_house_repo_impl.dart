// Implementation repository Đặt phòng nhà nghỉ.

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/booking_guest_house_model.dart';
import '../datasource/service/booking_guest_house_service.dart';
import 'booking_guest_house_repo.dart';

@LazySingleton(as: BookingGuestHouseRepo)
class BookingGuestHouseRepoImpl implements BookingGuestHouseRepo {
  final BookingGuestHouseService _service;

  BookingGuestHouseRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<BookingGuestHouseItem>>> getBookingGuestHouse({
    required String dateStart,
    required String dateEnd,
    int projectId = 0,
    int employeeId = 0,
    String filterText = '',
  }) async {
    try {
      final res = await _service.getBookingGuestHouse(
        dateStart: dateStart,
        dateEnd: dateEnd,
        projectId: projectId,
        employeeId: employeeId,
        filterText: filterText,
      );

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách đặt phòng nhà nghỉ',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<ProjectFilterItem>>> getProjects() async {
    try {
      final res = await _service.getProjects();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách dự án',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<EmployeeFilterItem>>> getEmployees({
    String keyword = '',
  }) async {
    try {
      final res = await _service.getEmployees(keyword: keyword);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách nhân viên',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<ProvinceFilterItem>>> getProvinces({
    int employeeId = 0,
  }) async {
    try {
      final res = await _service.getProvinces(employeeId: employeeId);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách tỉnh',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, BookingGuestHouseSaveResponse>>
      saveBookingGuestHouse({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveBookingGuestHouse(payload: payload);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Lưu phiếu đặt phòng thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, void>> deleteBookingGuestHouse({
    required List<int> ids,
  }) async {
    try {
      final res = await _service.deleteBookingGuestHouse(ids: ids);
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Xoá phiếu đặt phòng thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}