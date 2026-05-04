import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import '../../features/workplace/app/week_plan/data/datasource/models/week_plan_model.dart';
import '../app_theme/index.dart';

Future<void> openMultiSelectEmployeeSheet({
  required BuildContext context,
  required String title,
  required List<EmployeeTaskItem> allEmployees,
  required List<EmployeeTaskItem> selectedEmployees,
  required void Function(List<EmployeeTaskItem> selected) onConfirm,
}) async {
  final parentFocusScope = FocusScope.of(context);
  final previousCanRequestFocus = parentFocusScope.canRequestFocus;
  final previousDescendantsFocusable = parentFocusScope.descendantsAreFocusable;

  parentFocusScope.canRequestFocus = false;
  parentFocusScope.descendantsAreFocusable = false;

  FocusManager.instance.primaryFocus?.unfocus();

  await Future.delayed(const Duration(milliseconds: 80));

  try {
    await Navigator.of(context).push(
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (_) => _MultiSelectEmployeeSheet(
          title: title,
          allEmployees: allEmployees,
          selectedEmployees: selectedEmployees,
          onConfirm: onConfirm,
        ),
      ),
    );
  } finally {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      parentFocusScope.canRequestFocus = previousCanRequestFocus;
      parentFocusScope.descendantsAreFocusable = previousDescendantsFocusable;
    });
  }
}

class _MultiSelectEmployeeSheet extends StatefulWidget {
  final String title;
  final List<EmployeeTaskItem> allEmployees;
  final List<EmployeeTaskItem> selectedEmployees;
  final void Function(List<EmployeeTaskItem> selected) onConfirm;

  const _MultiSelectEmployeeSheet({
    required this.title,
    required this.allEmployees,
    required this.selectedEmployees,
    required this.onConfirm,
  });

  @override
  State<_MultiSelectEmployeeSheet> createState() =>
      _MultiSelectEmployeeSheetState();
}

class _MultiSelectEmployeeSheetState extends State<_MultiSelectEmployeeSheet> {
  late List<EmployeeTaskItem> _filtered;
  late List<EmployeeTaskItem> _selected;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  late final FocusScopeNode _modalFocusScope;

  @override
  void initState() {
    super.initState();

    _selected = List.from(widget.selectedEmployees);
    _filtered = List.from(widget.allEmployees);
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode(debugLabel: 'MultiSelectEmployeeSearch');
    _modalFocusScope = FocusScopeNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _modalFocusScope.requestFocus(_searchFocusNode);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _modalFocusScope.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        _filtered = List.from(widget.allEmployees);
      } else {
        _filtered = widget.allEmployees.where((e) {
          final name = '${e.code ?? ''} ${e.fullName ?? ''}'.toLowerCase();
          return name.contains(q);
        }).toList();
      }
    });
  }

  void _toggle(EmployeeTaskItem emp) {
    setState(() {
      final idx = _selected.indexWhere((e) => e.id == emp.id);
      if (idx >= 0) {
        _selected.removeAt(idx);
      } else {
        _selected.add(emp);
      }
    });
  }

  String _displayText(EmployeeTaskItem e) {
    return '${e.code ?? ''} - ${e.fullName ?? ''}';
  }

  @override
  Widget build(BuildContext context) {
    final sheetMaxHeight = MediaQuery.of(context).size.height * 0.70;
    final isEmpty = widget.allEmployees.isEmpty;

    return FocusScope(
      node: _modalFocusScope,
      canRequestFocus: true,
      autofocus: false,
      child: Sheet(
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
                          style: AppStyles.headingTitle2,
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
                    focusNode: _searchFocusNode,
                    autofocus: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Tìm kiếm nhân viên...',
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
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people_outline,
                                size: 56, color: Colors.grey),
                            SizedBox(height: 8),
                            Text(
                              'Không có dữ liệu',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 24),
                        itemCount: _filtered.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final emp = _filtered[index];
                          final isSelected =
                              _selected.any((e) => e.id == emp.id);

                          return ListTile(
                            title: Text(_displayText(emp)),
                            subtitle: emp.departmentName != null
                                ? Text(
                                    emp.departmentName!,
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
                            onTap: () => _toggle(emp),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
