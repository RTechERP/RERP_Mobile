import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/notification_model.dart';

@injectable
class MoreService extends DioBaseApiService {
  MoreService(super.dio);

  Future<BaseData<List<TypeNotiItem>>> getTypeNotification() {
    return get<BaseData<List<TypeNotiItem>>>(
      ApiEndPoint.getTypeNotification,
      parser: (json) => BaseData<List<TypeNotiItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => TypeNotiItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveNotificationType({
   required List<dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveNotificationType,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }
}
