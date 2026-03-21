import 'package:equatable/equatable.dart';

import 'booking_vehicle_row_id.dart';

/// Một dòng "Người nhận + kiện hàng" (tương tự pattern sale work row).
///
/// [isCurrentUserSlot]: giống [BookingPassengerInfoRow] — chỉ dòng khởi tạo prefill user hiện tại.
class BookingReceiverPackageRow extends Equatable {
  const BookingReceiverPackageRow({
    required this.id,
    this.isCurrentUserSlot = false,
  });

  final int id;

  final bool isCurrentUserSlot;

  factory BookingReceiverPackageRow.empty({bool isCurrentUserSlot = false}) =>
      BookingReceiverPackageRow(
        id: BookingVehicleRowId.next(),
        isCurrentUserSlot: isCurrentUserSlot,
      );

  @override
  List<Object?> get props => [id, isCurrentUserSlot];
}
