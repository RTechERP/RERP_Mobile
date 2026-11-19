import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';

/// Tùy chọn lọc theo kho.
enum ProductReturnWarehouseOption {
  hanoi(1, 'Kho HN'),
  demo(2, 'Kho Demo'),
  modula(3, 'Kho Modula');

  const ProductReturnWarehouseOption(this.warehouseId, this.label);

  /// Id kho tương ứng với `warehouseID` của API.
  final int warehouseId;

  /// Nhãn hiển thị trên chip.
  final String label;
}

/// Bottom sheet bộ lọc danh sách phiếu trả sản phẩm.
///
/// Gồm: ô tìm kiếm theo từ khoá, chọn nhân viên duyệt và chọn kho.
/// Áp dụng xong gọi [onApply] với toàn bộ giá trị đang chọn.
class ProductReturnFilterSheet extends StatefulWidget {
  const ProductReturnFilterSheet({
    super.key,
    required this.employees,
    required this.initialKeyword,
    required this.initialEmployeeId,
    required this.initialWarehouseId,
    required this.onApply,
  });

  /// Danh sách nhân viên được giao duyệt (từ API).
  final List<ProductReturnEmployee> employees;

  /// Từ khoá đang tìm kiếm.
  final String initialKeyword;

  /// Id nhân viên đang lọc (null = tất cả).
  final int? initialEmployeeId;

  /// Id kho đang lọc (null = tất cả).
  final int? initialWarehouseId;

  /// Áp dụng bộ lọc. [employeeId] / [warehouseId] null = không lọc.
  final void Function({
    required String keyword,
    required int? employeeId,
    required int? warehouseId,
  })
  onApply;

  /// Mở sheet bộ lọc.
  static Future<void> show(
    BuildContext context, {
    required List<ProductReturnEmployee> employees,
    required String initialKeyword,
    required int? initialEmployeeId,
    required int? initialWarehouseId,
    required void Function({
      required String keyword,
      required int? employeeId,
      required int? warehouseId,
    })
    onApply,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProductReturnFilterSheet(
        employees: employees,
        initialKeyword: initialKeyword,
        initialEmployeeId: initialEmployeeId,
        initialWarehouseId: initialWarehouseId,
        onApply: onApply,
      ),
    );
  }

  @override
  State<ProductReturnFilterSheet> createState() =>
      _ProductReturnFilterSheetState();
}

class _ProductReturnFilterSheetState extends State<ProductReturnFilterSheet> {
  late final TextEditingController _keywordController;
  late int? _employeeId;
  late int? _warehouseId;

  @override
  void initState() {
    super.initState();
    _keywordController = TextEditingController(text: widget.initialKeyword);
    _employeeId = widget.initialEmployeeId;
    _warehouseId = widget.initialWarehouseId;
  }

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  /// Áp dụng bộ lọc và đóng sheet.
  void _apply() {
    widget.onApply(
      keyword: _keywordController.text.trim(),
      employeeId: _employeeId,
      warehouseId: _warehouseId,
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.line,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Bộ lọc phiếu trả sản phẩm',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                children: [
                  /// ===== TỪ KHOÁ =====
                  const Text(
                    'Tìm kiếm theo từ khoá',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _keywordController,
                    textInputAction: TextInputAction.search,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Mã SP, tên SP, tên người mượn...',
                      hintStyle: const TextStyle(
                        color: AppColors.hintText,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.gray,
                        size: 20,
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 36,
                        minHeight: 36,
                      ),
                      isDense: true,
                      filled: true,
                      fillColor: AppColors.background,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primaryERP,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// ===== NHÂN VIÊN DUYỆT =====
                  const Text(
                    'Nhân viên duyệt',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _EmployeePicker(
                    employees: widget.employees,
                    selectedEmployeeId: _employeeId,
                    onChanged: (id) => setState(() => _employeeId = id),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _keywordController.clear();
                          _employeeId = null;
                          _warehouseId = null;
                        });
                        widget.onApply(
                          keyword: '',
                          employeeId: null,
                          warehouseId: null,
                        );
                        context.pop();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryERP,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: AppColors.primaryERP),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Xóa lọc',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _apply,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryERP,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Áp dụng',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ô chọn nhân viên duyệt: hiển thị nhân viên đang chọn, bấm để mở danh sách
/// nhân viên lấy từ API `get-employee-team-and-department`.
class _EmployeePicker extends StatelessWidget {
  const _EmployeePicker({
    required this.employees,
    required this.selectedEmployeeId,
    required this.onChanged,
  });

  final List<ProductReturnEmployee> employees;
  final int? selectedEmployeeId;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    ProductReturnEmployee? selected;
    for (final employee in employees) {
      if (employee.employeeId == selectedEmployeeId) {
        selected = employee;
        break;
      }
    }

    final label = selected == null
        ? 'Tất cả nhân viên'
        : '${selected.fullName ?? '--'}'
              '${(selected.code ?? '').isEmpty ? '' : ' (${selected.code})'}';

    return InkWell(
      onTap: () => _openEmployeeSheet(context),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            const Icon(Icons.person_outline, size: 18, color: AppColors.gray),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.enableText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.chevron_right, size: 18, color: AppColors.gray),
          ],
        ),
      ),
    );
  }

  /// Mở sheet danh sách nhân viên và trả về nhân viên được chọn.
  Future<void> _openEmployeeSheet(BuildContext context) async {
    final picked = await showModalBottomSheet<ProductReturnEmployee>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _EmployeeListSheet(
        employees: employees,
        selectedEmployeeId: selectedEmployeeId,
      ),
    );
    if (picked == null) return;
    onChanged(picked.employeeId);
  }
}

