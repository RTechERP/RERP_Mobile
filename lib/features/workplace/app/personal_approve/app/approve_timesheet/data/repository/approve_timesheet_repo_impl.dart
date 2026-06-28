import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/approve_timesheet_model.dart';
import '../datasource/service/approve_timesheet_service.dart';
import 'approve_timesheet_repo.dart';

@LazySingleton(as: ApproveTimesheetRepo)
class ApproveTimesheetRepoImpl implements ApproveTimesheetRepo {
  final ApproveTimeSheetService _service;
  ApproveTimesheetRepoImpl(this._service);

  // Call API lấy dữ liệu danh sách duyệt
  @override
  Future<Either<BaseError, List<ApproveTimesheetItem>>> getApproveTimesheet({
    required Map<String, dynamic> payload,
  }) async {
    try{
      final res = await _service.getApproveTimesheet(payload: payload);
      if(res.status == 1 && res.data != null){
        return right(res.data!);
      }else{
        return left(BaseError.httpInternalServerError(res.message ?? 'Lấy dữ liệu thất bại'));
      }
    }on DioException catch(e){
      return left(e.baseError);
    }
  }

  // Call API lấy dữ liệu team người dùng
  @override
  Future<Either<BaseError, List<UserTeamItem>>> getApproveUserTeam() async{
    try{
      final res = await _service.getApproveUserTeam();
      if(res.status == 1 && res.data != null){
        return right(res.data!);
      }else{
        return left(BaseError.httpInternalServerError(res.message ?? 'Lấy dữ liệu thất bại'));
      }
    }on DioException catch(e) {
      return left(e.baseError);
    }
  }

  // Call API lấy dữ liệu Senior
  @override
  Future<Either<BaseError, List<SeniorInfoItem>>> getApproveSeniorInfo() async{
    try{
      final res = await _service.getApproveSeniorInfo();
      if(res.status == 1 && res.data != null){
        return right(res.data!);
      }else{
        return left(BaseError.httpInternalServerError(res.message ?? 'Lấy dữ liệu thất bại'));
      }
    }on DioException catch(e) {
      return left(e.baseError);
    }
  }
}
