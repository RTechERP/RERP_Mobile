// Implementation repository cho màn Duyệt phiếu Đặt phòng nhà nghỉ.

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/approve_booking_guest_house_model.dart';
import '../datasource/service/approve_booking_guest_house_service.dart';
import 'approve_booking_guest_house_repo.dart';

@LazySingleton(as: ApproveBookingGuestHouseRepo)
class ApproveBookingGuestHouseRepoImpl
    implements ApproveBookingGuestHouseRepo {
  final ApproveBookingGuestHouseService _service;

  ApproveBookingGuestHouseRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ApproveBookingGuestHouseItem>>>
      getApproveBookingGuestHouse({
    required String dateStart,
    required String dateEnd,
    int projectId = 0,
    int employeeId = 0,
    String filterText = '',
  }) async {
    try {
      final res = await _service.getApproveBookingGuestHouse(
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
  Future<Either<BaseError, List<ApproveProjectFilterItem>>>
      getApproveBookingGuestHouseProjects() async {
    try {
      final res = await _service.getApproveBookingGuestHouseProjects();
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
  Future<Either<BaseError, List<ApproveEmployeeFilterItem>>>
      getApproveBookingGuestHouseEmployees({
    String keyword = '',
  }) async {
    try {
      final res = await _service.getApproveBookingGuestHouseEmployees(
        keyword: keyword,
      );
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
}
