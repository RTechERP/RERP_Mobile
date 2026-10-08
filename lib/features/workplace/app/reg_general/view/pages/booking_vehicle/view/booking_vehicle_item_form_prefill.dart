import '../data/datasource/models/booking_vehicle_model.dart';
import 'booking_vehicle_api_categories.dart';

/// Nhãn hình thức đặt khớp bottom sheet màn add (và [categoryText] API nếu trùng).
String bookingVehicleEditBookingTypeLabel(BookingVehicleItem item) {
  const options = <String>{
    'Đăng ký người đi',
    'Đăng ký người về',
    'Chủ động phương tiện',
    'Đăng ký giao hàng thương mại',
    'Đăng ký lấy hàng thương mại',
    'Đăng ký giao hàng Demo/triển lãm',
    'Đăng ký lấy hàng Demo/triển lãm',
  };
  final ct = (item.categoryText ?? '').trim();
  if (options.contains(ct)) return ct;

  switch (item.category) {
    case BookingVehicleApiCategory.passengerGo:
      return 'Đăng ký người đi';
    case BookingVehicleApiCategory.passengerReturn:
      return 'Đăng ký người về';
    case BookingVehicleApiCategory.selfVehicle:
      return 'Chủ động phương tiện';
    case BookingVehicleApiCategory.commercialDelivery:
      return 'Đăng ký giao hàng thương mại';
    case BookingVehicleApiCategory.demoExhibitionDelivery:
      return 'Đăng ký giao hàng Demo/triển lãm';
    case BookingVehicleApiCategory.commercialPickup:
      return 'Đăng ký lấy hàng thương mại';
    case BookingVehicleApiCategory.demoExhibitionPickup:
      return 'Đăng ký lấy hàng Demo/triển lãm';
    default:
      return 'Đăng ký người đi';
  }
}

String _normalizeEllipsis(String s) =>
    s.replaceAll('...', '\u2026').replaceAll('\u2026 ', '\u2026').replaceAll(' \u2026', '\u2026').replaceAllMapped(
          RegExp(r'(?<! )\u2026'),
          (m) => ' \u2026',
        );

String _vehicleTransportLabel(BookingVehicleItem item) {
  final raw = (item.vehicleTypeText ?? '').trim();
  final t = _normalizeEllipsis(raw);
  if (t.isNotEmpty) return t;
  return item.vehicleType == 2 ? 'Máy bay' : 'Ô tô, xe máy ...';
}

String? _projectDisplay(
  BookingVehicleItem item,
  List<BookingVehicleProjectItem> projects,
) {
  final pid = item.projectId;
  if (pid != null && pid > 0) {
    for (final p in projects) {
      if (p.id == pid) {
        return '${p.projectCode ?? ''} - ${p.projectName ?? ''}'.trim();
      }
    }
  }
  final full = (item.projectFullName ?? '').trim();
  if (full.isEmpty) return null;
  return full.split(RegExp(r'\s[-–]\s')).first.trim().isEmpty
      ? full
      : full;
}

void _putStr(Map<String, dynamic> m, String key, String? v) {
  final s = (v ?? '').trim();
  m[key] = s;
  m['${key}_text'] = s;
}

void _putPair(
  Map<String, dynamic> m,
  String nameForm,
  String nameTextField,
  String? v,
) {
  final s = (v ?? '').trim();
  m[nameForm] = s;
  m[nameTextField] = s;
}

/// [FormDateTimePicker] đăng ký hai field: [nameForm] (validator) và
/// `[nameForm]_picker` ([FormBuilderDateTimePicker] hiển thị). Cả hai cần cùng
/// giá trị khi patch, nếu không ô ngày giờ trống dù [nameForm] đã có dữ liệu.
void _putDt(Map<String, dynamic> m, String nameForm, DateTime? dt) {
  if (dt == null) return;
  m[nameForm] = dt;
  m['${nameForm}_picker'] = dt;
}

