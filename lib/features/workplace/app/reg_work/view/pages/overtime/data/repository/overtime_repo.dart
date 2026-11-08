import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/overtime_model.dart';

abstract class OvertimeRepo {
  Future<Either<BaseError, List<OvertimeItem>>> getOvertime({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<OvertimeType>>> getOvertimeType();

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, List<OvertimeProject>>> getOvertimeProject();

  /// Danh sách hạng mục công việc theo dự án.
  Future<Either<BaseError, List<OvertimeProjectItem>>> getProjectItemByUser({
    required int projectId,
    int status,
  });

  Future<Either<BaseError, void>> saveOvertime({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, OvertimeDetailResponse>> getOvertimeById(int id);

  /// Danh sách departmentID bắt buộc chọn hạng mục công việc khi đăng ký
  /// làm thêm — bổ sung cho danh sách hardcode phía app.
  Future<Either<BaseError, List<int>>> getDepartmentRequireProjectItem();

  Future<Either<BaseError, FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  });
}
