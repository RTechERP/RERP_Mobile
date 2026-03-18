import 'package:injectable/injectable.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../../../../../../../reports/data/datasource/models/report_model.dart';
import '../models/meeting_room_model.dart';

@injectable
class MeetingRoomService extends DioBaseApiService {
  MeetingRoomService(super.dio);

  Future<BaseData<MeetingRoomData>> getMeetingRoom({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    String fmt(DateTime d) => '${d.year}-${d.month}-${d.day}';

    final query = {
      'DateStart': fmt(dateStart),
      'DateEnd': fmt(dateEnd),
    };

    return post<BaseData<MeetingRoomData>>(
      ApiEndPoint.getMeetingRoom,
      query: query,
      parser: (json) => BaseData<MeetingRoomData>.fromJson(
        json,
            (data) {
          if (data == null) {
            throw Exception('MeetingRoom data is null');
          }
          return MeetingRoomData.fromJson(
            data as Map<String, dynamic>,
          );
        },
      ),
    );
  }

  Future<BaseData<MeetingRoomSaveResponse>> saveMeetingRoom({
    required Map<String, dynamic> payload,
  }) async {
    final body = payload;

    return post<BaseData<MeetingRoomSaveResponse>>(
      ApiEndPoint.saveMeetingRoom,
      body: body,
      parser: (json) => BaseData<MeetingRoomSaveResponse>.fromJson(
        json,
            (data) => MeetingRoomSaveResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<List<DepartResponse>>> getDepart() {
    return get<BaseData<List<DepartResponse>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<DepartResponse>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => DepartResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<MeetingRoomSaveResponse>> getRoomById({required int id}) {
    return get<BaseData<MeetingRoomSaveResponse>>(
      ApiEndPoint.getDetailMeetingRoom,
      query: {'id': id},
      parser: (json) => BaseData<MeetingRoomSaveResponse>.fromJson(
        json,
            (data) => MeetingRoomSaveResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}