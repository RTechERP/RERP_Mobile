/// Nhãn trạng thái xử lý của một phát sinh (`StatusProblem`).
///
/// Dùng chung cho card hiển thị phát sinh và payload `save-report-tech`
/// (trường `Problem`) để cả hai luôn hiển thị giống nhau.
class TechProblemStatus {
  /// Phát sinh chưa được xử lý.
  static const String notProcessed = 'Chưa xử lý';

  /// Phát sinh đã gửi, đang chờ xử lý.
  static const String pending = 'Chờ xử lý';

  /// Phát sinh đang được xử lý.
  static const String processing = 'Đang xử lý';

  /// Phát sinh đã xử lý xong.
  static const String resolved = 'Đã xử lý';

  /// Phát sinh bị tạm hoãn.
  static const String onHold = 'Tạm hoãn';

  /// Nhãn tương ứng với mã trạng thái `StatusProblem` từ API.
  static String label(int? status) {
    switch (status) {
      case 1:
        return pending;
      case 2:
        return processing;
      case 3:
        return resolved;
      case 4:
        return onHold;
      case 0:
      default:
        return notProcessed;
    }
  }
}
