// Implementation repository cho màn Duyệt ĐNTT Đặt xe / Nhà nghỉ.

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/network/models/base_data.dart';
import '../datasource/models/approve_booking_payment_model.dart';
import '../datasource/service/approve_booking_payment_service.dart';
import 'approve_booking_payment_repo.dart';

@LazySingleton(as: ApproveBookingPaymentRepo)
class ApproveBookingPaymentRepoImpl implements ApproveBookingPaymentRepo {
  final ApproveBookingPaymentService _service;

  ApproveBookingPaymentRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ApproveBookingPaymentStep>>>
      getApproveSteps() {
    return _request(
      _service.getApproveSteps,
      'Không thể tải danh sách bước duyệt',
    );
  }

  @override
  Future<Either<BaseError, List<ApproveBookingPaymentItem>>> getUnifiedList({
    required Map<String, dynamic> payload,
  }) {
    return _request(
      () => _service.getUnifiedList(payload: payload),
      'Không thể tải danh sách đề nghị thanh toán',
    );
  }

  @override
  Future<Either<BaseError, List<ApproveBookingPaymentDepartment>>>
      getDepartments() {
    return _request(
      _service.getDepartments,
      'Không thể tải danh sách phòng ban',
    );
  }

  @override
  Future<Either<BaseError, List<ApproveBookingPaymentEmployee>>> getEmployees({
    String keyword = '',
  }) {
    return _request(
      () => _service.getEmployees(keyword: keyword),
      'Không thể tải danh sách nhân viên',
    );
  }

  /// Gọi [call], map `status == 1 && data != null` → `right(data)`;
  /// ngược lại trả `left(BaseError)` với message của BE (hoặc [fallback]).
  Future<Either<BaseError, List<T>>> _request<T>(
    Future<BaseData<List<T>>> Function() call,
    String fallback,
  ) async {
    try {
      final res = await call();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? res.msg ?? fallback),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
