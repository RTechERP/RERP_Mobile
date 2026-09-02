import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/summary_overtime_model.dart';

/// Bottom sheet chọn nhân viên để lọc danh sách phiếu làm thêm.
/// Có ô search phía trên để gõ tên NV và gọi callback `onKeywordChanged`
/// (mỗi lần debounce). Khi chọn NV sẽ gọi `onSelect`.
class SummaryOvertimeEmployeePickerSheet extends StatefulWidget {
  const SummaryOvertimeEmployeePickerSheet({
    super.key,
    required this.employees,
    required this.selectedEmployeeId,
    required this.keyword,
    required this.onKeywordChanged,
    required this.onSelect,
  });

  final List<SummaryOvertimeEmployee> employees;
  final int? selectedEmployeeId;
  final String keyword;
  final ValueChanged<String> onKeywordChanged;
  final void Function(SummaryOvertimeEmployee employee) onSelect;

  @override
  State<SummaryOvertimeEmployeePickerSheet> createState() =>
      _SummaryOvertimeEmployeePickerSheetState();
}

class _SummaryOvertimeEmployeePickerSheetState
    extends State<SummaryOvertimeEmployeePickerSheet> {
  late final TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.keyword);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      widget.onKeywordChanged(value.trim());
    });
  }

  void _clear() {
    _controller.clear();
    _debounce?.cancel();
    widget.onKeywordChanged('');
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
              'Chọn nhân viên',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _controller,
                onChanged: _onChanged,
                style: const TextStyle(fontSize: 14, color: AppColors.heading),
                decoration: InputDecoration(
                  hintText: 'Tìm theo tên hoặc mã NV',
                  hintStyle:
                      const TextStyle(color: AppColors.hintText, fontSize: 14),
                  prefixIcon: const Icon(Icons.search,
                      color: AppColors.gray, size: 20),
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 36, minHeight: 36),
                  suffixIcon: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _controller,
                    builder: (context, value, _) {
                      if (value.text.isEmpty) return const SizedBox.shrink();
                      return IconButton(
                        icon: const Icon(Icons.clear,
                            color: AppColors.gray, size: 18),
                        onPressed: _clear,
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 36, minHeight: 36),
                      );
                    },
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.background,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                        color: AppColors.primaryERP, width: 1.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: widget.employees.isEmpty
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
                      itemCount: widget.employees.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, color: AppColors.borderColor),
                      itemBuilder: (context, index) {
                        final emp = widget.employees[index];
                        final isSelected = emp.id == widget.selectedEmployeeId;
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: isSelected
                                ? AppColors.primaryERP
                                : AppColors.grey_bg,
                            foregroundColor: isSelected
                                ? Colors.white
                                : AppColors.heading,
                            child: Text(
                              (emp.fullName ?? '?').isNotEmpty
                                  ? emp.fullName![0].toUpperCase()
                                  : '?',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          title: Text(
                            emp.fullName ?? '—',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: AppColors.heading,
                            ),
                          ),
                          subtitle: (emp.departmentName?.isNotEmpty == true ||
                                  emp.code?.isNotEmpty == true)
                              ? Text(
                                  [
                                    if (emp.code?.isNotEmpty == true) emp.code!,
                                    if (emp.departmentName?.isNotEmpty == true)
                                      emp.departmentName!,
                                  ].join(' • '),
                                  style: const TextStyle(
                                      fontSize: 12, color: AppColors.gray),
                                )
                              : null,
                          trailing: isSelected
                              ? const Icon(Icons.check_circle,
                                  color: AppColors.primaryERP)
                              : null,
                          onTap: () {
                            widget.onSelect(emp);
                            context.pop();
                          },
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