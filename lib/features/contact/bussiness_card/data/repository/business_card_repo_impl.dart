import 'package:injectable/injectable.dart';

import '../datasource/models/business_card_model.dart';
import '../datasource/services/business_card_service.dart';
import 'business_card_repo.dart';

@LazySingleton(as: BusinessCardRepo)
class BusinessCardRepoImpl implements BusinessCardRepo {
  final BusinessCardService _service;

  BusinessCardRepoImpl(this._service);

  @override
  Future<List<BusinessCardModel>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  }) async {
    return _service.getBusinessCards(
      departmentID: departmentID,
      keyword: keyword,
      isFavorite: isFavorite,
    );
  }
}
