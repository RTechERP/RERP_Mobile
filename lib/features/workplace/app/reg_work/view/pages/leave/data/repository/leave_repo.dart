import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/leave_model.dart';

abstract class LeaveRepo{
  Future<Either<BaseError, List<LeaveItem>>> getLeave({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<LeaveTimeItem>>> getLeaveTimeItem({
    required DateTime dateStart,
    required int employeeId,
  });

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, LeavePhaseMultiDto>> getLeavePhaseMulti({
    required int phaseId,
  });

  Future<Either<BaseError, void>> saveMultiLeave({
    required Map<String, dynamic> payload,
  });
  Future<Either<BaseError, void>> saveLeave({
    required Map<String, dynamic> payload,
  });

}