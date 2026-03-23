import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/booking_vehicle_model.dart';

@injectable
class BookingVehicleService extends DioBaseApiService {
  BookingVehicleService(super.dio);
  Future<BaseData<List<BookingVehicleItem>>> getBookingVehicle({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<BookingVehicleItem>>>(
      ApiEndPoint.getBookingVehicle,
      body: payload,
      parser: (json) => BaseData<List<BookingVehicleItem>>.fromJson(json, (
        data,
      ) {
        final map = data as Map<String, dynamic>;
        final list = map['data'] as List;

        return list
            .map((e) => BookingVehicleItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  Future<BaseData<List<ProvinceArrivesItem>>> getProvinceArrives({
    required int employeeId,
  }) {
    return get<BaseData<List<ProvinceArrivesItem>>>(
      ApiEndPoint.getProvinceArrives,
      query: {'employeeId': employeeId},
      parser: (json) => BaseData<List<ProvinceArrivesItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ProvinceArrivesItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<ProvinceDepartureItem>>> getProvinceDeparture({
    required int employeeId,
  }) {
    return get<BaseData<List<ProvinceDepartureItem>>>(
      ApiEndPoint.getProvinceDeparture,
      query: {'employeeId': employeeId},
      parser: (json) => BaseData<List<ProvinceDepartureItem>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => ProvinceDepartureItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<BookingVehicleProjectItem>>> getProject() {
    return get<BaseData<List<BookingVehicleProjectItem>>>(
      ApiEndPoint.getBookingVehicleProject,
      parser: (json) => BaseData<List<BookingVehicleProjectItem>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) =>
                  BookingVehicleProjectItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<ApproverItem>>> getApprover() {
    return get<BaseData<List<ApproverItem>>>(
      ApiEndPoint.getBookingVehicleApprover,
      parser: (json) => BaseData<List<ApproverItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ApproverItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<BookingVehiclePersonalItem>>> getEmployee() {
    return get<BaseData<List<BookingVehiclePersonalItem>>>(
      ApiEndPoint.getBookingVehicleEmployee,
      parser: (json) => BaseData<List<BookingVehiclePersonalItem>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => BookingVehiclePersonalItem.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<BookingVehiclePersonalItem>> getEmployeeById({
    required int employeeId,
  }) {
    return get<BaseData<BookingVehiclePersonalItem>>(
      ApiEndPoint.getBookingVehicleEmployeeById,
      query: {'employeeId': employeeId},
      parser: (json) => BaseData<BookingVehiclePersonalItem>.fromJson(
        json,
        (data) =>
            BookingVehiclePersonalItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<BookingVehicleItem>> createBookingVehicle({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<BookingVehicleItem>>(
      ApiEndPoint.createBookingVehicle,
      body: payload,
      parser: (json) => BaseData<BookingVehicleItem>.fromJson(
        json,
            (data) => BookingVehicleItem.fromJson(
          data as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// `POST .../upload-file?vehicleBookingId=` + multipart: [Key], [subPath], [file].
  Future<BaseData<void>> uploadBookingVehicleFile({
    required int vehicleBookingId,
    required PlatformFile file,
    required String subPath,
  }) async {
    late final MultipartFile part;
    final path = file.path;
    if (path != null && path.trim().isNotEmpty) {
      part = await MultipartFile.fromFile(path, filename: file.name);
    } else if (file.bytes != null) {
      part = MultipartFile.fromBytes(file.bytes!, filename: file.name);
    } else {
      throw ArgumentError('PlatformFile has no path or bytes');
    }

    final formData = FormData.fromMap(<String, dynamic>{
      'Key': BookingVehicleUploadForm.keyFieldValue,
      'subPath': subPath,
      'file': part,
    });

    debugPrint(
      '[BookingVehicleService] upload-file → POST ${ApiEndPoint.uploadBookingVehicleFile} '
      '?vehicleBookingId=$vehicleBookingId key=${BookingVehicleUploadForm.keyFieldValue} '
      'subPath=$subPath file="${file.name}" size=${file.size}',
    );

    final res = await post<BaseData<void>>(
      ApiEndPoint.uploadBookingVehicleFile,
      query: {'vehicleBookingId': vehicleBookingId},
      body: formData,
      parser: (json) =>
          BaseData<void>.fromJson(json as Map<String, dynamic>, (_) => null),
    );

    debugPrint(
      '[BookingVehicleService] upload-file ← status=${res.status} message=${res.message} msg=${res.msg}',
    );

    return res;
  }
}
