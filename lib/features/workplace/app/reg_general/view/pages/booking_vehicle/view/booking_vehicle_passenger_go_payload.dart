import 'dart:math' as math;

import 'package:intl/intl.dart';

import '../../../../../../../../common/helpers/validate_helper.dart';
import '../data/datasource/models/booking_vehicle_model.dart';
import 'booking_vehicle_api_categories.dart';

const String _otherPointLabel = 'Khác';

/// Gắn vào map form trước khi submit (màn add): khi sửa, set = `CreatedDate` gốc để quy tắc phát sinh khớp BE.
const String kBookingVehicleProblemRuleRegistrationKey =
    '_booking_vehicle_problem_rule_registration';

DateTime bookingVehicleProblemRuleRegistrationReference(
  Map<String, dynamic> form,
) {
  final raw = form[kBookingVehicleProblemRuleRegistrationKey];
  if (raw is DateTime) return raw;
  return DateTime.now();
}

/// Cờ create: không phát sinh.
Map<String, dynamic> _bookingVehicleCreateStatusFlags() {
  return <String, dynamic>{
    'IsProblemArises': false,
    'IsCancel': false,
    'IsSend': false,
    'IsNotifiled': false,
  };
}

String _trimStr(dynamic v) {
  if (v == null) return '';
  if (v is String) return v.trim();
  return v.toString().trim();
}

/// Dùng khi đọc giá trị từ [FormBuilder] (kiểu không đồng nhất).
String bookingVehicleTrimFormValue(dynamic v) => _trimStr(v);

/// Đọc [DateTime] từ giá trị form (DateTime hoặc chuỗi ISO).
DateTime? bookingVehicleParseFormDateTime(dynamic v) {
  if (v == null) return null;
  if (v is DateTime) return v;
  if (v is String) {
    final t = v.trim();
    if (t.isEmpty) return null;
    return DateTime.tryParse(t);
  }
  return null;
}

