import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Initialize timezone database. Call once in AppInitializer.
void initializeTimeZones() {
  tz_data.initializeTimeZones();
}

/// Lấy timezone name của device (ví dụ: 'Asia/Ho_Chi_Minh', 'Asia/Kolkata')
String getDeviceTimeZone() {
  try {
    final now = tz.TZDateTime.now(tz.local);
    return tz.local.name;
  } catch (_) {
    // Fallback: tính từ offset
    final offset = DateTime.now().timeZoneOffset;
    if (offset == const Duration(hours: 7)) return 'Asia/Ho_Chi_Minh';
    if (offset == const Duration(hours: 5, minutes: 30)) return 'Asia/Kolkata';
    return 'UTC';
  }
}

/// Convert DateTime sang ISO 8601 string với offset cố định +07:00.
/// 
/// [sourceTimeZone] - timezone của giá trị DateTime đầu vào:
/// - null: tự động detect device timezone
/// - 'Asia/Ho_Chi_Minh': giờ local device (VN)
/// - 'Asia/Kolkata': giờ local device (Ấn Độ)
/// - timezone khác: tự động convert sang giờ VN
/// 
/// Ví dụ: User ở Ấn Độ chọn 9:00 PM trên UI (hiển thị giờ VN)
/// -> DateTime chứa 9:00 PM IST (vì device ở IST)
/// -> Gọi toVnIso8601(dt, sourceTimeZone: 'Asia/Kolkata')
/// -> Convert 9:00 IST → 11:30 VN → output 23:30+07:00
String toVnIso8601(DateTime dt, {String? sourceTimeZone}) {
  // Tự động detect device timezone nếu không truyền
  sourceTimeZone ??= getDeviceTimeZone();

  int hour = dt.hour;
  int minute = dt.minute;
  int second = dt.second;
  int millisecond = dt.millisecond;
  int day = dt.day;
  int month = dt.month;
  int year = dt.year;

  // Nếu có sourceTimeZone, convert từ timezone đó sang VN
  if (sourceTimeZone != 'Asia/Ho_Chi_Minh') {
    try {
      final location = tz.getLocation(sourceTimeZone);
      final asSourceTz = tz.TZDateTime(
        location,
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
      // Chuyển sang UTC rồi cộng 7h để ra giờ VN
      final asUtc = asSourceTz.toUtc();
      final asVn = tz.TZDateTime.from(asUtc, tz.getLocation('Asia/Ho_Chi_Minh'));
      hour = asVn.hour;
      minute = asVn.minute;
      second = asVn.second;
      millisecond = asVn.millisecond;
      day = asVn.day;
      month = asVn.month;
      year = asVn.year;
    } catch (_) {
      // Nếu lỗi timezone, giữ nguyên giá trị
    }
  }

  final ms = millisecond.toString().padLeft(3, '0');
  return '${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')}T'
      '${hour.toString().padLeft(2, '0')}:'
      '${minute.toString().padLeft(2, '0')}:'
      '${second.toString().padLeft(2, '0')}.'
      '$ms+07:00';
}
