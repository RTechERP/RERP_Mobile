import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/meeting_room/data/datasource/models/meeting_room_model.dart';
import 'package:rtc_erp/features/workplace/app/reports/data/datasource/models/report_model.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/service/meeting_room_service.dart';
import 'meeting_room_repo.dart';

@LazySingleton(as: MeetingRoomRepo)
class MeetingRoomRepoImpl implements MeetingRoomRepo {
  final MeetingRoomService _service;

  MeetingRoomRepoImpl(this._service);

  @override
  Future<Either<BaseError, MeetingRoomData>> getMeetingRoom({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    try {
      final res = await _service.getMeetingRoom(
        dateStart: dateStart,
        dateEnd: dateEnd,
      );

      if (res.data == null) {
        return left(BaseError.httpInternalServerError('Không có lịch họp'));
      }

      return right(res.data!);
    } on DioException catch (e) {
      print('Lịch họp: ${e.response?.data}');

      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, MeetingRoomSaveResponse>> saveMeetingRoom({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveMeetingRoom(payload: payload);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<DepartResponse>>> getDepart() async {
    try {
      final res = await _service.getDepart();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, MeetingRoomSaveResponse>> getRoomById({
    required int id,
  }) async {
    try {
      final res = await _service.getRoomById(id: id);
      return right(res.data!); // DetailReportResponse
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
