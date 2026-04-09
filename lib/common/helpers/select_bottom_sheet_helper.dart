import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import '../app_theme/index.dart';

Future<void> openSelectBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  required String Function(T item) displayText,
  required void Function(T value) onSelected,
  String? hintText,
  String? secondaryActionLabel,
  VoidCallback? onSecondaryAction,
}) async {
  final parentFocusScope = FocusScope.of(context);
  final previousCanRequestFocus = parentFocusScope.canRequestFocus;
  final previousDescendantsFocusable =
      parentFocusScope.descendantsAreFocusable;

  // Khóa toàn bộ focus của màn hình phía sau
  parentFocusScope.canRequestFocus = false;
  parentFocusScope.descendantsAreFocusable = false;

  FocusManager.instance.primaryFocus?.unfocus();

  await Future.delayed(const Duration(milliseconds: 80));

  try {
    await Navigator.of(context).push(
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (_) => _SelectSheet<T>(
          title: title,
          items: items,
          displayText: displayText,
          onSelected: onSelected,
          hintText: hintText,
          secondaryActionLabel: secondaryActionLabel,
          onSecondaryAction: onSecondaryAction,
        ),
      ),
    );
  } finally {
    // Trả lại khả năng focus cho màn hình cũ sau khi sheet đóng
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      parentFocusScope.canRequestFocus = previousCanRequestFocus;
      parentFocusScope.descendantsAreFocusable =
          previousDescendantsFocusable;
    });
  }
}

class _SelectSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T item) displayText;
  final void Function(T value) onSelected;
  final String? hintText;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;

  const _SelectSheet({
    required this.title,
    required this.items,
    required this.displayText,
    required this.onSelected,
    this.hintText,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  });

  @override
  State<_SelectSheet<T>> createState() => _SelectSheetState<T>();
}

class _SelectSheetState<T> extends State<_SelectSheet<T>> {
  late List<T> _filtered;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  late final FocusScopeNode _modalFocusScope;

  @override
  void initState() {
    super.initState();

    _filtered = List.from(widget.items);
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode(debugLabel: 'BottomSheetSearchFocus');
    _modalFocusScope = FocusScopeNode();
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
      _filtered = widget.items.where((e) {
        return widget.displayText(e).toLowerCase().contains(q);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sheetMaxHeight = MediaQuery.of(context).size.height * 0.65;
    final isEmpty = widget.items.isEmpty;
    final hasSecondary = widget.secondaryActionLabel != null &&
        widget.onSecondaryAction != null;
    final showSearch = !isEmpty;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      if (!showSearch) return;

      // ép focus lại sau khi toàn bộ sheet render xong
      await Future.delayed(const Duration(milliseconds: 30));

      if (!mounted) return;

      _modalFocusScope.requestFocus(_searchFocusNode);
    });

    return FocusScope(
      node: _modalFocusScope,
      canRequestFocus: true,
      autofocus: false,
      child: Sheet(
        initialOffset: const SheetOffset(1.0),
        decoration: const MaterialSheetDecoration(
          size: SheetSize.fit,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: sheetMaxHeight,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: AppStyles.headingTitle2,
                    ),
                    Positioned(
                      right: -12,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),

              if (showSearch)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,

                    // QUAN TRỌNG: bỏ autofocus
                    autofocus: false,

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: widget.hintText ?? 'Tìm kiếm...',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                    onChanged: _onSearch,
                  ),
                ),

              const Divider(height: 1),

              Expanded(
                child: isEmpty && !hasSecondary
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
                  keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    6,
                    16,
                    24,
                  ),
                  itemCount:
                  (hasSecondary ? 1 : 0) + _filtered.length,
                  separatorBuilder: (_, __) =>
                  const Divider(height: 1),
                  itemBuilder: (context, index) {
                    if (hasSecondary && index == 0) {
                      return ListTile(
                        leading:
                        const Icon(Icons.edit_outlined),
                        title:
                        Text(widget.secondaryActionLabel!),
                        onTap: () {
                          Navigator.pop(context);
                          widget.onSecondaryAction?.call();
                        },
                      );
                    }

                    final fi = index - (hasSecondary ? 1 : 0);
                    final item = _filtered[fi];

                    return ListTile(
                      title: Text(widget.displayText(item)),
                      onTap: () {
                        Navigator.pop(context);
                        widget.onSelected(item);
                      },
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