/// Sheet danh sách nhân viên được giao duyệt trả sản phẩm.
class _EmployeeListSheet extends StatefulWidget {
  const _EmployeeListSheet({
    required this.employees,
    required this.selectedEmployeeId,
  });

  final List<ProductReturnEmployee> employees;
  final int? selectedEmployeeId;

  @override
  State<_EmployeeListSheet> createState() => _EmployeeListSheetState();
}

class _EmployeeListSheetState extends State<_EmployeeListSheet> {
  late final TextEditingController _controller;
  String _keyword = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Lọc danh sách nhân viên theo tên, mã NV, phòng ban hoặc nhóm.
  List<ProductReturnEmployee> get _visibleEmployees {
    final keyword = _keyword.toLowerCase();
    if (keyword.isEmpty) return widget.employees;
    return widget.employees.where((employee) {
      return (employee.fullName ?? '').toLowerCase().contains(keyword) ||
          (employee.code ?? '').toLowerCase().contains(keyword) ||
          (employee.departmentName ?? '').toLowerCase().contains(keyword) ||
          (employee.teamName ?? '').toLowerCase().contains(keyword);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final employees = _visibleEmployees;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.line,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Chọn nhân viên duyệt',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _controller,
                onChanged: (value) => setState(() => _keyword = value.trim()),
                style: const TextStyle(fontSize: 14, color: AppColors.heading),
                decoration: InputDecoration(
                  hintText: 'Tìm theo tên, mã NV, phòng ban',
                  hintStyle: const TextStyle(
                    color: AppColors.hintText,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.gray,
                    size: 20,
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.background,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primaryERP,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: employees.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Không có nhân viên nào',
                        style: TextStyle(color: AppColors.gray),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: employees.length,
                      separatorBuilder: (_, _) => const Divider(
                        height: 1,
                        color: AppColors.borderColor,
                      ),
                      itemBuilder: (context, index) {
                        final employee = employees[index];
                        final isSelected =
                            employee.employeeId == widget.selectedEmployeeId;
                        final name = (employee.fullName ?? '').trim();
                        final subtitle = [
                          (employee.code ?? '').trim(),
                          (employee.departmentName ?? '').trim(),
                          (employee.teamName ?? '').trim(),
                        ].where((e) => e.isNotEmpty).join(' • ');

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: isSelected
                                ? AppColors.primaryERP
                                : AppColors.grey_bg,
                            foregroundColor: isSelected
                                ? Colors.white
                                : AppColors.heading,
                            child: Text(
                              name.isEmpty ? '?' : name[0].toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          title: Text(
                            name.isEmpty ? '—' : name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: AppColors.heading,
                            ),
                          ),
                          subtitle: subtitle.isEmpty
                              ? null
                              : Text(
                                  subtitle,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.gray,
                                  ),
                                ),
                          trailing: isSelected
                              ? const Icon(
                                  Icons.check_circle,
                                  color: AppColors.primaryERP,
                                )
                              : null,
                          onTap: () => context.pop(employee),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
