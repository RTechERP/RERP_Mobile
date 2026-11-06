part of 'inventory_check_bloc.dart';

/// State của màn danh sách đợt kiểm kê kho.
@CopyWith()
class InventoryCheckState extends BaseBlocState {
  /// Danh sách đợt kiểm kê từ API.
  final List<InventoryCountItem> items;

  /// Danh sách nhân viên được giao kiểm kê (để chọn trong sheet lọc).
  final List<InventoryCheckEmployee> employees;

  /// Từ khoá đang tìm kiếm (rỗng = không tìm).
  final String searchKeyword;

  /// Id nhân viên kiểm kê đang lọc (null = tất cả).
  final int? employeeId;

  /// Id kho đang lọc (null = tất cả).
  final int? warehouseId;

  /// Khoảng ngày đang lọc.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Mã đợt kiểm kê sinh từ API `generate-code` (dùng ở màn tạo mới).
  final String? generatedCode;

  /// Đang sinh mã đợt kiểm kê.
  final bool isGeneratingCode;

  /// Đang lưu đợt kiểm kê.
  final bool isSaving;

  /// Lưu đợt kiểm kê thành công.
  final bool saveSuccess;

  /// Thông tin đợt kiểm kê vừa tạo.
  final InventoryCountSaveResult? savedResult;

  const InventoryCheckState({
    required super.status,
    super.message,
    this.items = const [],
    this.employees = const [],
    this.searchKeyword = '',
    this.employeeId,
    this.warehouseId,
    this.dateStart,
    this.dateEnd,
    this.generatedCode,
    this.isGeneratingCode = false,
    this.isSaving = false,
    this.saveSuccess = false,
    this.savedResult,
  });

  /// Mặc định lọc trong tháng hiện tại.
  factory InventoryCheckState.init() {
    final now = DateTime.now();
    return InventoryCheckState(
      status: BaseStateStatus.init,
      dateStart: DateTime(now.year, now.month, 1),
      dateEnd: now,
    );
  }

  /// Nhân viên đang được chọn để lọc (null nếu không chọn).
  InventoryCheckEmployee? get selectedEmployee {
    if (employeeId == null) return null;
    for (final employee in employees) {
      if (employee.id == employeeId) return employee;
    }
    return null;
  }

  /// Danh sách đợt kiểm kê sau khi áp dụng toàn bộ bộ lọc cục bộ
  /// (từ khoá, nhân viên kiểm kê, kho).
  List<InventoryCountItem> get visibleItems {
    final keyword = searchKeyword.toLowerCase();
    return items.where((item) {
      if (employeeId != null && item.employeeId != employeeId) return false;
      if (warehouseId != null && item.warehouseId != warehouseId) return false;
      if (keyword.isEmpty) return true;
      return (item.code ?? '').toLowerCase().contains(keyword) ||
          (item.name ?? '').toLowerCase().contains(keyword) ||
          (item.employeeName ?? '').toLowerCase().contains(keyword) ||
          (item.employeeCode ?? '').toLowerCase().contains(keyword) ||
          (item.warehouseName ?? '').toLowerCase().contains(keyword) ||
          (item.note ?? '').toLowerCase().contains(keyword);
    }).toList();
  }

  @override
  List get props => [
    status,
    message,
    items,
    employees,
    searchKeyword,
    employeeId,
    warehouseId,
    dateStart,
    dateEnd,
    generatedCode,
    isGeneratingCode,
    isSaving,
    saveSuccess,
    savedResult,
  ];
}
