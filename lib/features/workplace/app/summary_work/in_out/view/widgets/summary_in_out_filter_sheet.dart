import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/summary_in_out_model.dart';

enum InOutFilterStatus {
  all(-1, 'Tất cả'),
  pending(0, 'Chưa duyệt'),
  approved(1, 'Đã duyệt');

  const InOutFilterStatus(this.value, this.label);
  final int value;
  final String label;
}

class SummaryInOutFilterSheet extends StatefulWidget {
  const SummaryInOutFilterSheet({
    super.key,
    required this.departments,
    this.selectedDepartmentId,
    this.selectedStatus,
    required this.onApply,
    required this.onClear,
  });

  final List<SummaryInOutDepartment> departments;
  final int? selectedDepartmentId;
  final int? selectedStatus;
  final void Function(int? departmentId, int? status) onApply;
  final VoidCallback onClear;

  @override
  State<SummaryInOutFilterSheet> createState() => _SummaryInOutFilterSheetState();
}

class _SummaryInOutFilterSheetState extends State<SummaryInOutFilterSheet> {
  late int? _selectedDepartmentId;
  late int? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedDepartmentId = widget.selectedDepartmentId;
    _selectedStatus = widget.selectedStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Bộ lọc',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const Text(
                    'Phòng ban',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.departments
                        .map((dept) => _buildDepartmentChip(
                              id: dept.id,
                              label: dept.name ?? 'Phòng ban ${dept.id}',
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Trạng thái',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: InOutFilterStatus.values
                        .map((opt) => _buildStatusChip(
                              value: opt.value,
                              label: opt.label,
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
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
                        widget.onClear();
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
                      onPressed: () {
                        widget.onApply(_selectedDepartmentId, _selectedStatus);
                        context.pop();
                      },
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
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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

  Widget _buildDepartmentChip({required int id, required String label}) {
    final isSelected = _selectedDepartmentId == id;
    return GestureDetector(
      onTap: () => setState(() {
        _selectedDepartmentId = isSelected ? null : id;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryERP.withValues(alpha: 0.1)
              : AppColors.grey_bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryERP : AppColors.borderColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              size: 18,
              color: isSelected ? AppColors.primaryERP : AppColors.grayColor,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: AppColors.heading,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip({required int value, required String label}) {
    final isSelected = _selectedStatus == value ||
        (_selectedStatus == null && value == -1);
    return GestureDetector(
      onTap: () => setState(() => _selectedStatus = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryERP.withValues(alpha: 0.1)
              : AppColors.grey_bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryERP : AppColors.borderColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primaryERP : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primaryERP : AppColors.grayColor,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: AppColors.heading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}