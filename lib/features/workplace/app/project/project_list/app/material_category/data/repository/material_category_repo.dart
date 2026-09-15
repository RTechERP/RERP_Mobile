import 'package:dartz/dartz.dart';

import '../../../../../../../../../../base/network/errors/error.dart';
import '../datasource/model/material_category_model.dart';

abstract class MaterialCategoryRepo {
  Future<Either<BaseError, List<MaterialCategoryItem>>> getMaterialCategories({
    String keyword = '',
  });
}
