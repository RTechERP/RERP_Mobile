/// Tên field thuộc nhóm Form chung (các widget TypeForm*). Mọi key khác trong
/// FormBuilder được coi là Info (theo dòng: passenger_*, receiver_*, …).
const Set<String> kBookingVehicleFormFieldNames = {
  'booking_type',
  'booking_type_text',
  'project',
  'time_need_present',
  'location_address',
  'location_address_text',
  'provinces',
  'address',
  'address_text',
  'time_depart',
  'time_return',
  'starting_point',
  'return_point',
  'destination_address',
  'return_address',
  'type_transport',
  'type_transport_text',
  'pickup_project',
  'pickup_departure_time',
  'pickup_need_arrive_time',
  'pickup_company',
  'pickup_company_text',
  'pickup_province',
  'pickup_address',
  'pickup_address_text',
  'approver',
  'approver_text',
  'approver_field',
  'problem_rule_reason',
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
