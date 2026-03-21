/// Id tăng dần cho từng dòng list (người đi / người nhận).
///
/// Dùng cho suffix FormBuilder + [ValueKey]: không trùng khi tạo nhiều dòng trong
/// cùng microsecond, và **không đổi** khi xoá dòng khác (khác với index vị trí).
abstract final class BookingVehicleRowId {
  BookingVehicleRowId._();

  static int _seq = 0;

  static int next() {
    _seq += 1;
    return _seq;
  }
}
