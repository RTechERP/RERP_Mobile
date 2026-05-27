import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../datasource/models/work_requirement_model.dart';

abstract class WorkRequirementRepo {
  Future<Either<BaseError, List<WorkRequirementItem>>> getWorkRequirement({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, WorkRequirementSaveResponse>> saveWorkRequirement({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<DepartResponse>>> getDepartments();

  Future<Either<BaseError, List<WorkRequirementApproverItem>>> getApprovers();

  Future<Either<BaseError, WorkRequirementDetailData>> getWorkRequirementDetail(int id);

  Future<Either<BaseError, void>> deleteWorkRequirement(List<int> ids);

  Future<Either<BaseError, void>> editWorkRequirement({
    required int id,
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<UploadFileResponse>>> uploadFile({
    required List<File> files,
    required String key,
    required String subPath,
  });
}
