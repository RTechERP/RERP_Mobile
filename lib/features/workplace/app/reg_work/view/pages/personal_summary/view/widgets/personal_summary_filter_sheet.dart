// Bottom sheet lọc trạng thái duyệt cho Personal Summary.
// Phòng ban không lọc vì API chỉ nhận 1 DepartmentID duy nhất từ user hiện tại.
import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

/// Trạng thái duyệt đồng bộ với payload `IsApproved`:
/// -1 = tất cả, 0 = chưa duyệt, 1 = đã duyệt.
enum PersonalSummaryStatus {
  all(-1, 'Tất cả'),
  pending(0, 'Chưa duyệt'),
  approved(1, 'Đã duyệt');

  const PersonalSummaryStatus(this.value, this.label);
  final int value;
  final String label;
}

class PersonalSummaryFilterSheet extends StatefulWidget {
  const PersonalSummaryFilterSheet({
    super.key,
    required this.currentStatus,
    required this.onApply,
    required this.onClear,
  });

  final int currentStatus;
  final void Function(int status) onApply;
  final VoidCallback onClear;

  @override
  State<PersonalSummaryFilterSheet> createState() =>
      _PersonalSummaryFilterSheetState();
}

class _PersonalSummaryFilterSheetState
    extends State<PersonalSummaryFilterSheet> {
  late int _selectedStatus = widget.currentStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
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
              'Lọc theo trạng thái duyệt',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: PersonalSummaryStatus.values
                    .map((opt) => _buildStatusChip(value: opt.value, label: opt.label))
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        widget.onClear();
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryERP,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: AppColors.primaryERP),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Xóa lọc'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onApply(_selectedStatus);
                        Navigator.pop(context);
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
                        style: TextStyle(fontWeight: FontWeight.w600),
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

  Widget _buildStatusChip({required int value, required String label}) {
    final isSelected = _selectedStatus == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedStatus = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: AppColors.heading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
