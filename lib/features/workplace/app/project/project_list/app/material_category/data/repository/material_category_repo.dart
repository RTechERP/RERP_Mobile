import 'package:dartz/dartz.dart';

import '../../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/part_list_model.dart';

abstract class MaterialCategoryRepo {
  Future<Either<BaseError, List<PartListModel>>> getPartList({
    required int projectId,
    required int projectPartListVersionId,
    String keyword = '',
    int partlistTypeId = 8,
  });
}
