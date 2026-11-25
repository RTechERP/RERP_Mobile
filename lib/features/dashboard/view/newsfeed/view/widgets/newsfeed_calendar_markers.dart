import 'package:flutter/material.dart';

/// Loại đánh dấu trạng thái của một ngày trong lịch làm việc.
///
/// Tất cả dấu hiệu đều lấy từ API `/Holiday`.
enum CalendarMarkerType {
  /// Ngày nghỉ có hưởng lương (nghỉ lễ) — `holidays` với `TypeHoliday` = 1.
  paidHoliday,

  /// Ngày nghỉ đặc biệt không hưởng lương, rơi vào ngày trong tuần.
  ///
  /// Cuối tuần (`TypeHoliday` = 2 rơi vào T7/CN) không dùng loại này vì
  /// trạng thái nghỉ của cuối tuần đã thể hiện bằng màu chữ nhạt.
  dayOff,

  /// Sự kiện của công ty — `companyEvents`.
  companyEvent,

  /// Thứ bảy được làm việc — thứ bảy không có trong `holidays`.
  ///
  /// API `/Holiday` chỉ liệt kê những ngày **nghỉ**, nên thứ bảy vắng mặt
  /// trong danh sách đó là ngày nhân viên vẫn đi làm.
  workSaturday,
}

/// Màu và biểu tượng đại diện cho từng loại đánh dấu.
extension CalendarMarkerTypeStyle on CalendarMarkerType {
  /// Màu nhận diện.
  ///
  /// Ngày nghỉ và nghỉ lễ dùng chung một màu đỏ: cả hai đều là ngày không
  /// đi làm, chỉ khác nhau ở việc có hưởng lương hay không.
  Color get color {
    switch (this) {
      case CalendarMarkerType.paidHoliday:
        return const Color(0xFFD14545);
      case CalendarMarkerType.dayOff:
        return const Color(0xFFD14545);
      case CalendarMarkerType.companyEvent:
        return const Color(0xFFF59E0B);
      case CalendarMarkerType.workSaturday:
        return const Color(0xFF0F9D8F);
    }
  }

  /// Biểu tượng minh hoạ.
  IconData get icon {
    switch (this) {
      case CalendarMarkerType.paidHoliday:
        return Icons.celebration_outlined;
      case CalendarMarkerType.dayOff:
        return Icons.bedtime_outlined;
      case CalendarMarkerType.companyEvent:
        return Icons.card_giftcard_outlined;
      case CalendarMarkerType.workSaturday:
        return Icons.work_outline;
    }
  }

  /// Nhãn hiển thị trong chú giải.
  String get label {
    switch (this) {
      case CalendarMarkerType.paidHoliday:
        return 'Nghỉ lễ';
      case CalendarMarkerType.dayOff:
        return 'Nghỉ';
      case CalendarMarkerType.companyEvent:
        return 'Event';
      case CalendarMarkerType.workSaturday:
        return 'Đi làm';
    }
  }
}

/// Các loại đánh dấu được hiển thị trong chú giải.
extension CalendarMarkerTypeLegend on CalendarMarkerType {
  /// Danh sách loại đánh dấu hiển thị trong chú giải.
  ///
  /// Ngày nghỉ và nghỉ lễ dùng chung màu đỏ nên chú giải chỉ hiển thị
  /// một mục "Nghỉ lễ".
  static const legendTypes = <CalendarMarkerType>[
    CalendarMarkerType.paidHoliday,
    CalendarMarkerType.companyEvent,
    CalendarMarkerType.workSaturday,
  ];
}

/// Huy hiệu nhỏ đánh dấu trạng thái ngày trong ô lịch.
class CalendarMarkerBadge extends StatelessWidget {
  const CalendarMarkerBadge({super.key, required this.type, this.size = 15});

  /// Loại đánh dấu cần hiển thị.
  final CalendarMarkerType type;

  /// Kích thước cạnh của huy hiệu.
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = type.color;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(size * 0.36),
        border: Border.all(color: color.withValues(alpha: 0.35), width: 0.8),
      ),
      alignment: Alignment.center,
      child: Icon(type.icon, size: size * 0.58, color: color),
    );
  }
}
