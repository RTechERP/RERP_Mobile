// Date: 08/09/2026
// Nội dung/Chức năng: Bottom sheet chọn nhiều máy test cùng lúc cho bàn test ESL.
// User tap checkbox để chọn/bỏ chọn, bấm "Xong" để xác nhận.

import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/test_table_model.dart';

/// Mở bottom sheet chọn nhiều máy test (multi-select).
///
/// Sau khi đóng sheet sẽ gọi [onConfirm] với danh sách các [TestMachineItem]
/// đã chọn.
Future<void> openMultiSelectMachineSheet({
  required BuildContext context,
  required String title,
  required List<TestMachineItem> allMachines,
  required List<TestMachineItem> selectedMachines,
  required void Function(List<TestMachineItem> selected) onConfirm,
}) async {
  final parentFocusScope = FocusScope.of(context);
  final previousCanRequestFocus = parentFocusScope.canRequestFocus;
  final previousDescendantsFocusable =
      parentFocusScope.descendantsAreFocusable;

  parentFocusScope.canRequestFocus = false;
  parentFocusScope.descendantsAreFocusable = false;
  FocusManager.instance.primaryFocus?.unfocus();

  await Future.delayed(const Duration(milliseconds: 80));

  try {
    await Navigator.of(context).push(
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (_) => _MultiSelectMachineSheet(
          title: title,
          allMachines: allMachines,
          selectedMachines: selectedMachines,
          onConfirm: onConfirm,
        ),
      ),
    );
  } finally {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      parentFocusScope.canRequestFocus = previousCanRequestFocus;
      parentFocusScope.descendantsAreFocusable =
          previousDescendantsFocusable;
    });
  }
}

class _MultiSelectMachineSheet extends StatefulWidget {
  final String title;
  final List<TestMachineItem> allMachines;
  final List<TestMachineItem> selectedMachines;
  final void Function(List<TestMachineItem> selected) onConfirm;

  const _MultiSelectMachineSheet({
    required this.title,
    required this.allMachines,
    required this.selectedMachines,
    required this.onConfirm,
  });

  @override
  State<_MultiSelectMachineSheet> createState() =>
      _MultiSelectMachineSheetState();
}

class _MultiSelectMachineSheetState extends State<_MultiSelectMachineSheet> {
  late List<TestMachineItem> _filtered;
  late List<TestMachineItem> _selected;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _selected = List.from(widget.selectedMachines);
    _filtered = List.from(widget.allMachines);
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String q) {
    final lower = q.trim().toLowerCase();
    setState(() {
      if (lower.isEmpty) {
        _filtered = List.from(widget.allMachines);
      } else {
        _filtered = widget.allMachines.where((m) {
          final code = (m.machineCode ?? '').toLowerCase();
          final name = (m.machineName ?? '').toLowerCase();
          final ip = (m.ip ?? '').toLowerCase();
          return code.contains(lower) ||
              name.contains(lower) ||
              ip.contains(lower);
        }).toList();
      }
    });
  }

  void _toggle(TestMachineItem machine) {
    setState(() {
      final idx = _selected.indexWhere((m) => m.id == machine.id);
      if (idx >= 0) {
        _selected.removeAt(idx);
      } else {
        _selected.add(machine);
      }
    });
  }

  String _displayText(TestMachineItem m) {
    final code = m.machineCode ?? '';
    final name = m.machineName ?? '';
    final ip = m.ip ?? '';
    if (ip.isNotEmpty) {
      return '$code - $name ($ip)'.trim();
    }
    return '$code - $name'.trim().replaceAll(RegExp(r'^-\s*|\s*-$'), '');
  }

  @override
  Widget build(BuildContext context) {
    final sheetMaxHeight = MediaQuery.of(context).size.height * 0.65;
    final isEmpty = _filtered.isEmpty;

    return Sheet(
      initialOffset: const SheetOffset(0.0),
      decoration: const MaterialSheetDecoration(
        size: SheetSize.fit,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: sheetMaxHeight),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 8,
                top: 12,
                bottom: 12,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 40),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      widget.onConfirm(_selected);
                    },
                    child: Text(
                      'Xong (${_selected.length})',
                      style: const TextStyle(
                        color: AppColors.primaryERP,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search
            if (!isEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: TextField(
                  controller: _searchController,
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Tìm máy test...',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  onChanged: _onSearch,
                ),
              ),

            const Divider(height: 1),

            // List
            Expanded(
              child: isEmpty
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.devices_outlined,
                          size: 56,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Không có dữ liệu',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 24),
                      itemCount: _filtered.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final machine = _filtered[index];
                        final isSelected = _selected.any((m) => m.id == machine.id);

                        return ListTile(
                          title: Text(
                            _displayText(machine),
                            style: TextStyle(
                              fontWeight:
                                  isSelected ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                          subtitle: machine.ip != null
                              ? Text(
                                  'IP: ${machine.ip}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.gray,
                                  ),
                                )
                              : null,
                          trailing: isSelected
                              ? const Icon(
                                  Icons.check_circle,
                                  color: AppColors.primaryERP,
                                )
                              : const Icon(
                                  Icons.circle_outlined,
                                  color: AppColors.borderColor,
                                ),
                          onTap: () => _toggle(machine),
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
