import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../../features/workplace/app/reports/data/datasource/models/report_model.dart';
import '../datasource/models/contract_registration_model.dart';

abstract class ContractRegistrationRepo {
  Future<Either<BaseError, List<ContractResponseItem>>> getContract({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<TypeDocumentResponseItem>>> getDocumentType({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, Map<String, dynamic>>> saveContract({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<TaxCompanyResponseItem>>> getTaxCompany({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<UserResponse>>> getReceiver();

  Future<Either<BaseError, DetailContractResponseItem>> getContractById({
    required int id,
  });

  Future<Either<BaseError, String>> sendEmailNewContract({
    required int registerContractId,
  });

  Future<Either<BaseError, String>> approveOrCancel({
    required int id,
    required int status,
    required String reasonCancel,
  });
}
