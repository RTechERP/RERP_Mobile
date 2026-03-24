/// `Category` API đặt xe — đồng bộ danh mục web ERP.
///
/// ```ts
/// { value: 1, label: 'Đăng ký người đi' },
/// { value: 5, label: 'Đăng ký người về' },
/// { value: 2, label: 'Đăng ký giao hàng thương mại' },
/// { value: 6, label: 'Đăng ký lấy hàng thương mại' },
/// { value: 7, label: 'Đăng ký lấy hàng Demo/triển Lãm' },
/// { value: 8, label: 'Đăng ký giao hàng Demo/triển lãm' },
/// ```
abstract final class BookingVehicleApiCategory {
  BookingVehicleApiCategory._();

  /// Đăng ký người đi
  static const int passengerGo = 1;

  /// Đăng ký giao hàng thương mại
  static const int commercialDelivery = 2;

  /// Đăng ký người về
  static const int passengerReturn = 5;

  /// Đăng ký lấy hàng thương mại
  static const int commercialPickup = 6;

  /// Đăng ký lấy hàng Demo/triển lãm
  static const int demoExhibitionPickup = 7;

  /// Đăng ký giao hàng Demo/triển lãm
  static const int demoExhibitionDelivery = 8;
}
