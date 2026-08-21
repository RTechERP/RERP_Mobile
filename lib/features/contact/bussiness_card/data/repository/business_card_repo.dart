import '../datasource/models/business_card_model.dart';

abstract class BusinessCardRepo {
  Future<List<BusinessCardModel>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  });
}
