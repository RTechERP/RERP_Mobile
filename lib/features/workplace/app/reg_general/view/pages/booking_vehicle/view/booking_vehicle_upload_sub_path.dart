/// Đồng bộ web: `[sanitize(year), sanitize(categoryText), sanitize(bookingId)].filter(Boolean).join('/')`
String bookingVehicleSanitizePathSegment(String? x) {
  final s = (x ?? '').trim();
  if (s.isEmpty) return '';
  return s.replaceAll(RegExp(r'[/\\<>:"|?*\x00-\x1f]'), '_');
}

String bookingVehicleUploadSubPath({
  required int year,
  required String categoryText,
  required int bookingId,
}) {
  return [
    bookingVehicleSanitizePathSegment(year.toString()),
    bookingVehicleSanitizePathSegment(categoryText),
    bookingVehicleSanitizePathSegment(bookingId.toString()),
  ].where((s) => s.isNotEmpty).join('/');
}
