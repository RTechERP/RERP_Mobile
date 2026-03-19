import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../datasource/models/meeting_room_model.dart';


abstract class MeetingRoomRepo {
  Future<Either<BaseError, MeetingRoomData>> getMeetingRoom({
    required DateTime dateStart,
    required DateTime dateEnd,
  });

  Future<Either<BaseError, MeetingRoomSaveResponse>> saveMeetingRoom({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<DepartResponse>>> getDepart();

  Future<Either<BaseError, MeetingRoomSaveResponse>> getRoomById({
    required int id,
  });

  Future<Either<BaseError, List<UserResponse>>> getUserMeetingRoom();
}
