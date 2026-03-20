import 'package:dartz/dartz.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';

import '../../../../../../../../../base/network/errors/error.dart';

abstract class BookingVehicleRepo {
  Future<Either<BaseError, List<BookingVehicleItem>>> getBookingVehicle({
    required Map<String, dynamic> payload,
  });
}