String? _formatApiDateTime(dynamic v) {
  if (v == null) return null;
  if (v is DateTime) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(v);
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

/// Check passenger row i có dữ liệu không (dùng sau khi shift để skip dòng trống).
bool bookingVehicleIsPassengerRowEmpty(
  Map<String, dynamic> form,
  int i,
) {
  return _trimStr(form['passenger_full_name_$i']).isEmpty &&
      _trimStr(form['passenger_code_$i']).isEmpty &&
      _trimStr(form['passenger_employee_$i']).isEmpty;
}

/// Check commercial receiver row i có dữ liệu không.
bool bookingVehicleIsCommercialReceiverRowEmpty(
  Map<String, dynamic> form,
  int i,
) {
  return _trimStr(form['receiver_name_$i']).isEmpty &&
      _trimStr(form['receiver_employee_$i']).isEmpty;
}

/// Check pickup giver row i có dữ liệu không.
bool bookingVehicleIsPickupGiverRowEmpty(
  Map<String, dynamic> form,
  int i,
) {
  return _trimStr(form['pickup_giver_name_$i']).isEmpty &&
      _trimStr(form['pickup_giver_employee_$i']).isEmpty;
}

int _payloadBookingId(int? existingBookingId, int lineIndex) {
  if (existingBookingId == null || existingBookingId <= 0) return 0;
  return lineIndex == 0 ? existingBookingId : 0;
}

int bookingVehicleVehicleTypeFromForm(dynamic typeTransport) {
  final s = (typeTransport?.toString() ?? '').toLowerCase();
  if (s.contains('máy bay')) return 2;
  if (s.trim().isEmpty) return 0;
  return 1;
}

int _bookingVehicleMaxIndexFromFormKeys(
  Map<String, dynamic> form,
  List<RegExp> patterns,
) {
  var maxIdx = -1;
  for (final key in form.keys) {
    final k = key.toString();
    for (final re in patterns) {
      final m = re.firstMatch(k);
      if (m != null) {
        final i = int.tryParse(m.group(1)!);
        if (i != null && i > maxIdx) maxIdx = i;
      }
    }
  }
  return maxIdx;
}

/// Số dòng người đi/về suy ra từ key form (khi [BookingVehicleBloc] singleton còn `passengerGoLineCount` = 0).
int bookingVehicleInferPassengerLineCount(Map<String, dynamic> form) {
  final m = _bookingVehicleMaxIndexFromFormKeys(form, [
    RegExp(r'^passenger_code_(\d+)$'),
    RegExp(r'^passenger_full_name_(\d+)$'),
    RegExp(r'^passenger_contact_phone_(\d+)$'),
    RegExp(r'^passenger_employee_(\d+)$'),
  ]);
  return m < 0 ? 0 : m + 1;
}

int bookingVehicleInferCommercialReceiverLineCount(Map<String, dynamic> form) {
  final m = _bookingVehicleMaxIndexFromFormKeys(form, [
    RegExp(r'^receiver_name_(\d+)$'),
    RegExp(r'^receiver_employee_(\d+)$'),
    RegExp(r'^receiver_phone_number_(\d+)$'),
  ]);
  return m < 0 ? 0 : m + 1;
}

int bookingVehicleInferPickupGiverLineCount(Map<String, dynamic> form) {
  final m = _bookingVehicleMaxIndexFromFormKeys(form, [
    RegExp(r'^pickup_giver_name_(\d+)$'),
    RegExp(r'^pickup_giver_employee_(\d+)$'),
    RegExp(r'^pickup_giver_phone_number_(\d+)$'),
  ]);
  return m < 0 ? 0 : m + 1;
}

int bookingVehicleEffectivePassengerLineCount({
  required Map<String, dynamic> form,
  required int stateCount,
}) {
  return math.max(stateCount, bookingVehicleInferPassengerLineCount(form));
}

int bookingVehicleEffectiveCommercialReceiverLineCount({
  required Map<String, dynamic> form,
  required int stateCount,
}) {
  return math.max(
    stateCount,
    bookingVehicleInferCommercialReceiverLineCount(form),
  );
}

int bookingVehicleEffectivePickupGiverLineCount({
  required Map<String, dynamic> form,
  required int stateCount,
}) {
  return math.max(stateCount, bookingVehicleInferPickupGiverLineCount(form));
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
  int? existingBookingId,
}) {
  final projectId = resolveBookingVehicleProjectId(form['project'], projects);
  final passengerCode = _trimStr(form['passenger_code_$passengerIndex']);
  final passengerEmployeeId = resolvePassengerEmployeeIdFromCode(
    passengerCode,
    employees,
  );

  final timeReturnRaw = _formatApiDateTime(form['time_return']);

  return <String, dynamic>{
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
    'ID': _payloadBookingId(existingBookingId, passengerIndex),
    ..._bookingVehicleCreateStatusFlags(),
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
    'ProjectID': projectId,
    'Province': _trimStr(form['provinces']),
    'ReceiverCode': '',
    'ReceiverEmployeeID': 0,
    'ReceiverName': '',
    'ReceiverPhoneNumber': '',
    'SpecificDestinationAddress': _trimStr(form['address']),
    'TimeNeedPresent': _formatApiDateTime(form['time_need_present']) ?? '',
    'TimeReturn': timeReturnRaw,
    'VehicleType': bookingVehicleVehicleTypeFromForm(form['type_transport']),
  };
}

List<Map<String, dynamic>> buildAllPassengerGoCreatePayloads({
  required Map<String, dynamic> formValues,
  required int? bookerEmployeeId,
  required String? bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  required int passengerLineCount,
  int? existingBookingId,
}) {
  if (bookerEmployeeId == null) return const [];
  final name = _trimStr(bookerFullName);
  final out = <Map<String, dynamic>>[];
  for (var i = 0; i < passengerLineCount; i++) {
    if (bookingVehicleIsPassengerRowEmpty(formValues, i)) continue;
    out.add(
      buildPassengerGoCreatePayload(
        form: formValues,
        passengerIndex: i,
        bookerEmployeeId: bookerEmployeeId,
        bookerFullName: name,
        projects: projects,
        employees: employees,
        existingBookingId: existingBookingId,
      ),
    );
  }
  return out;
}

