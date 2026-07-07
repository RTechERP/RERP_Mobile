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

  // Duyệt / huỷ duyệt / từ chối hàng loạt (Senior)
  @override
  Future<Either<BaseError, bool>> approveSenior({
    required List<ApproveTimesheetItem> items,
    required bool isApproved,
    required int seniorId,
  }) async {
    try {
      final now = DateTime.now().toUtc();
      final payloadItems = items.map((item) {
        return {
          'Id': item.id,
          'TableName': item.tableName ?? kApproveTimesheetTypeMap[item.tType ?? 0]?.tableName,
          'FieldName': 'IsSeniorApproved',
          'FullName': item.fullName,
          'DeleteFlag': false,
          'IsApprovedHR': false,
          'IsCancelRegister': -1,
          'IsApprovedTP': false,
          'IsApprovedBGD': null,
          'IsSeniorApproved': isApproved,
          'ValueUpdatedDate': now.toIso8601String(),
          'ValueDecilineApprove': isApproved ? '1' : '1',
          'EvaluateResults': item.evaluateResults ?? '',
          'EmployeeID': item.employeeId,
          'TType': item.tType,
          'ApprovedSeniorID': seniorId,
        };
      }).toList();

      final res = await _service.approveSenior(
        items: payloadItems,
        isApproved: isApproved,
      );
      if (res.status == 1) {
        return right(true);
      } else {
        return left(BaseError.httpInternalServerError(res.message ?? 'Thao tác thất bại'));
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  // Senior từ chối hàng loạt kèm lý do (DecilineApproveSenior=2, ReasonDecilineSenior)
  @override
  Future<Either<BaseError, bool>> declineSenior({
    required List<ApproveTimesheetItem> items,
    required int seniorId,
    required String reason,
  }) async {
    try {
      final now = DateTime.now().toUtc();
      final payloadItems = items.map((item) {
        return {
          'Id': item.id,
          'TableName': item.tableName ?? kApproveTimesheetTypeMap[item.tType ?? 0]?.tableName,
          'FieldName': 'IsSeniorApproved',
          'FullName': item.fullName,
          'DeleteFlag': false,
          'IsApprovedHR': false,
          'IsCancelRegister': -1,
          'IsApprovedTP': false,
          'IsApprovedBGD': null,
          'IsSeniorApproved': false,
          'ValueUpdatedDate': now.toIso8601String(),
          'ValueDecilineApprove': '1',
          'EvaluateResults': item.evaluateResults ?? '',
          'EmployeeID': item.employeeId,
          'TType': item.tType,
          'ApprovedSeniorID': seniorId,
          'DecilineApproveSenior': 2,
          'ReasonDecilineSenior': reason,
        };
      }).toList();

      final res = await _service.approveSenior(
        items: payloadItems,
        isApproved: false,
      );
      if (res.status == 1) {
        return right(true);
      } else {
        return left(BaseError.httpInternalServerError(res.message ?? 'Thao tác thất bại'));
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  // Duyệt / huỷ duyệt hàng loạt (TBP)
  // FieldName = IsApproved, ghi IDApprovedTP = approverEmployeeId.
  @override
  Future<Either<BaseError, bool>> approveTBP({
    required List<ApproveTimesheetItem> items,
    required bool isApproved,
    int? approverEmployeeId,
  }) async {
    try {
      final now = DateTime.now().toUtc();
      final payloadItems = items.map((item) {
        return {
          'Id': item.id,
          'TableName': item.tableName ?? kApproveTimesheetTypeMap[item.tType ?? 0]?.tableName,
          'FieldName': 'IsApproved',
          'FullName': item.fullName,
          'DeleteFlag': false,
          'IsApprovedHR': false,
          'IsCancelRegister': -1,
          'IsApprovedTP': isApproved,
          'IsApprovedBGD': null,
          'IsSeniorApproved': true,
          'ValueUpdatedDate': now.toIso8601String(),
          'ValueDecilineApprove': '1',
          'EvaluateResults': '',
          'EmployeeID': item.employeeId,
          'TType': item.tType,
          if (approverEmployeeId != null) 'IDApprovedTP': approverEmployeeId,
        };
      }).toList();

      final res = await _service.approveTBP(
        items: payloadItems,
        isApproved: isApproved,
      );
      if (res.status == 1) {
        return right(true);
      } else {
        return left(BaseError.httpInternalServerError(res.message ?? 'Thao tác thất bại'));
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  // TBP từ chối hàng loạt kèm lý do (DecilineApprove=2, ReasonDeciline).
  @override
  Future<Either<BaseError, bool>> declineTBP({
    required List<ApproveTimesheetItem> items,
    required String reason,
    int? approverEmployeeId,
  }) async {
    try {
      final now = DateTime.now().toUtc();
      final payloadItems = items.map((item) {
        return {
          'Id': item.id,
          'TableName': item.tableName ?? kApproveTimesheetTypeMap[item.tType ?? 0]?.tableName,
          'FieldName': 'IsApproved',
          'FullName': item.fullName,
          'DeleteFlag': false,
          'IsApprovedHR': false,
          'IsCancelRegister': -1,
          'IsApprovedTP': false,
          'IsApprovedBGD': null,
          'IsSeniorApproved': true,
          'ValueUpdatedDate': now.toIso8601String(),
          'ValueDecilineApprove': '1',
          'EvaluateResults': '',
          'EmployeeID': item.employeeId,
          'TType': item.tType,
          if (approverEmployeeId != null) 'IDApprovedTP': approverEmployeeId,
          'DecilineApprove': 2,
          'ReasonDeciline': reason,
        };
      }).toList();

      final res = await _service.approveTBP(
        items: payloadItems,
        isApproved: false,
      );
      if (res.status == 1) {
        return right(true);
      } else {
        return left(BaseError.httpInternalServerError(res.message ?? 'Thao tác thất bại'));
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
