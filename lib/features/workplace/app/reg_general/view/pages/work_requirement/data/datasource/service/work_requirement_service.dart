import 'package:injectable/injectable.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../../../../../../../reports/data/datasource/models/report_model.dart';
import '../models/work_requirement_model.dart';

@injectable
class WorkRequirementService extends DioBaseApiService {
  WorkRequirementService(super.dio);

  Future<BaseData<List<WorkRequirementItem>>> getWorkRequirement({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<WorkRequirementItem>>>(
      ApiEndPoint.getWorkRequirement,
      body: payload,
      parser: (json) =>
          _parseList<WorkRequirementItem>(json, WorkRequirementItem.fromJson),
    );
  }

  Future<BaseData<WorkRequirementSaveResponse>> saveWorkRequirement({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<WorkRequirementSaveResponse>>(
      ApiEndPoint.saveWorkRequirement,
      body: payload,
      parser: (json) => BaseData<WorkRequirementSaveResponse>.fromJson(
        json,
        (data) =>
            WorkRequirementSaveResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<List<DepartResponse>>> getDepartments() async {
    return get<BaseData<List<DepartResponse>>>(
      ApiEndPoint.getWorkRequirementDepartment,
      parser: (json) =>
          _parseList<DepartResponse>(json, DepartResponse.fromJson),
    );
  }

  Future<BaseData<List<WorkRequirementApproverItem>>> getApprovers() async {
    return get<BaseData<List<WorkRequirementApproverItem>>>(
      ApiEndPoint.getWorkRequirementApprover,
      parser: (json) => _parseApprovers(json),
    );
  }

  BaseData<List<WorkRequirementApproverItem>> _parseApprovers(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return BaseData<List<WorkRequirementApproverItem>>.fromJson({
        'status': 0,
        'message': 'Invalid response',
      }, (_) => []);
    }
    final data = json['data'];
    if (data is Map<String, dynamic>) {
      final approversList = data['approvers'];
      if (approversList is List) {
        final items = <WorkRequirementApproverItem>[];
        for (final e in approversList) {
          if (e is Map<String, dynamic>) {
            items.add(WorkRequirementApproverItem.fromJson(e));
          }
        }
        return BaseData<List<WorkRequirementApproverItem>>.fromJson(
          json,
          (_) => items,
        );
      }
    }
    return BaseData<List<WorkRequirementApproverItem>>.fromJson(
      json,
      (_) => [],
    );
  }

  /// Parse response - ho tro ca khi data la List hoac Map.
  BaseData<List<T>> _parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return BaseData<List<T>>.fromJson(json as Map<String, dynamic>, (data) {
      if (data is List) {
        return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
      }
      if (data is Map) {
        final items = (data as Map<String, dynamic>).values
            .whereType<List>()
            .expand((e) => e)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList();
        if (items.isNotEmpty) return items;
      }
      return <T>[];
    });
  }
}
