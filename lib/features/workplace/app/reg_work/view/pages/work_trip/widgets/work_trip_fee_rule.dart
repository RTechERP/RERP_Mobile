import 'work_trip_type.dart';

int tripFeeByType(String? type) {
  return switch (type) {
    WorkTripType.day => 100000,
    WorkTripType.night => 130000,
    WorkTripType.near => 60000,
    WorkTripType.far => 150000,
    WorkTripType.abroad => 922810,
    WorkTripType.under10km => 0,
    _ => 0,
  };
}