/// **Đăng ký người về** — [BookingVehicleApiCategory.passengerReturn] (5).
///
/// Form màn **Người về**: `time_return` = đón → `DepartureDate`,
/// `time_need_present` = cần về → `TimeNeedPresent` (API: xuất phát &lt; cần đến).
///
/// **Phát sinh người về** (mốc `time_need_present` + thời điểm đăng ký / `CreatedDate` khi sửa —
/// [ValidateHelper.bookingVehicleIsProblemArises], **không** có UI TBP trên form người về):
/// cờ create `IsProblemArises=true`, `IsCancel=false`, `IsSend=false`,
/// `IsNotifiled=false` (tương đương isNotified).
/// `ProblemArises` lấy từ form nếu có (thường rỗng).
Map<String, dynamic> buildPassengerReturnCreatePayload({
  required Map<String, dynamic> form,
  required int passengerIndex,
  required int bookerEmployeeId,
  required String bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  int? existingBookingId,
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
    'ID': _payloadBookingId(existingBookingId, passengerIndex),
    ..._bookingVehicleCreateStatusFlags(),
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
    'ProjectID': projectId,
    'Province': _trimStr(form['provinces']),
    'ReceiverCode': '',
    'ReceiverEmployeeID': 0,
    'ReceiverName': '',
    'ReceiverPhoneNumber': '',
    'SpecificDestinationAddress': _trimStr(form['address']),
    'TimeNeedPresent': timeNeedPresentStr,
    'TimeReturn': null,
    'VehicleType': bookingVehicleVehicleTypeFromForm(form['type_transport']),
  };
}

List<Map<String, dynamic>> buildAllPassengerReturnCreatePayloads({
  required Map<String, dynamic> formValues,
  required int? bookerEmployeeId,
  required String? bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  required int passengerLineCount,
  int? existingBookingId,
}) {
  if (bookerEmployeeId == null) return const [];
  final name = _trimStr(bookerFullName);
  final out = <Map<String, dynamic>>[];
  for (var i = 0; i < passengerLineCount; i++) {
    if (bookingVehicleIsPassengerRowEmpty(formValues, i)) continue;
    out.add(
      buildPassengerReturnCreatePayload(
        form: formValues,
        passengerIndex: i,
        bookerEmployeeId: bookerEmployeeId,
        bookerFullName: name,
        projects: projects,
        employees: employees,
        existingBookingId: existingBookingId,
      ),
    );
  }
  return out;
}

// --- Giao hàng thương mại / Demo (Category 2, 8) ---

int bookingVehicleApiCategoryForCommercialDeliveryBookingType(
  String? bookingTypeLabel,
) {
  switch (_trimStr(bookingTypeLabel)) {
    case 'Đăng ký giao hàng thương mại':
      return BookingVehicleApiCategory.commercialDelivery;
    case 'Đăng ký giao hàng Demo/triển lãm':
      return BookingVehicleApiCategory.demoExhibitionDelivery;
    default:
      return 0;
  }
}

int bookingVehicleApiCategoryForPickupBookingType(String? bookingTypeLabel) {
  switch (_trimStr(bookingTypeLabel)) {
    case 'Đăng ký lấy hàng thương mại':
      return BookingVehicleApiCategory.commercialPickup;
    case 'Đăng ký lấy hàng Demo/triển lãm':
      return BookingVehicleApiCategory.demoExhibitionPickup;
    default:
      return 0;
  }
}

int _resolveEmployeeIdFromPickerLine(
  String? display,
  List<BookingVehiclePersonalItem> employees,
) {
  final line = _trimStr(display);
  if (line.isEmpty) return 0;
  final sep = line.indexOf(' - ');
  if (sep > 0) {
    final code = line.substring(0, sep).trim();
    return resolvePassengerEmployeeIdFromCode(code, employees);
  }
  for (final e in employees) {
    if (_trimStr(e.fullName) == line) return e.id;
  }
  return 0;
}

String _employeeCodeFromPickerLine(
  String? display,
  List<BookingVehiclePersonalItem> employees,
) {
  final line = _trimStr(display);
  if (line.isEmpty) return '';
  final sep = line.indexOf(' - ');
  if (sep > 0) return line.substring(0, sep).trim();
  for (final e in employees) {
    if (_trimStr(e.fullName) == line) return _trimStr(e.code);
  }
  return '';
}

String _commercialReceiverDisplayName(
  Map<String, dynamic> form,
  int i,
) {
  final n = _trimStr(form['receiver_name_$i']);
  if (n.isNotEmpty) return n;
  final pick = _trimStr(form['receiver_employee_$i']);
  if (pick.isEmpty) return '';
  final sep = pick.indexOf(' - ');
  if (sep > 0) return pick.substring(sep + 3).trim();
  return pick;
}

