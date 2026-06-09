import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/poll_model.dart';

@injectable
class PollService extends DioBaseApiService {
  PollService(super.dio);

  Future<BaseData<List<PollItem>>> getPolls() {
    return get<BaseData<List<PollItem>>>(
      ApiEndPoint.getPolls,
      parser: (json) => BaseData<List<PollItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => PollItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<PollDetailItem>> getPollDetail({
    required int pollFormId,
  }) {
    return get<BaseData<PollDetailItem>>(
      '${ApiEndPoint.getDetailPoll}/$pollFormId',
      parser: (json) => BaseData<PollDetailItem>.fromJson(
        json,
        (data) => PollDetailItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<ResponseItem>> getMyResponse({
    required int pollFormId,
  }) {
    return get<BaseData<ResponseItem>>(
      '${ApiEndPoint.getPollMyResponse}/$pollFormId/my-response',
      parser: (json) => BaseData<ResponseItem>.fromJson(
        json,
        (data) => ResponseItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}
