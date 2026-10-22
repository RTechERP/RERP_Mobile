// Bottom sheet lọc của Personal Summary.
// Cho phép chọn Phòng ban + Trạng thái duyệt bổ sung
// (Tất cả / Chờ duyệt / Đã duyệt / Từ chối).
import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../summary_work/leave/data/datasource/models/summary_leave_model.dart';

/// Trạng thái duyệt bổ sung đồng bộ với payload `IsApproved`:
/// -1 = tất cả, 0 = chờ duyệt, 1 = đã duyệt, 2 = từ chối.
enum PersonalSummaryStatus {
  all(-1, 'Tất cả'),
  pending(0, 'Chờ duyệt'),
  approved(1, 'Đã duyệt'),
  rejected(2, 'Từ chối');

  const PersonalSummaryStatus(this.value, this.label);
  final int value;
  final String label;
}

class PersonalSummaryFilterSheet extends StatefulWidget {
  const PersonalSummaryFilterSheet({
    super.key,
    required this.departments,
    required this.currentDepartmentId,
    required this.currentStatus,
    required this.onApply,
    required this.onClear,
  });

  /// Danh sách phòng ban để hiển thị trong sheet.
  final List<SummaryDepartment> departments;

  /// Phòng ban đang chọn (null = theo user hiện tại).
  final int? currentDepartmentId;

  /// Trạng thái duyệt bổ sung đang chọn.
  final int currentStatus;

  /// Trả về cặp (departmentId?, status) khi người dùng bấm "Áp dụng".
  final void Function(int? departmentId, int status) onApply;

  /// Bấm "Xóa lọc" → reset về mặc định.
  final VoidCallback onClear;

  @override
  State<PersonalSummaryFilterSheet> createState() =>
      _PersonalSummaryFilterSheetState();
}

class _PersonalSummaryFilterSheetState
    extends State<PersonalSummaryFilterSheet> {
  int? _selectedDepartmentId;
  late int _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedDepartmentId = widget.currentDepartmentId;
    _selectedStatus = widget.currentStatus;
  }

  @override
  Widget build(BuildContext context) {
    // Bottom sheet có thể giãn ra tối đa 85% màn hình.
    final maxH = MediaQuery.of(context).size.height * 0.85;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxH),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle.
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
              const SizedBox(height: 8),
              const Divider(height: 1),
              // Nội dung cuộn được khi sheet mở rộng.
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionTitle('Phòng ban'),
                      const SizedBox(height: 10),
                      _buildDepartmentList(),
                      const SizedBox(height: 20),
                      _SectionTitle('Trạng thái duyệt'),
                      const SizedBox(height: 10),
                      _buildStatusChips(),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Danh sách phòng ban dạng chip cuộn dọc (wrap khi tràn).
  Widget _buildDepartmentList() {
    final all = <_DeptOption>[
      const _DeptOption(id: null, name: 'Mặc định (theo tài khoản)'),
      for (final d in widget.departments)
        _DeptOption(id: d.id, name: _deptName(d)),
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final opt in all)
          _buildSelectableChip(
            label: opt.name,
            selected: _selectedDepartmentId == opt.id,
            onTap: () => setState(() => _selectedDepartmentId = opt.id),
          ),
      ],
    );
  }

  /// Các chip trạng thái duyệt bổ sung.
  Widget _buildStatusChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final opt in PersonalSummaryStatus.values)
          _buildSelectableChip(
            label: opt.label,
            selected: _selectedStatus == opt.value,
            onTap: () => setState(() => _selectedStatus = opt.value),
          ),
      ],
    );
  }

  Widget _buildSelectableChip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primaryERP.withValues(alpha: 0.1)
              : AppColors.grey_bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppColors.primaryERP : AppColors.borderColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              size: 18,
              color: selected ? AppColors.primaryERP : AppColors.grayColor,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: AppColors.heading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
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
                widget.onApply(_selectedDepartmentId, _selectedStatus);
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
    );
  }

  /// Tên hiển thị ưu tiên `Name`, fallback `Code`.
  String _deptName(SummaryDepartment d) {
    final name = d.name?.trim();
    if (name != null && name.isNotEmpty) return name;
    final code = d.code?.trim();
    if (code != null && code.isNotEmpty) return code;
    return 'PB #${d.id}';
  }
}

/// Tiêu đề mỗi section trong sheet.
class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.heading,
      ),
    );
  }
}

/// 1 tuỳ chọn phòng ban cho sheet.
class _DeptOption {
  const _DeptOption({required this.id, required this.name});
  final int? id;
  final String name;
}