String _pickupGiverDisplayName(Map<String, dynamic> form, int i) {
  final n = _trimStr(form['pickup_giver_name_$i']);
  if (n.isNotEmpty) return n;
  final pick = _trimStr(form['pickup_giver_employee_$i']);
  if (pick.isEmpty) return '';
  final sep = pick.indexOf(' - ');
  if (sep > 0) return pick.substring(sep + 3).trim();
  return pick;
}

int _packageQtyFromFormKey(Map<String, dynamic> form, String key) {
  final raw = form[key];
  if (raw is int) return raw;
  return int.tryParse(_trimStr(raw)) ?? 0;
}

/// Một bản ghi create — lặp theo từng dòng người nhận (giao hàng 2/8).
Map<String, dynamic> buildCommercialDeliveryCreatePayload({
  required Map<String, dynamic> form,
  required int receiverIndex,
  required int apiCategory,
  required int bookerEmployeeId,
  required String bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  int? existingBookingId,
}) {
  final projectId = resolveBookingVehicleProjectId(form['project'], projects);
  final pickerLine = _trimStr(form['receiver_employee_$receiverIndex']);
  final receiverEmployeeId = _resolveEmployeeIdFromPickerLine(
    pickerLine.isEmpty ? null : pickerLine,
    employees,
  );
  final receiverCode = _employeeCodeFromPickerLine(
    pickerLine.isEmpty ? null : pickerLine,
    employees,
  );
  final receiverName = _commercialReceiverDisplayName(form, receiverIndex);
  final receiverPhone = _trimStr(form['receiver_phone_number_$receiverIndex']);
  final packageQty =
      _packageQtyFromFormKey(form, 'commercial_package_quantity_$receiverIndex');

  return <String, dynamic>{
    'BookerVehicles': bookerFullName,
    'Category': apiCategory,
    'CompanyNameArrives': _trimStr(form['location_address']),
    'DeliverName': receiverName,
    'DeliverPhoneNumber': receiverPhone,
    'DepartureAddress': departureAddressFromReturnForm(form),
    'DepartureAddressStatus': departureAddressStatusFromReturnPoint(
      form['return_point'],
    ),
    'DepartureDate': _formatApiDateTime(form['time_return']) ?? '',
    'EmployeeID': bookerEmployeeId,
    'ID': _payloadBookingId(existingBookingId, receiverIndex),
    ..._bookingVehicleCreateStatusFlags(),
    'Note': _trimStr(form['note_return_or_delivery_$receiverIndex']),
    'PackageName': _trimStr(form['commercial_package_name_$receiverIndex']),
    'PackageQuantity': packageQty,
    'PackageSize': _trimStr(form['package_size_$receiverIndex']),
    'PackageWeight': _trimStr(form['package_weight_$receiverIndex']),
    'PassengerCode': '',
    'PassengerDepartment': '',
    'PassengerEmployeeID': 0,
    'PassengerName': '',
    'PassengerPhoneNumber': '',
    'PhoneNumber': '',
    'ProjectID': projectId,
    'Province': _trimStr(form['provinces']),
    'ReceiverCode': receiverCode,
    'ReceiverEmployeeID': receiverEmployeeId,
    'ReceiverName': receiverName,
    'ReceiverPhoneNumber': receiverPhone,
    'SpecificDestinationAddress': _trimStr(form['address']),
    'TimeNeedPresent': _formatApiDateTime(form['time_need_present']) ?? '',
    'TimeReturn': null,
    'VehicleType': bookingVehicleVehicleTypeFromForm(form['type_transport']),
  };
}

List<Map<String, dynamic>> buildAllCommercialDeliveryCreatePayloads({
  required Map<String, dynamic> formValues,
  required int? bookerEmployeeId,
  required String? bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  required int receiverLineCount,
  required int apiCategory,
  int? existingBookingId,
}) {
  if (bookerEmployeeId == null || apiCategory == 0) return const [];
  final name = _trimStr(bookerFullName);
  final out = <Map<String, dynamic>>[];
  for (var i = 0; i < receiverLineCount; i++) {
    if (bookingVehicleIsCommercialReceiverRowEmpty(formValues, i)) continue;
    out.add(
      buildCommercialDeliveryCreatePayload(
        form: formValues,
        receiverIndex: i,
        apiCategory: apiCategory,
        bookerEmployeeId: bookerEmployeeId,
        bookerFullName: name,
        projects: projects,
        employees: employees,
        existingBookingId: existingBookingId,
      ),
    );
  }
  return out;
}

