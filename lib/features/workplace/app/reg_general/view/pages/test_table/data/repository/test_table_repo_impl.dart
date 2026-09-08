import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/test_table_model.dart';
import '../datasource/service/test_table_service.dart';
import 'test_table_repo.dart';

/// Triển khai [TestTableRepo]: map response và lỗi mạng.
@LazySingleton(as: TestTableRepo)
class TestTableRepoImpl implements TestTableRepo {
  final TestTableService _service;

  TestTableRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<TestCardItem>>> getTestCardItem({
    String keyword = '',
    int employeeId = 0,
    int? status,
    String startDate = '',
    String endDate = '',
  }) async {
    try {
      final res = await _service.getTestCardItem(
        keyword: keyword,
        employeeId: employeeId,
        status: status ?? 0,
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
  Future<Either<BaseError, List<TestTableItem>>> getTestTableItem() async {
    try {
      final res = await _service.getTestTableItem();
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
  Future<Either<BaseError, List<EmployeeInfoItem>>> getEmployeeInfoItem({
    int status = 0,
    int departmentId = 0,
    String keyword = '',
  }) async {
    try {
      final res = await _service.getEmployeeInfoItem(
        status: status,
        departmentId: departmentId,
        keyword: keyword,
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
  Future<Either<BaseError, List<ProjectItem>>> getProjectItem() async {
    try {
      final res = await _service.getProjectItem();
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
  Future<Either<BaseError, List<ApproverItem>>> getApproverItem() async {
    try {
      final res = await _service.getApproverItem();
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
  Future<Either<BaseError, String?>> checkConflict({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final message = await _service.checkConflict(payload: payload);
      // Service trả về:
      // - "" (rỗng) → không trùng
      // - "<message>" → có trùng, message là nội dung phiếu trùng
      return right(message.isEmpty ? null : message);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, int>> saveRegistration({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final createdId = await _service.saveRegistration(payload: payload);
      return right(createdId);
    } on DioException catch (e) {
      return left(e.baseError);
    } on BaseError catch (e) {
      return left(e);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<TestMachineItem>>> getTestMachineByTable({
    required int testTableId,
  }) async {
    try {
      final res = await _service.getTestMachineByTable(
        testTableId: testTableId,
      );
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        // status != 1 nhưng data rỗng → coi như không có máy test.
        return right(<TestMachineItem>[]);
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
