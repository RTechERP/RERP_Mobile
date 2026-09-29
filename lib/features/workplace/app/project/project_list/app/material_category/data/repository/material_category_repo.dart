import 'package:dartz/dartz.dart';

import '../../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/part_list_model.dart';

abstract class MaterialCategoryRepo {
  Future<Either<BaseError, List<PartListModel>>> getPartList({
    required int projectId,
    required int projectPartListVersionId,
    required int projectTypeId,
    String keyword = '',
  });

  /// Huỷ duyệt mới (TBP) cho 1 vật tư.
  /// Trả về [Unit] khi thành công, [BaseError] khi thất bại.
  Future<Either<BaseError, Unit>> cancelApproveNew(PartListModel item);
}