/// Một bản ghi create — lặp theo từng dòng người giao (lấy hàng 6/7).
Map<String, dynamic> buildCommercialPickupCreatePayload({
  required Map<String, dynamic> form,
  required int giverIndex,
  required int apiCategory,
  required int bookerEmployeeId,
  required String bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  int? existingBookingId,
}) {
  final projectId =
      resolveBookingVehicleProjectId(form['pickup_project'], projects);
  final pickerLine = _trimStr(form['pickup_giver_employee_$giverIndex']);
  final giverEmployeeId = _resolveEmployeeIdFromPickerLine(
    pickerLine.isEmpty ? null : pickerLine,
    employees,
  );
  final giverCode = _employeeCodeFromPickerLine(
    pickerLine.isEmpty ? null : pickerLine,
    employees,
  );
  final giverName = _pickupGiverDisplayName(form, giverIndex);
  final giverPhone = _trimStr(form['pickup_giver_phone_number_$giverIndex']);
  final packageQty =
      _packageQtyFromFormKey(form, 'pickup_package_quantity_$giverIndex');

  return <String, dynamic>{
    'BookerVehicles': bookerFullName,
    'Category': apiCategory,
    'CompanyNameArrives': _trimStr(form['pickup_company']),
    'DeliverName': giverName,
    'DeliverPhoneNumber': giverPhone,
    'DepartureAddress': '',
    'DepartureAddressStatus': 0,
    'DepartureDate': _formatApiDateTime(form['pickup_departure_time']) ?? '',
    'EmployeeID': bookerEmployeeId,
    'ID': _payloadBookingId(existingBookingId, giverIndex),
    ..._bookingVehicleCreateStatusFlags(),
    'Note': _trimStr(form['note_pickup_package_$giverIndex']),
    'PackageName': _trimStr(form['pickup_package_name_$giverIndex']),
    'PackageQuantity': packageQty,
    'PackageSize': _trimStr(form['pickup_package_size_$giverIndex']),
    'PackageWeight': _trimStr(form['pickup_package_weight_$giverIndex']),
    'PassengerCode': '',
    'PassengerDepartment': '',
    'PassengerEmployeeID': 0,
    'PassengerName': '',
    'PassengerPhoneNumber': '',
    'PhoneNumber': '',
    'ProjectID': projectId,
    'Province': _trimStr(form['pickup_province']),
    'ReceiverCode': giverCode,
    'ReceiverEmployeeID': giverEmployeeId,
    'ReceiverName': giverName,
    'ReceiverPhoneNumber': giverPhone,
    'SpecificDestinationAddress': _trimStr(form['pickup_address']),
    'TimeNeedPresent':
        _formatApiDateTime(form['pickup_need_arrive_time']) ?? '',
    'TimeReturn': null,
    'VehicleType': bookingVehicleVehicleTypeFromForm(form['type_transport']),
  };
}

List<Map<String, dynamic>> buildAllCommercialPickupCreatePayloads({
  required Map<String, dynamic> formValues,
  required int? bookerEmployeeId,
  required String? bookerFullName,
  required List<BookingVehicleProjectItem> projects,
  required List<BookingVehiclePersonalItem> employees,
  required int giverLineCount,
  required int apiCategory,
  int? existingBookingId,
}) {
  if (bookerEmployeeId == null || apiCategory == 0) return const [];
  final name = _trimStr(bookerFullName);
  final out = <Map<String, dynamic>>[];
  for (var i = 0; i < giverLineCount; i++) {
    if (bookingVehicleIsPickupGiverRowEmpty(formValues, i)) continue;
    out.add(
      buildCommercialPickupCreatePayload(
        form: formValues,
        giverIndex: i,
        apiCategory: apiCategory,
        bookerEmployeeId: bookerEmployeeId,
        bookerFullName: name,
        projects: projects,
        employees: employees,
        existingBookingId: existingBookingId,
      ),
    );
  }
  return out;
}
