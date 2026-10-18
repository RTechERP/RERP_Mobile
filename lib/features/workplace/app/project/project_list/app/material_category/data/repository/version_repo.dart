import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/version_model.dart';

/// Repository interface cho Phiên bản (Version).
abstract class VersionRepo {
  /// Lấy danh sách phiên bản theo projectSolutionId.
  /// Trả về cặp: versions giải pháp (isPO=false) và versions PO (isPO=true).
  Future<Either<BaseError, ({List<VersionModel> solutionVersions, List<VersionModel> poVersions})>>
      getVersions(int projectSolutionId);
}
