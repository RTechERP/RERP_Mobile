import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../app_theme/index.dart';

Future<void> openSelectBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  required String Function(T item) displayText, // 👈 hiển thị
  required void Function(T value) onSelected,   // 👈 trả về object
  String? hintText,
  /// Hàng cố định phía trên danh sách (vd: nhập tay, bỏ chọn).
  String? secondaryActionLabel,
  VoidCallback? onSecondaryAction,
}) async {
  final controller = TextEditingController();
  List<T> filtered = List.from(items);

  await WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          topBarTitle: Text(title, style: AppStyles.headingTitle2),
          isTopBarLayerAlwaysVisible: true,
          child: SafeArea(
            top: false,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.55,
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  final isEmpty = items.isEmpty;
                  final hasSecondary =
                      secondaryActionLabel != null &&
                          onSecondaryAction != null;
                  final showSearch = !isEmpty;

                  return Column(
                    children: [
                      /// 🔍 SEARCH
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
                        child: TextField(
                          controller: controller,
                          autofocus: showSearch,
                          enabled: showSearch,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: hintText ?? 'Tìm kiếm...',
                            border: const OutlineInputBorder(),
                            isDense: true,
                          ),
                          onChanged: isEmpty
                              ? null
                              : (value) {
                            setState(() {
                              final q = value.toLowerCase();
                              filtered = items
                                  .where((e) =>
                                  displayText(e)
                                      .toLowerCase()
                                      .contains(q))
                                  .toList();
                            });
                          },
                        ),
                      ),

                      const Divider(height: 1),

                      /// 📜 CONTENT
                      Expanded(
                        child: isEmpty && !hasSecondary
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.insert_drive_file_outlined,
                                      size: 56, color: Colors.grey),
                                  SizedBox(height: 8),
                                  Text('Không có dữ liệu',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              )
                            : ListView.separated(
                                padding: const EdgeInsets.fromLTRB(
                                    12, 6, 12, 12),
                                itemCount:
                                    (hasSecondary ? 1 : 0) + filtered.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 1),
                                itemBuilder: (context, index) {
                                  if (hasSecondary && index == 0) {
                                    return ListTile(
                                      leading: const Icon(
                                        Icons.edit_outlined,
                                      ),
                                      title: Text(secondaryActionLabel),
                                      onTap: () {
                                        Navigator.pop(context);
                                        onSecondaryAction();
                                      },
                                    );
                                  }
                                  final fi = index - (hasSecondary ? 1 : 0);
                                  final item = filtered[fi];
                                  return ListTile(
                                    title: Text(displayText(item)),
                                    onTap: () {
                                      Navigator.pop(context);
                                      onSelected(item);
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ];
    },
  );
}

