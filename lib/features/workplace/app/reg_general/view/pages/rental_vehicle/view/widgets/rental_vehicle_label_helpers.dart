// Helper format label cho Employee và Project trong form thêm yêu cầu thuê xe.

import '../../data/datasource/models/rental_vehicle_model.dart';

/// Format employee label: "Code - FullName". Trả '—' nếu cả 2 rỗng.
String formatRentalVehicleEmployeeLabel(RentalVehicleEmployee e) {
  final code = (e.code ?? '').trim();
  final name = (e.fullName ?? '').trim();
  if (code.isEmpty && name.isEmpty) return '—';
  if (code.isEmpty) return name;
  if (name.isEmpty) return code;
  return '$code - $name';
}

/// Format project label: "Code - Name". Trả '—' nếu cả 2 rỗng.
String formatRentalVehicleProjectLabel(RentalVehicleProject p) {
  final code = (p.projectCode ?? '').trim();
  final name = (p.projectName ?? '').trim();
  if (code.isEmpty && name.isEmpty) return '—';
  if (code.isEmpty) return name;
  if (name.isEmpty) return code;
  return '$code - $name';
}
