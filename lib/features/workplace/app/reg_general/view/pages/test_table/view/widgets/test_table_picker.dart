// Date: 06/09/2026
// Nội dung/Chức năng: Bottom sheet chọn bàn test ESL với chip trạng thái
// (Sẵn sàng / Đang sử dụng) hiển thị ở trailing của mỗi item. Bàn đang được
// đăng ký (`isRegistrated == 1`) sẽ bị disable, không cho phép chọn.

import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/test_table_model.dart';

/// Mở bottom sheet chọn bàn test với hiển thị trạng thái sẵn sàng / đang sử dụng.
///
/// Trả về [TestTableItem] đã chọn, hoặc `null` nếu user đóng sheet / không chọn.
Future<TestTableItem?> openTestTablePicker({
  required BuildContext context,
  required List<TestTableItem> items,
  TestTableItem? initialSelectedItem,
  String hintText = 'Tìm bàn test...',
}) async {
  final parentFocusScope = FocusScope.of(context);
  final previousCanRequestFocus = parentFocusScope.canRequestFocus;
  final previousDescendantsAreFocusable = parentFocusScope.descendantsAreFocusable;

  // Khóa focus của màn hình phía sau trong khi sheet mở.
  parentFocusScope.canRequestFocus = false;
  parentFocusScope.descendantsAreFocusable = false;
  FocusManager.instance.primaryFocus?.unfocus();

  await Future.delayed(const Duration(milliseconds: 80));

  try {
    final picked = await Navigator.of(context).push<TestTableItem>(
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (_) => _TestTablePickerSheet(
          items: items,
          initialSelectedItem: initialSelectedItem,
          hintText: hintText,
        ),
      ),
    );
    return picked;
  } finally {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      parentFocusScope.canRequestFocus = previousCanRequestFocus;
      parentFocusScope.descendantsAreFocusable = previousDescendantsAreFocusable;
    });
  }
}

/// Trạng thái bàn test hiển thị trong danh sách.
enum _TestTableStatus { available, inUse }

/// Map trạng thái từ [TestTableItem]: `isRegistrated == 1` ⇒ đang được đăng ký.
_TestTableStatus _statusOf(TestTableItem item) {
  return item.isRegistrated == 1
      ? _TestTableStatus.inUse
      : _TestTableStatus.available;
}

class _TestTablePickerSheet extends StatefulWidget {
  final List<TestTableItem> items;
  final TestTableItem? initialSelectedItem;
  final String hintText;

  const _TestTablePickerSheet({
    required this.items,
    this.initialSelectedItem,
    required this.hintText,
  });

  @override
  State<_TestTablePickerSheet> createState() => _TestTablePickerSheetState();
}

class _TestTablePickerSheetState extends State<_TestTablePickerSheet> {
  late List<TestTableItem> _filtered;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _filtered = List.from(widget.items);
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String q) {
    final lower = q.toLowerCase();
    setState(() {
      if (lower.isEmpty) {
        _filtered = List.from(widget.items);
      } else {
        _filtered = widget.items
            .where((e) =>
                (e.testTableName ?? '').toLowerCase().contains(lower))
            .toList();
      }
    });
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
          mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(width: 40), // Spacer cân đối với close button
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Chọn bàn test',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.black54),
                  ),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: TextField(
                controller: _searchController,
                autofocus: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: widget.hintText,
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
            Flexible(
              child: isEmpty
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.insert_drive_file_outlined,
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
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
                      itemCount: _filtered.length,
                      separatorBuilder: (_, _) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final item = _filtered[index];
                        final status = _statusOf(item);
                        final isInUse =
                            status == _TestTableStatus.inUse;
                        final selected = widget.initialSelectedItem?.id !=
                                null &&
                            widget.initialSelectedItem!.id == item.id;

                        return ListTile(
                          enabled: !isInUse,
                          title: Text(
                            item.testTableName ?? '',
                            style: TextStyle(
                              color: isInUse
                                  ? Colors.grey.shade500
                                  : Colors.black87,
                              fontWeight: selected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                          trailing: _StatusChip(
                            label: status == _TestTableStatus.available
                                ? 'Sẵn sàng'
                                : 'Đang sử dụng',
                            color: status == _TestTableStatus.available
                                ? AppColors.stateSuccessColor
                                : AppColors.alert,
                          ),
                          onTap: isInUse
                              ? null
                              : () => Navigator.pop(context, item),
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

/// Chip trạng thái dạng pill — đặt ở trailing của mỗi dòng trong picker.
class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: 0.4),
          width: 0.8,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
