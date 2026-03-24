/// Tên field thuộc nhóm Form chung (các widget TypeForm*). Mọi key khác trong
/// FormBuilder được coi là Info (theo dòng: passenger_*, receiver_*, …).
const Set<String> kBookingVehicleFormFieldNames = {
  'booking_type',
  'booking_type_text',
  'project',
  'time_need_present',
  'location_address',
  'provinces',
  'address',
  'time_depart',
  'time_return',
  'starting_point',
  'return_point',
  'destination_address',
  'return_address',
  'type_transport',
  'pickup_project',
  'pickup_departure_time',
  'pickup_need_arrive_time',
  'pickup_company',
  'pickup_province',
  'pickup_address',
};

/// Tách [raw] (thường là `FormBuilderState.value`) thành map Form / Info.
({Map<String, dynamic> form, Map<String, dynamic> info})
splitBookingVehicleFormAndInfo(Map<String, dynamic> raw) {
  final form = <String, dynamic>{};
  final info = <String, dynamic>{};
  for (final e in raw.entries) {
    if (kBookingVehicleFormFieldNames.contains(e.key)) {
      form[e.key] = e.value;
    } else {
      info[e.key] = e.value;
    }
  }
  return (form: form, info: info);
}
