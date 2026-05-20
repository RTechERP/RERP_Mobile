import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../features/workplace/app/reports/data/datasource/models/report_model.dart';
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

  @override
  Future<Either<BaseError, List<TypeDocumentResponseItem>>> getDocumentType({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getDocumentType(payload: payload);

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, Map<String, dynamic>>> saveContract({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveContract(payload: payload);

      final status = res['status'] ?? 0;
      if (status == 1) {
        return right(res);
      }

      return left(
        BaseError.httpInternalServerError(
          res['message'] ?? res['msg'] ?? 'Lưu dữ liệu thất bại',
        ),
      );
    } catch (e) {
      return left(BaseError.httpUnknownError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<TaxCompanyResponseItem>>> getTaxCompany({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getTaxCompany(payload: payload);

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<UserResponse>>> getReceiver() async {
    try {
      final res = await _service.getReceiver();

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, DetailContractResponseItem>> getContractById({
    required int id,
  }) async {
    try {
      final res = await _service.getContractById(id: id);

      if (res.data == null) {
        return left(
          BaseError.httpInternalServerError('Không tìm thấy dữ liệu hợp đồng'),
        );
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String>> sendEmailNewContract({
    required int registerContractId,
  }) async {
    try {
      final res = await _service.sendEmailNewContract(
        registerContractId: registerContractId,
      );

      final status = res['status'] ?? 0;
      if (status == 1) {
        return right(res['message'] ?? 'Gửi email thành công');
      }

      return left(
        BaseError.httpInternalServerError(
          res['message'] ?? res['msg'] ?? 'Gửi email thất bại',
        ),
      );
    } catch (e) {
      return left(BaseError.httpUnknownError(e.toString()));
    }
  }
}
