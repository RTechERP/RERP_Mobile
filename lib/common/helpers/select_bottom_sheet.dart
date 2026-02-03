import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../app_theme/index.dart';

Future<void> openSelectBottomSheet({
  required BuildContext context,
  required String title,
  required List<String> items,
  required void Function(String value) onSelected,
  String? hintText,
}) async {
  final controller = TextEditingController();
  List<String> filtered = List.from(items);

  await WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          topBarTitle: Text(title, style: AppStyles.headingTitle2),
          isTopBarLayerAlwaysVisible: true,

          child: SafeArea(
            top: false, // 👈 vì top bar đã xử lý padding rồi
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.55,
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: [
                      /// 🔍 SEARCH
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
                        child: TextField(
                          controller: controller,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: hintText ?? 'Tìm kiếm...',
                            border: const OutlineInputBorder(),
                            isDense: true,
                          ),
                          onChanged: (value) {
                            setState(() {
                              filtered = items
                                  .where(
                                    (e) => e
                                    .toLowerCase()
                                    .contains(value.toLowerCase()),
                              )
                                  .toList();
                            });
                          },
                        ),
                      ),

                      const Divider(height: 1),

                      /// 📜 LIST
                      Expanded(
                        child: ListView.separated(
                          padding:
                          const EdgeInsets.fromLTRB(12, 6, 12, 12),
                          itemCount: filtered.length,
                          separatorBuilder: (_, __) =>
                          const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final item = filtered[index];
                            return ListTile(
                              title: Text(item),
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