/// Patch map cho [FormBuilder.patchValue] khi sửa từ [BookingVehicleItem].
Map<String, dynamic> buildBookingVehicleEditFormPatch(
  BookingVehicleItem item, {
  required List<BookingVehicleProjectItem> projects,
}) {
  final m = <String, dynamic>{};
  final bookingType = bookingVehicleEditBookingTypeLabel(item);
  _putStr(m, 'booking_type', bookingType);
  m['booking_type_text'] = bookingType;

  final vt = _vehicleTransportLabel(item);
  _putStr(m, 'type_transport', vt);

  final projectLine = _projectDisplay(item, projects);
  if (projectLine != null && projectLine.isNotEmpty) {
    _putStr(m, 'project', projectLine);
  }

  final cat = item.category;
  final isPickup = cat == BookingVehicleApiCategory.commercialPickup ||
      cat == BookingVehicleApiCategory.demoExhibitionPickup;
  if (isPickup && projectLine != null && projectLine.isNotEmpty) {
    _putStr(m, 'pickup_project', projectLine);
  }

  if (cat == BookingVehicleApiCategory.passengerGo) {
    _prefillPassengerGoLike(m, item, includeDepartReturn: true);
  } else if (cat == BookingVehicleApiCategory.selfVehicle) {
    // Chủ động phương tiện: giống passengerGo nhưng không có return fields
    _prefillPassengerGoLike(m, item, includeDepartReturn: false);
  } else if (cat == BookingVehicleApiCategory.passengerReturn) {
    _prefillPassengerReturnLike(m, item);
  } else if (cat == BookingVehicleApiCategory.commercialDelivery ||
      cat == BookingVehicleApiCategory.demoExhibitionDelivery) {
    _prefillCommercialDeliveryLike(m, item);
  } else if (cat == BookingVehicleApiCategory.commercialPickup ||
      cat == BookingVehicleApiCategory.demoExhibitionPickup) {
    _prefillPickupLike(m, item);
  } else {
    _prefillPassengerGoLike(m, item, includeDepartReturn: true);
  }

  if ((item.approvedTBP ?? 0) > 0) {
    m['approver'] = item.approvedTBP!.toString();
  }
  final approverName = (item.fullNameTBP ?? '').trim();
  if (approverName.isNotEmpty) {
    m['approver_text'] = approverName;
    m['approver_field'] = approverName;
  }

  final problemArises = (item.problemArises ?? '').trim();
  if (problemArises.isNotEmpty) {
    m['problem_rule_reason'] = problemArises;
    m['problem_rule_reason_text'] = problemArises;
    m['problem_field'] = problemArises;
  }

  return m;
}

void _prefillPassengerGoLike(
  Map<String, dynamic> m,
  BookingVehicleItem item, {
  required bool includeDepartReturn,
}) {
  _putStr(m, 'location_address', item.companyNameArrives);
  _putStr(m, 'provinces', item.provinceName ?? item.province);
  _putStr(m, 'address', item.specificDestinationAddress);
  _putDt(m, 'time_need_present', item.timeNeedPresent);
  if (includeDepartReturn) {
    _putDt(m, 'time_depart', item.departureDate);
    _putDt(m, 'time_return', item.timeReturn);
  } else {
    // Chủ động phương tiện: chỉ có time_depart, không có return fields
    _putDt(m, 'time_depart', item.departureDate);
  }

  const hanoiOffice = 'VP Hà Nội';
  const other = 'Khác';
  m['starting_point'] = hanoiOffice;
  m['starting_point_text'] = hanoiOffice;
  // Chủ động phương tiện: ẩn return_point và return_address
  if (includeDepartReturn) {
    m['return_point'] = other;
    m['return_point_text'] = hanoiOffice;
  }
  final dep = (item.departureAddressActual ??
          item.departureAddressText ??
          item.departureAddress ??
          '')
      .trim();
  if (dep.isNotEmpty) {
    _putStr(m, 'destination_address', dep);
    if (includeDepartReturn) {
      _putStr(m, 'return_address', dep);
    }
  }

  _putPair(m, 'passenger_code_0', 'passenger_code_text_0', item.passengerCode);
  _putPair(
    m,
    'passenger_full_name_0',
    'passenger_full_name_text_0',
    item.passengerName,
  );
  _putPair(
    m,
    'passenger_department_0',
    'passenger_department_text_0',
    item.passengerDepartment,
  );
  _putPair(
    m,
    'passenger_contact_phone_0',
    'passenger_contact_phone_text_0',
    item.passengerPhoneNumber,
  );
  _putPair(m, 'passenger_note_0', 'passenger_note_text_0', item.note);
}

