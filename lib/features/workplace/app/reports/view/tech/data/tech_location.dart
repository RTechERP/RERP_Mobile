/// Các lựa chọn "Nơi làm việc" trong báo cáo kỹ thuật.
///
/// Giá trị (value) của mỗi lựa chọn trùng với text hiển thị trên UI.
class TechLocation {
  /// Văn phòng.
  static const String office = 'Văn phòng RTC';

  /// Nhà máy RTC.
  static const String rtcFactory = 'Nhà máy RTC';

  /// Địa điểm công tác — người dùng phải nhập thêm địa chỉ cụ thể.
  static const String site = 'Địa điểm công tác';

  /// Tại nhà.
  static const String home = 'Tại nhà';

  /// Danh sách lựa chọn theo thứ tự hiển thị.
  static const List<String> options = [office, rtcFactory, site, home];

  /// Mã địa điểm làm thêm (`EmployeeOvertime.Location`) tương ứng với nơi
  /// làm việc đang chọn.
  ///
  /// Dùng chung bảng địa điểm với module làm thêm:
  /// 1 = Văn phòng, 4 = Nhà máy RTC, 2 = Địa điểm công tác, 3 = Tại nhà.
  static int overtimeLocationOf(String type) {
    switch (type) {
      case rtcFactory:
        return 4;
      case site:
        return 2;
      case home:
        return 3;
      case office:
      default:
        return 1;
    }
  }

  /// Nhãn hiển thị của mã địa điểm làm thêm (theo text của màn báo cáo).
  static String overtimeLocationLabel(int location) {
    switch (location) {
      case 4:
        return rtcFactory;
      case 2:
        return site;
      case 3:
        return home;
      case 1:
      default:
        return office;
    }
  }

  /// Chuẩn hoá giá trị nơi làm việc lấy từ BE về 1 trong các lựa chọn.
  ///
  /// Dữ liệu cũ lưu `VP RTC` → quy về [office]; các địa chỉ tự nhập
  /// → quy về [site].
  static String resolve(String? rawLocation) {
    final normalized = (rawLocation ?? '').trim().toLowerCase();
    if (normalized.isEmpty) return office;

    for (final option in options) {
      if (option.toLowerCase() == normalized) return option;
    }
    if (normalized == 'vp rtc') return office;

    return site;
  }
}
