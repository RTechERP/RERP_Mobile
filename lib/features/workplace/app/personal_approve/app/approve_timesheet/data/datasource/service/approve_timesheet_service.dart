import 'package:injectable/injectable.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/approve_timesheet_model.dart';

@injectable
class ApproveTimeSheetService extends DioBaseApiService {
  ApproveTimeSheetService(super.dio);

  // Service lấy dữ liệu danh sách duyệt
  Future<BaseData<List<ApproveTimesheetItem>>> getApproveTimesheet({
    required Map<String, dynamic> payload,
  }) async {
    final body = payload;
    return post<BaseData<List<ApproveTimesheetItem>>>(
      ApiEndPoint.getApproveTimesheet,
      body: body,
      parser: (json) => BaseData<List<ApproveTimesheetItem>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => ApproveTimesheetItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  // Service lấy dữ liệu team của người dùng
  Future<BaseData<List<UserTeamItem>>> getApproveUserTeam() async {
    return get<BaseData<List<UserTeamItem>>>(
      ApiEndPoint.getApproveUserTeam,
      parser: (json) => BaseData<List<UserTeamItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => UserTeamItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  // Service lấy dữ liệu của Senior
  Future<BaseData<List<SeniorInfoItem>>> getApproveSeniorInfo() async{
    return get<BaseData<List<SeniorInfoItem>>>(
      ApiEndPoint.getApproveSeniorInfo,
        parser: (json) => BaseData<List<SeniorInfoItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => SeniorInfoItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  // Service duyệt / từ chối hàng loạt (Senior)
  Future<BaseData<void>> approveSenior({
    required List<Map<String, dynamic>> items,
    required bool isApproved,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.approveSeniorNew,
      body: {
        'Items': items,
        'IsApproved': isApproved,
      },
      parser: (json) => BaseData.fromJson(json, (_) {}),
    );
  }
}
