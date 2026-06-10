import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/newsfeed_model.dart';

@injectable
class NewsfeedService extends DioBaseApiService {
  NewsfeedService(super.dio);

  Future<BaseData<List<NewsletterItem>>> getNewsfeed() {
    return get<BaseData<List<NewsletterItem>>>(
      ApiEndPoint.getNewsletter,
      parser: (json) => BaseData<List<NewsletterItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => NewsletterItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}