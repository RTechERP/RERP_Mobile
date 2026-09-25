import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../datasource/models/business_card_model.dart';
import '../datasource/services/business_card_service.dart';
import 'business_card_repo.dart';

@LazySingleton(as: BusinessCardRepo)
class BusinessCardRepoImpl implements BusinessCardRepo {
  BusinessCardRepoImpl(this._service);

  final BusinessCardService _service;

  @override
  Future<Either<BaseError, List<BusinessCardModel>>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  }) async {
    try {
      final cards = await _service.getBusinessCards(
        departmentID: departmentID,
        keyword: keyword,
        isFavorite: isFavorite,
      );
      return right(cards);
    } catch (e) {
      return left(BaseError.httpUnknownError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, Map<String, String>>> scanBusinessCard(
    String imagePath,
  ) async {
    try {
      final baseData = await _service.scanBusinessCardImage(
        imagePath: imagePath,
      );

      // Kiểm tra status
      if (baseData.status == 1 && baseData.data != null) {
        final response = baseData.data!;
        
        // Convert to Map<String, String> for compatibility with UI
        final Map<String, String> result = {
          'NAME': response.name ?? '',
          'PHONE': response.phone ?? '',
          'EMAIL': response.email ?? '',
          'COMPANY': response.company ?? '',
          'ADDRESS': response.address ?? '',
          'POSITION': response.position ?? '',
          'WEBSITE': response.website ?? '',
        };

        return right(result);
      } else {
        final errorMsg = baseData.message ?? baseData.msg ?? 'Lỗi khi quét danh thiếp';
        return left(BaseError.httpUnknownError(errorMsg));
      }
    } catch (e) {
      return left(BaseError.httpUnknownError(e.toString()));
    }
  }

  @override
  Future<bool> isOllamaAvailable() async {
    // No longer needed - using backend API
    return true;
  }
}
