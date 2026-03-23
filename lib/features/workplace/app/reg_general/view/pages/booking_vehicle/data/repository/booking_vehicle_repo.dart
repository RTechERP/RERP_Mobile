import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';

import '../../../../../../../../../base/network/errors/error.dart';

abstract class BookingVehicleRepo {
  Future<Either<BaseError, List<BookingVehicleItem>>> getBookingVehicle({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<ProvinceArrivesItem>>> getProvinceArrives({
    required int employeeId,
  });

  Future<Either<BaseError, List<ProvinceDepartureItem>>> getProvinceDeparture({
    required int employeeId,
  });

  Future<Either<BaseError, List<BookingVehicleProjectItem>>> getProject();

  Future<Either<BaseError, List<ApproverItem>>> getApprover();

  Future<Either<BaseError, List<BookingVehiclePersonalItem>>> getEmployee();

  Future<Either<BaseError, BookingVehiclePersonalItem>> getEmployeeById({
    required int employeeId,
  });

  Future<Either<BaseError, BookingVehicleItem>> createBookingVehicle({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, void>> uploadBookingVehicleFile({
    required int vehicleBookingId,
    required PlatformFile file,
    required String subPath,
  });
}
