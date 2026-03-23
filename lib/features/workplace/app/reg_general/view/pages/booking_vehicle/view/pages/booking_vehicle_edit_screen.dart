import 'package:flutter/material.dart';

import '../../data/datasource/models/booking_vehicle_model.dart';
import 'booking_vehicle_add_screen.dart';

/// Màn sửa: cùng form với [BookingVehicleAddScreen], prefill từ [item].
class BookingVehicleEditScreen extends StatelessWidget {
  const BookingVehicleEditScreen({super.key, required this.item});

  final BookingVehicleItem item;

  @override
  Widget build(BuildContext context) {
    return BookingVehicleAddScreen(existingBookingItem: item);
  }
}
