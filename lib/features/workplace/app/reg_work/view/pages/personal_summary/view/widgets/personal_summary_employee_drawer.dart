// Drawer chọn nhân sự cho tab Vân tay.
// Hiển thị danh sách STT - Mã NV - Họ và tên. Có ô tìm nhanh
// (filter client-side theo Mã NV / Tên).
import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/personal_summary_model.dart';

class PersonalSummaryEmployeeDrawer extends StatefulWidget {
  const PersonalSummaryEmployeeDrawer({
    super.key,
    required this.employees,
    required this.selectedEmployeeId,
    required this.isLoading,
    required this.onSelect,
  });

  /// Danh sách nhân viên đã load (cache từ bloc).
  final List<PersonalAttendanceEmployee> employees;

  /// Nhân viên đang chọn (null = bỏ chọn).
  final int? selectedEmployeeId;

  /// Đang gọi API lấy danh sách nhân viên.
  final bool isLoading;

  /// Callback chọn nhân viên. Truyền `null` để bỏ chọn.
  final void Function(int? employeeId) onSelect;

  @override
  State<PersonalSummaryEmployeeDrawer> createState() =>
      _PersonalSummaryEmployeeDrawerState();
}

class _PersonalSummaryEmployeeDrawerState
    extends State<PersonalSummaryEmployeeDrawer> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  String _keyword = '';

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            const Divider(height: 1),
            _buildSearchBox(),
            const Divider(height: 1),
            Expanded(child: _buildList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
      child: Row(
        children: [
          const Icon(Icons.people_alt_outlined,
              color: AppColors.primaryERP, size: 22),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Chọn nhân sự',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
          ),
          if (widget.selectedEmployeeId != null)
            TextButton(
              onPressed: () {
                widget.onSelect(null);
                Navigator.of(context).pop();
              },
              child: const Text('Bỏ chọn'),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocus,
        style: const TextStyle(fontSize: 14, color: AppColors.heading),
        onChanged: (v) => setState(() => _keyword = v.trim().toLowerCase()),
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Tìm theo Mã NV hoặc Tên',
          hintStyle:
              const TextStyle(color: AppColors.hintText, fontSize: 14),
          prefixIcon:
              const Icon(Icons.search, color: AppColors.gray, size: 20),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 36, minHeight: 36),
          suffixIcon: _keyword.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(Icons.clear,
                      color: AppColors.gray, size: 18),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _keyword = '');
                  },
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minWidth: 36, minHeight: 36),
                ),
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
            borderSide:
                const BorderSide(color: AppColors.primaryERP, width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (widget.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final filtered = _filter();
    if (filtered.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Text(
            widget.employees.isEmpty
                ? 'Không có nhân viên trong phòng ban này.'
                : 'Không tìm thấy nhân viên phù hợp.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.enableText),
          ),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: filtered.length,
      separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
      itemBuilder: (_, i) {
        final e = filtered[i];
        final stt = i + 1;
        final selected = widget.selectedEmployeeId == e.id;
        return ListTile(
          dense: true,
          selected: selected,
          selectedTileColor:
              AppColors.primaryERP.withValues(alpha: 0.08),
          leading: SizedBox(
            width: 36,
            child: Text(
              '$stt',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.gray,
              ),
            ),
          ),
          title: Text(
            e.fullName ?? '—',
            style: TextStyle(
              fontSize: 14,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
          subtitle: Text(
            'Mã NV: ${e.code ?? '—'}',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.enableText,
            ),
          ),
          trailing: selected
              ? const Icon(Icons.check_circle, color: AppColors.primaryERP)
              : null,
          onTap: () {
            widget.onSelect(e.id);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  List<PersonalAttendanceEmployee> _filter() {
    if (_keyword.isEmpty) return widget.employees;
    return widget.employees.where((e) {
      final code = e.code?.toLowerCase() ?? '';
      final name = e.fullName?.toLowerCase() ?? '';
      return code.contains(_keyword) || name.contains(_keyword);
    }).toList();
  }
}
