import 'package:injectable/injectable.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../../../../../../../../../../features/workplace/app/reports/data/datasource/models/report_model.dart';
import '../models/contract_registration_model.dart';

@injectable
class ContractRegistrationService extends DioBaseApiService {
  ContractRegistrationService(super.dio);

  Future<BaseData<List<ContractResponseItem>>> getContract({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<ContractResponseItem>>>(
      ApiEndPoint.getContract,
      body: payload,
      parser: (json) => _parseList<ContractResponseItem>(
        json,
        ContractResponseItem.fromJson,
      ),
    );
  }

  Future<BaseData<List<TypeDocumentResponseItem>>> getDocumentType({
    required Map<String, dynamic> payload,
  }) async {
    return get<BaseData<List<TypeDocumentResponseItem>>>(
      ApiEndPoint.getDocumentType,
      parser: (json) => _parseList<TypeDocumentResponseItem>(
        json,
        TypeDocumentResponseItem.fromJson,
      ),
    );
  }

  Future<Map<String, dynamic>> saveContract({
    required Map<String, dynamic> payload,
  }) async {
    final res = await dio.post(
      ApiEndPoint.saveContract,
      data: payload,
    );
    return res.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> sendEmailNewContract({
    required int registerContractId,
  }) async {
    final res = await dio.post(
      ApiEndPoint.sendEmailNewContract,
      data: {'RegisterContractID': registerContractId},
    );
    return res.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> approveOrCancel({
    required int id,
    required int status,
    required String reasonCancel,
  }) async {
    final res = await dio.post(
      ApiEndPoint.approveOrCancel,
      data: {
        'ID': id,
        'Status': status,
        'ReasonCancel': reasonCancel,
      },
    );
    return res.data as Map<String, dynamic>;
  }

  Future<BaseData<List<TaxCompanyResponseItem>>> getTaxCompany({
    required Map<String, dynamic> payload,
  }) async {
    return get<BaseData<List<TaxCompanyResponseItem>>>(
      ApiEndPoint.getTaxCompany,
      parser: (json) => _parseList<TaxCompanyResponseItem>(
        json,
        TaxCompanyResponseItem.fromJson,
      ),
    );
  }

  Future<BaseData<List<UserResponse>>> getReceiver() {
    return get<BaseData<List<UserResponse>>>(
      ApiEndPoint.getUserMeetingRoom,
      parser: (json) => BaseData<List<UserResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<DetailContractResponseItem>> getContractById({
    required int id,
  }) {
    return get<BaseData<DetailContractResponseItem>>(
      '${ApiEndPoint.getContractById}?id=$id',
      parser: (json) => BaseData<DetailContractResponseItem>.fromJson(
        json as Map<String, dynamic>,
        (data) => DetailContractResponseItem.fromJson(
          data is Map<String, dynamic> ? data : {},
        ),
      ),
    );
  }

  /// Parse response - hỗ trợ cả khi data là List hoặc Map.
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

    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
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
      },
    );
  }
}