void _prefillPassengerReturnLike(Map<String, dynamic> m, BookingVehicleItem item) {
  _putStr(m, 'location_address', item.companyNameArrives);
  _putStr(m, 'provinces', item.provinceName ?? item.province);
  _putStr(m, 'address', item.specificDestinationAddress);
  _putDt(m, 'time_need_present', item.timeNeedPresent);
  _putDt(m, 'time_return', item.departureDate);

  const other = 'Khác';
  m['return_point'] = other;
  m['return_point_text'] = other;
  final dep = (item.departureAddressText ?? item.departureAddress ?? '').trim();
  if (dep.isNotEmpty) {
    _putStr(m, 'return_address', dep);
  }

  _putPair(m, 'passenger_code_0', 'passenger_code_text_0', item.passengerCode);
  _putPair(
    m,
    'passenger_full_name_0',
    'passenger_full_name_text_0',
    item.passengerName,
  );
  _putPair(
    m,
    'passenger_department_0',
    'passenger_department_text_0',
    item.passengerDepartment,
  );
  _putPair(
    m,
    'passenger_contact_phone_0',
    'passenger_contact_phone_text_0',
    item.passengerPhoneNumber,
  );
  _putPair(m, 'passenger_note_0', 'passenger_note_text_0', item.note);
}

void _prefillCommercialDeliveryLike(Map<String, dynamic> m, BookingVehicleItem item) {
  _putStr(m, 'location_address', item.companyNameArrives);
  _putStr(m, 'provinces', item.provinceName ?? item.province);
  _putStr(m, 'address', item.specificDestinationAddress);
  _putDt(m, 'time_need_present', item.timeNeedPresent);
  _putDt(m, 'time_return', item.departureDate);

  const other = 'Khác';
  m['return_point'] = other;
  m['return_point_text'] = other;
  final dep = (item.departureAddressText ?? item.departureAddress ?? '').trim();
  if (dep.isNotEmpty) {
    _putStr(m, 'return_address', dep);
  }

  _putPair(
    m,
    'receiver_name_0',
    'receiver_name_text_0',
    item.receiverName ?? item.deliverName,
  );
  _putPair(
    m,
    'receiver_phone_number_0',
    'receiver_phone_number_text_0',
    item.receiverPhoneNumber ?? item.deliverPhoneNumber,
  );
  _putPair(
    m,
    'commercial_package_name_0',
    'commercial_package_name_text_0',
    item.packageName,
  );
  _putPair(m, 'package_size_0', 'package_size_text_0', item.packageSize?.toString());
  _putPair(
    m,
    'package_weight_0',
    'package_weight_text_0',
    item.packageWeight?.toString(),
  );
  if (item.packageQuantity != null) {
    final q = '${item.packageQuantity}';
    m['commercial_package_quantity_0'] = q;
    m['commercial_package_quantity_text_0'] = q;
  }
  _putPair(
    m,
    'note_return_or_delivery_0',
    'note_return_or_delivery_text_0',
    item.note,
  );
}

void _prefillPickupLike(Map<String, dynamic> m, BookingVehicleItem item) {
  _putDt(m, 'pickup_need_arrive_time', item.timeNeedPresent);
  _putDt(m, 'pickup_departure_time', item.departureDate);
  _putStr(m, 'pickup_company', item.companyNameArrives);
  _putStr(m, 'pickup_province', item.provinceName ?? item.province);
  _putStr(m, 'pickup_address', item.specificDestinationAddress);

  _putPair(
    m,
    'pickup_giver_name_0',
    'pickup_giver_name_text_0',
    item.receiverName ?? item.deliverName,
  );
  _putPair(
    m,
    'pickup_giver_phone_number_0',
    'pickup_giver_phone_number_text_0',
    item.receiverPhoneNumber ?? item.deliverPhoneNumber,
  );
  _putPair(
    m,
    'pickup_package_name_0',
    'pickup_package_name_text_0',
    item.packageName,
  );
  _putPair(
    m,
    'pickup_package_size_0',
    'pickup_package_size_text_0',
    item.packageSize?.toString(),
  );
  _putPair(
    m,
    'pickup_package_weight_0',
    'pickup_package_weight_text_0',
    item.packageWeight?.toString(),
  );
  if (item.packageQuantity != null) {
    final q = '${item.packageQuantity}';
    m['pickup_package_quantity_0'] = q;
    m['pickup_package_quantity_text_0'] = q;
  }
  _putPair(
    m,
    'note_pickup_package_0',
    'note_pickup_package_text_0',
    item.note,
  );
}
