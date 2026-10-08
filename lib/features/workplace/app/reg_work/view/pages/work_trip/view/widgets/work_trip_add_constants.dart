import '../../data/datasource/models/work_trip_model.dart';

int approvedWorkTripPayloadValue(ApproverItem item) =>
    item.employeeId ?? item.id;

// ── Vehicle entry (one row in vehicle dialog) ─────────────────────────────────

class WorkTripVehicleEntry {
  const WorkTripVehicleEntry({
    required this.vehicleTypeId,
    required this.vehicleName,
    required this.cost,
    this.editCost = false,
    this.note = '',
    this.customName = '',
  });

  final int vehicleTypeId;
  final String vehicleName;
  final double cost;
  final bool editCost;
  final String note;

  /// Tên tuỳ chỉnh khi chọn "Phương tiện khác".
  final String customName;

  /// Kiểm tra xem vehicle này là "loại khác" hay không.
  bool get isCustom =>
      vehicleName.toLowerCase().contains('khác') ||
      vehicleName.toLowerCase().contains('khac') ||
      vehicleName.toLowerCase().contains('other');

  /// Tên hiển thị trên form: nếu là loại khác thì dùng customName,
  /// ngược lại dùng vehicleName.
  String get displayName =>
      isCustom && customName.isNotEmpty ? customName : vehicleName;

  WorkTripVehicleEntry copyWith({
    int? vehicleTypeId,
    String? vehicleName,
    double? cost,
    bool? editCost,
    String? note,
    String? customName,
  }) =>
      WorkTripVehicleEntry(
        vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
        vehicleName: vehicleName ?? this.vehicleName,
        cost: cost ?? this.cost,
        editCost: editCost ?? this.editCost,
        note: note ?? this.note,
        customName: customName ?? this.customName,
      );
}

// ── Dinner allowance options ───────────────────────────────────────────────────

class DinnerAllowanceOption {
  const DinnerAllowanceOption({
    required this.value,
    required this.label,
    required this.cost,
  });

  final int value;
  final String label;
  final double cost;
}

const kDinnerAllowanceOptions = <DinnerAllowanceOption>[
  DinnerAllowanceOption(value: 0, label: 'Không có', cost: 0),
  DinnerAllowanceOption(value: 1, label: 'Về văn phòng sau 20h', cost: 35000),
  DinnerAllowanceOption(value: 2, label: 'Theo loại công tác', cost: 35000),
];

// ── Submit data ───────────────────────────────────────────────────────────────

class WorkTripSubmitData {
  const WorkTripSubmitData({
    required this.approvedId,
    required this.dayBussiness,
    required this.isProblem,
    required this.typeBusiness,
    required this.location,
    this.projectId,
    required this.costBussiness,
    this.vehicles = const [],
    this.costVehicleOverride,
    required this.notCheckIn,
    required this.workEarly,
    required this.overnightType,
    required this.reason,
    required this.note,
    this.fileInfo,
    this.bookingVehicleId,
    this.customerName,
    this.companyName,
    this.selfVehicle = false,
  });

  final int approvedId;
  final DateTime dayBussiness;
  final bool isProblem;
  final int typeBusiness;
  final String location;
  final int? projectId;
  final double costBussiness;

  /// Danh sách phương tiện người dùng chọn.
  final List<WorkTripVehicleEntry> vehicles;

  /// Ghi đè chi phí phương tiện (dùng khi edit mà không thay đổi phương tiện).
  final double? costVehicleOverride;

  final bool notCheckIn;
  final bool workEarly;
  final int overnightType;
  final String reason;
  final String note;
  final Map<String, String?>? fileInfo;

  /// ID phiếu đặt xe được chọn.
  final int? bookingVehicleId;

  /// Tên khách hàng từ phiếu đặt xe.
  final String? customerName;

  /// Tên công ty từ phiếu đặt xe.
  final String? companyName;

  /// Checkbox chủ động phương tiện.
  final bool selfVehicle;

  /// Tổng chi phí phương tiện.
  /// Nếu có [costVehicleOverride] thì dùng giá trị đó (edit mode giữ nguyên cost cũ).
  double get costVehicle =>
      costVehicleOverride ?? vehicles.fold(0.0, (sum, v) => sum + v.cost);

  bool get hasMotorbike => vehicles.any(
        (v) =>
            v.vehicleName.toLowerCase().contains('xe máy') ||
            v.vehicleName.toLowerCase().contains('xe may') ||
            v.vehicleName.toLowerCase().contains('xemay'),
      );

  bool get hasCustomVehicle => vehicles.any((v) => v.isCustom);

  /// Phương tiện cần ghi thêm vào employeeBussinessVehicle:
  /// ưu tiên Xe máy, sau đó Phương tiện khác.
  WorkTripVehicleEntry? get vehicleRecord {
    if (hasMotorbike) {
      return vehicles.firstWhere(
        (v) =>
            v.vehicleName.toLowerCase().contains('xe máy') ||
            v.vehicleName.toLowerCase().contains('xe may') ||
            v.vehicleName.toLowerCase().contains('xemay'),
      );
    }
    if (hasCustomVehicle) {
      return vehicles.firstWhere((v) => v.isCustom);
    }
    return null;
  }

  /// Cần gửi employeeBussinessVehicle khi chọn Xe máy hoặc Phương tiện khác.
  bool get needsVehicleRecord => hasMotorbike || hasCustomVehicle;
}
