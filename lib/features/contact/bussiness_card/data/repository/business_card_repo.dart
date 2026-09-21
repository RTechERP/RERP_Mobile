import 'package:dartz/dartz.dart';

import '../../../../../base/network/errors/error.dart';
import '../datasource/models/business_card_model.dart';

abstract class BusinessCardRepo {
  Future<Either<BaseError, List<BusinessCardModel>>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  });

  /// Trích xuất thông tin danh thiếp từ ảnh qua Ollama vision.
  Future<Either<BaseError, Map<String, String>>> scanBusinessCard(
    String imagePath,
  );

  /// Kiểm tra Ollama có đang online và model có sẵn không.
  Future<bool> isOllamaAvailable();
}
