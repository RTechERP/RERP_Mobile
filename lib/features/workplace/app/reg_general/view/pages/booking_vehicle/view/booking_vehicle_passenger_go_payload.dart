import 'package:intl/intl.dart';

import '../data/datasource/models/booking_vehicle_model.dart';
import 'booking_vehicle_api_categories.dart';

const String _otherPointLabel = 'Khác';

String _trimStr(dynamic v) {
  if (v == null) return '';
  if (v is String) return v.trim();
  return v.toString().trim();
}

/// Dùng khi đọc giá trị từ [FormBuilder] (kiểu không đồng nhất).
String bookingVehicleTrimFormValue(dynamic v) => _trimStr(v);

String? _formatApiDateTime(dynamic v) {
  if (v == null) return null;
  if (v is DateTime) {
    return DateFormat("yyyy-MM-dd'T'HH:mm").format(v);
  }
  if (v is String) {
    final t = v.trim();
    if (t.isEmpty) return null;
    return t;
  }
  return null;
}

/// Dùng khi validate trước submit (Bloc).
String? bookingVehicleFormatApiDateTime(dynamic v) =>
    _formatApiDateTime(v);

int _vehicleTypeFromLabel(String? label) {
  final s = (label ?? '').toLowerCase();
  if (s.contains('máy bay')) return 2;
  return 1;
}

int resolveBookingVehicleProjectId(
  String? projectDisplay,
  List<BookingVehicleProjectItem> projects,
) {
  final line = _trimStr(projectDisplay);
  if (line.isEmpty) return 0;
  for (final p in projects) {
    final display =
        '${p.projectCode ?? ''} - ${p.projectName ?? ''}'.trim();
    if (display == line) return p.id;
    if (_trimStr(p.projectName) == line) return p.id;
    if (_trimStr(p.projectCode) == line) return p.id;
  }
  return 0;
}

int resolvePassengerEmployeeIdFromCode(
  String? code,
  List<BookingVehiclePersonalItem> employees,
) {
  final c = _trimStr(code);
  if (c.isEmpty) return 0;
  for (final e in employees) {
    if (_trimStr(e.code) == c) return e.id;
  }
  return 0;
}

int departureAddressStatusFromStartingPoint(dynamic startingPoint) {
  final s = _trimStr(startingPoint);
  if (s.isEmpty || s == _otherPointLabel) return 0;
  return 1;
}

int departureAddressStatusFromReturnPoint(dynamic returnPoint) {
  final s = _trimStr(returnPoint);
  if (s.isEmpty || s == _otherPointLabel) return 0;
  return 1;
}

String departureAddressFromForm(Map<String, dynamic> form) {
  final dest = _trimStr(form['destination_address']);
  if (dest.isNotEmpty) return dest;
  return _trimStr(form['starting_point']);
}

/// Form **Người về**: điểm đón — `return_address` hoặc `return_point`.
String departureAddressFromReturnForm(Map<String, dynamic> form) {
  final addr = _trimStr(form['return_address']);
  if (addr.isNotEmpty) return addr;
  return _trimStr(form['return_point']);
}

/// Một bản ghi API / create — gọi lặp theo từng dòng người đi.
Map<String, dynamic> buildPassengerGoCreatePayload({
  required Map<String, dynamic> form,
  required int passengerIndex,
  required int bookerEmployeeId,
  required String bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
}) {
  final projectId = resolveBookingVehicleProjectId(form['project'], projects);
  final passengerCode = _trimStr(form['passenger_code_$passengerIndex']);
  final passengerEmployeeId = resolvePassengerEmployeeIdFromCode(
    passengerCode,
    employees,
  );

  final timeReturnRaw = _formatApiDateTime(form['time_return']);

  return <String, dynamic>{
    'ApprovedTBP': 0,
    'BookerVehicles': bookerFullName,
    'Category': BookingVehicleApiCategory.passengerGo,
    'CompanyNameArrives': _trimStr(form['location_address']),
    'DeliverName': '',
    'DeliverPhoneNumber': _trimStr(
      form['passenger_contact_phone_$passengerIndex'],
    ),
    'DepartureAddress': departureAddressFromForm(form),
    'DepartureAddressStatus': departureAddressStatusFromStartingPoint(
      form['starting_point'],
    ),
    'DepartureDate': _formatApiDateTime(form['time_depart']) ?? '',
    'EmployeeID': bookerEmployeeId,
    'ID': 0,
    'IsApprovedTBP': false,
    'IsProblemArises': false,
    'Note': _trimStr(form['passenger_note_$passengerIndex']),
    'PackageName': '',
    'PackageQuantity': 0,
    'PackageSize': '',
    'PackageWeight': '',
    'PassengerCode': passengerCode,
    'PassengerDepartment': _trimStr(
      form['passenger_department_$passengerIndex'],
    ),
    'PassengerEmployeeID': passengerEmployeeId,
    'PassengerName': _trimStr(form['passenger_full_name_$passengerIndex']),
    'PassengerPhoneNumber': _trimStr(
      form['passenger_contact_phone_$passengerIndex'],
    ),
    'PhoneNumber': '',
    'ProblemArises': '',
    'ProjectID': projectId,
    'Province': _trimStr(form['provinces']),
    'ReceiverCode': '',
    'ReceiverEmployeeID': 0,
    'ReceiverName': '',
    'ReceiverPhoneNumber': '',
    'SpecificDestinationAddress': _trimStr(form['address']),
    'TimeNeedPresent': _formatApiDateTime(form['time_need_present']) ?? '',
    'TimeReturn': timeReturnRaw,
    'VehicleType': _vehicleTypeFromLabel(form['type_transport']?.toString()),
  };
}

