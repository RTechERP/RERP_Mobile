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

  // Duyệt / huỷ duyệt / từ chối hàng loạt (Senior)
  Future<Either<BaseError, bool>> approveSenior({
    required List<ApproveTimesheetItem> items,
    required bool isApproved,
    required int seniorId,
  });

  // Senior từ chối hàng loạt kèm lý do (ghi DecilineApproveSenior + ReasonDecilineSenior).
  Future<Either<BaseError, bool>> declineSenior({
    required List<ApproveTimesheetItem> items,
    required int seniorId,
    required String reason,
  });

  // Duyệt / huỷ duyệt hàng loạt (TBP)
  Future<Either<BaseError, bool>> approveTBP({
    required List<ApproveTimesheetItem> items,
    required bool isApproved,
    int? approverEmployeeId,
  });

  // TBP từ chối hàng loạt kèm lý do (ghi DecilineApprove + ReasonDeciline).
  Future<Either<BaseError, bool>> declineTBP({
    required List<ApproveTimesheetItem> items,
    required String reason,
    int? approverEmployeeId,
  });
}