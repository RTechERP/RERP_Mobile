import 'package:equatable/equatable.dart';

import 'booking_vehicle_row_id.dart';

/// Một dòng "Người đi" trên UI (tương tự pattern SaleAdminWork / staff work).
/// [id] cố định cho FormBuilder + [ValueKey], không đổi khi xoá dòng khác.
///
/// [isCurrentUserSlot]: chỉ dòng mở đầu = true → UI prefill [currentEmployee].
/// Sau [removeAt(0)], dòng lên thay [id] và state form giữ nguyên, cờ vẫn false → không ghi đè bằng user hiện tại.
class BookingPassengerInfoRow extends Equatable {
  const BookingPassengerInfoRow({
    required this.id,
    this.isCurrentUserSlot = false,
  });

  /// Id ổn định (suffix field form), sinh khi tạo dòng mới.
  final int id;

  final bool isCurrentUserSlot;

  factory BookingPassengerInfoRow.empty({bool isCurrentUserSlot = false}) =>
      BookingPassengerInfoRow(
        id: BookingVehicleRowId.next(),
        isCurrentUserSlot: isCurrentUserSlot,
      );

  @override
  List<Object?> get props => [id, isCurrentUserSlot];
}
