import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/contract_registration_model.dart';
import '../datasource/service/contract_registration_service.dart';
import 'contract_registration_repo.dart';

@LazySingleton(as: ContractRegistrationRepo)
class ContractRegistrationRepoImpl implements ContractRegistrationRepo {
  final ContractRegistrationService _service;

  ContractRegistrationRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ContractResponseItem>>> getContract({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getContract(payload: payload);

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      print('Hop dong: ${e.response?.data}');

      return left(e.baseError);
    }
  }
}
