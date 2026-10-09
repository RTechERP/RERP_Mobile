import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';

import '../model/celebration_model.dart';

@injectable
class CelebrationService extends DioBaseApiService {
  CelebrationService(super.dio);

  /// Check birthday and seniority for the current user.
  Future<BaseData<CelebrationItem>> checkBirthdaySeniority() async {
    return get<BaseData<CelebrationItem>>(
      ApiEndPoint.checkBirthdaySeniority,
      parser: (json) => BaseData<CelebrationItem>.fromJson(
        json,
        (data) => CelebrationItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}