List<Map<String, dynamic>> buildAllPassengerGoCreatePayloads({
  required Map<String, dynamic> formValues,
  required int? bookerEmployeeId,
  required String? bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  required int passengerLineCount,
}) {
  if (bookerEmployeeId == null) return const [];
  final name = _trimStr(bookerFullName);
  final out = <Map<String, dynamic>>[];
  for (var i = 0; i < passengerLineCount; i++) {
    out.add(
      buildPassengerGoCreatePayload(
        form: formValues,
        passengerIndex: i,
        bookerEmployeeId: bookerEmployeeId,
        bookerFullName: name,
        projects: projects,
        employees: employees,
      ),
    );
  }
  return out;
}

/// **Đăng ký người về** — [BookingVehicleApiCategory.passengerReturn] (5).
///
/// Form màn **Người về**: `time_return` = đón → `DepartureDate`,
/// `time_need_present` = cần về → `TimeNeedPresent` (API: xuất phát &lt; cần đến).
Map<String, dynamic> buildPassengerReturnCreatePayload({
  required Map<String, dynamic> form,
  required int passengerIndex,
  required int bookerEmployeeId,
  required String bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
}) {
  final projectId = resolveBookingVehicleProjectId(form['project'], projects);
  final passengerCode = _trimStr(form['passenger_code_$passengerIndex']);
  final passengerEmployeeId = resolvePassengerEmployeeIdFromCode(
    passengerCode,
    employees,
  );

  final departureDateStr = _formatApiDateTime(form['time_return']) ?? '';
  final timeNeedPresentStr =
      _formatApiDateTime(form['time_need_present']) ?? '';

  return <String, dynamic>{
    'ApprovedTBP': 0,
    'BookerVehicles': bookerFullName,
    'Category': BookingVehicleApiCategory.passengerReturn,
    'CompanyNameArrives': _trimStr(form['location_address']),
    'DeliverName': '',
    'DeliverPhoneNumber': _trimStr(
      form['passenger_contact_phone_$passengerIndex'],
    ),
    'DepartureAddress': departureAddressFromReturnForm(form),
    'DepartureAddressStatus': departureAddressStatusFromReturnPoint(
      form['return_point'],
    ),
    'DepartureDate': departureDateStr,
    'EmployeeID': bookerEmployeeId,
    'ID': 0,
    'IsApprovedTBP': false,
    'IsProblemArises': true,
    'Note': _trimStr(form['passenger_note_$passengerIndex']),
    'PackageName': '',
    'PackageQuantity': 0,
    'PackageSize': '',
    'PackageWeight': '',
    'PassengerCode': passengerCode,
    'PassengerDepartment': _trimStr(
      form['passenger_department_$passengerIndex'],
    ),
    'PassengerEmployeeID': passengerEmployeeId,
    'PassengerName': _trimStr(form['passenger_full_name_$passengerIndex']),
    'PassengerPhoneNumber': _trimStr(
      form['passenger_contact_phone_$passengerIndex'],
    ),
    'PhoneNumber': '',
    'ProblemArises': '',
    'ProjectID': projectId,
    'Province': _trimStr(form['provinces']),
    'ReceiverCode': '',
    'ReceiverEmployeeID': 0,
    'ReceiverName': '',
    'ReceiverPhoneNumber': '',
    'SpecificDestinationAddress': _trimStr(form['address']),
    'TimeNeedPresent': timeNeedPresentStr,
    'TimeReturn': null,
    'VehicleType': _vehicleTypeFromLabel(form['type_transport']?.toString()),
  };
}

List<Map<String, dynamic>> buildAllPassengerReturnCreatePayloads({
  required Map<String, dynamic> formValues,
  required int? bookerEmployeeId,
  required String? bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  required int passengerLineCount,
}) {
  if (bookerEmployeeId == null) return const [];
  final name = _trimStr(bookerFullName);
  final out = <Map<String, dynamic>>[];
  for (var i = 0; i < passengerLineCount; i++) {
    out.add(
      buildPassengerReturnCreatePayload(
        form: formValues,
        passengerIndex: i,
        bookerEmployeeId: bookerEmployeeId,
        bookerFullName: name,
        projects: projects,
        employees: employees,
      ),
    );
  }
  return out;
}
