import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/approve_timesheet_model.dart';

abstract class ApproveTimesheetRepo{
  // Hàm lấy dữ liệu danh sách duyệt
  Future<Either<BaseError, List<ApproveTimesheetItem>>> getApproveTimesheet({
    required Map<String, dynamic> payload,
  });

  // Hàm lấy dữ liệu team người dùng
  Future<Either<BaseError, List<UserTeamItem>>> getApproveUserTeam();

  // Hàm lấy dữ liệu Senior
  Future<Either<BaseError, List<SeniorInfoItem>>> getApproveSeniorInfo();
}