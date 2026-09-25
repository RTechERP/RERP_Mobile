import 'package:dartz/dartz.dart';

import '../../../../../base/network/errors/error.dart';
import '../datasource/models/business_card_model.dart';

abstract class BusinessCardRepo {
  Future<Either<BaseError, List<BusinessCardModel>>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  });

  /// Trích xuất thông tin danh thiếp từ ảnh qua API /rio/scan-business-card.
  Future<Either<BaseError, Map<String, String>>> scanBusinessCard(
    String imagePath,
  );

  /// Kiểm tra service có sẵn sàng không (luôn true với backend API).
  Future<bool> isOllamaAvailable();
}
