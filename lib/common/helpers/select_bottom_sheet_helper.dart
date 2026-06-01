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
  VoidCallback? onAdd,
  T? initialSelectedItem,
}) async {
  final parentFocusScope = FocusScope.of(context);
  final previousCanRequestFocus = parentFocusScope.canRequestFocus;
  final previousDescendantsFocusable = parentFocusScope.descendantsAreFocusable;

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
          onAdd: onAdd,
          initialSelectedItem: initialSelectedItem,
        ),
      ),
    );
  } finally {
    // Trả lại khả năng focus cho màn hình cũ sau khi sheet đóng
    WidgetsBinding.instance.addPostFrameCallback((_) {
      parentFocusScope.canRequestFocus = previousCanRequestFocus;
      parentFocusScope.descendantsAreFocusable = previousDescendantsFocusable;
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
  final VoidCallback? onAdd;
  final T? initialSelectedItem;

  const _SelectSheet({
    required this.title,
    required this.items,
    required this.displayText,
    required this.onSelected,
    this.hintText,
    this.secondaryActionLabel,
    this.onSecondaryAction,
    this.onAdd,
    this.initialSelectedItem,
  });

  @override
  State<_SelectSheet<T>> createState() => _SelectSheetState<T>();
}

class _SelectSheetState<T> extends State<_SelectSheet<T>> {
  late List<T> _filtered;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  late final FocusScopeNode _modalFocusScope;
  late final ScrollController _scrollController;
  int? _initialSelectedIndex;

  @override
  void initState() {
    super.initState();

    _filtered = List.from(widget.items);
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode(debugLabel: 'BottomSheetSearchFocus');
    _modalFocusScope = FocusScopeNode();
    _scrollController = ScrollController();

    if (widget.initialSelectedItem != null) {
      final idx = widget.items.indexOf(widget.initialSelectedItem as T);
      if (idx >= 0) _initialSelectedIndex = idx;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestFocusAndScroll();
    });
  }

  void _requestFocusAndScroll() {
    if (!mounted) return;
    if (!widget.items.isEmpty) {
      // Tạm thời tắt auto-focus search vì ảnh hưởng scroll
      // _modalFocusScope.requestFocus(_searchFocusNode);
      if (_initialSelectedIndex != null && _filtered.isNotEmpty) {
        final idx = _initialSelectedIndex!;
        final actualIndex = (idx < _filtered.length)
            ? idx
            : _filtered.length - 1;
        if (actualIndex >= 0 && _scrollController.hasClients) {
          _scrollController.jumpTo(actualIndex * 56.0);
        }
        _initialSelectedIndex = null;
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _modalFocusScope.dispose();
    _scrollController.dispose();
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
    final hasSecondary =
        widget.secondaryActionLabel != null && widget.onSecondaryAction != null;
    final showSearch = !isEmpty;

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
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 8,
                  top: 12,
                  bottom: 12,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ), // Spacer cho cân đối với IconButton
                    Expanded(
                      child: Center(
                        child: Text(
                          widget.title,
                          style: AppStyles.headingTitle2,
                        ),
                      ),
                    ),
                    if (widget.onAdd != null)
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          widget.onAdd?.call();
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: AppColors.primaryERP,
                        ),
                      )
                    else
                      const SizedBox(width: 40),
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
                        padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
                        itemCount: (hasSecondary ? 1 : 0) + _filtered.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          if (hasSecondary && index == 0) {
                            return ListTile(
                              leading: const Icon(Icons.edit_outlined),
                              title: Text(widget.secondaryActionLabel!),
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

Future<void> openSelectBottomSheetGrouped<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  required String Function(T item) displayText,
  required String Function(T item) groupBy,
  required void Function(T value) onSelected,
  String? hintText,
  String? secondaryActionLabel,
  VoidCallback? onSecondaryAction,
  VoidCallback? onAdd,
  T? initialSelectedItem,
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
        builder: (_) => _SelectSheetGrouped<T>(
          title: title,
          items: items,
          displayText: displayText,
          groupBy: groupBy,
          onSelected: onSelected,
          hintText: hintText,
          secondaryActionLabel: secondaryActionLabel,
          onSecondaryAction: onSecondaryAction,
          onAdd: onAdd,
          initialSelectedItem: initialSelectedItem,
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

class _SelectSheetGrouped<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T item) displayText;
  final String Function(T item) groupBy;
  final void Function(T value) onSelected;
  final String? hintText;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;
  final VoidCallback? onAdd;
  final T? initialSelectedItem;

  const _SelectSheetGrouped({
    required this.title,
    required this.items,
    required this.displayText,
    required this.groupBy,
    required this.onSelected,
    this.hintText,
    this.secondaryActionLabel,
    this.onSecondaryAction,
    this.onAdd,
    this.initialSelectedItem,
  });

  @override
  State<_SelectSheetGrouped<T>> createState() => _SelectSheetGroupedState<T>();
}

class _SelectSheetGroupedState<T> extends State<_SelectSheetGrouped<T>> {
  late List<T> _filtered;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  late final FocusScopeNode _modalFocusScope;
  late final ScrollController _scrollController;
  int? _initialSelectedIndex;
  late Map<String, List<T>> _groupedItems;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
    _searchFocusNode = FocusNode(debugLabel: 'BottomSheetSearchFocus');
    _modalFocusScope = FocusScopeNode();
    _scrollController = ScrollController();
    _filtered = List.from(widget.items);
    _buildGroups();

    if (widget.initialSelectedItem != null) {
      final idx = widget.items.indexOf(widget.initialSelectedItem as T);
      if (idx >= 0) _initialSelectedIndex = idx;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestFocusAndScroll();
    });
  }

  void _buildGroups() {
    _groupedItems = {};
    for (final item in _filtered) {
      final key = widget.groupBy(item).isEmpty ? 'Khác' : widget.groupBy(item);
      _groupedItems.putIfAbsent(key, () => []).add(item);
    }
  }

  void _requestFocusAndScroll() {
    if (!mounted) return;
    if (!widget.items.isEmpty) {
      // Tạm thời tắt auto-focus search vì ảnh hưởng scroll
      // _modalFocusScope.requestFocus(_searchFocusNode);
      if (_initialSelectedIndex != null && _filtered.isNotEmpty) {
        final idx = _initialSelectedIndex!;
        final actualIndex = (idx < _filtered.length)
            ? idx
            : _filtered.length - 1;
        if (actualIndex >= 0 && _scrollController.hasClients) {
          _scrollController.jumpTo(actualIndex * 56.0);
        }
        _initialSelectedIndex = null;
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _modalFocusScope.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    final q = query.trim().toLowerCase();

    setState(() {
      _filtered = widget.items.where((e) {
        return widget.displayText(e).toLowerCase().contains(q) ||
            widget.groupBy(e).toLowerCase().contains(q);
      }).toList();
      _buildGroups();
    });
  }

  int _totalCount(bool hasSecondary, List<String> groupKeys) {
    int count = hasSecondary ? 1 : 0;
    for (final key in groupKeys) {
      count += 1;
      count += _groupedItems[key]?.length ?? 0;
    }
    return count;
  }

  int _resolveItemIndex(int index, bool hasSecondary, List<String> groupKeys) {
    int offset = hasSecondary ? 1 : 0;
    for (final key in groupKeys) {
      if (index == offset) return -1;
      offset += 1;
      final items = _groupedItems[key];
      if (items == null) continue;
      if (index < offset + items.length) {
        return index - offset;
      }
      offset += items.length;
    }
    return -1;
  }

  String _resolveGroupKey(int index, bool hasSecondary, List<String> groupKeys) {
    int offset = hasSecondary ? 1 : 0;
    for (final key in groupKeys) {
      if (index == offset) return key;
      offset += 1;
      final items = _groupedItems[key];
      if (items == null) continue;
      if (index < offset + items.length) {
        return key;
      }
      offset += items.length;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final sheetMaxHeight = MediaQuery.of(context).size.height * 0.65;
    final isEmpty = widget.items.isEmpty;
    final hasSecondary = widget.secondaryActionLabel != null &&
        widget.onSecondaryAction != null;
    final showSearch = !isEmpty;
    final groupKeys = _groupedItems.keys.toList();

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
                    if (widget.onAdd != null)
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          widget.onAdd?.call();
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: AppColors.primaryERP,
                        ),
                      )
                    else
                      const SizedBox(width: 40),
                  ],
                ),
              ),
              if (showSearch)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    autofocus: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: widget.hintText ?? 'Tìm kiếm...',
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
              Expanded(
                child: isEmpty && !hasSecondary
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    : groupKeys.isEmpty
                        ? const SizedBox.shrink()
                        : ListView.builder(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
                            controller: _scrollController,
                            itemCount: _totalCount(hasSecondary, groupKeys),
                            itemBuilder: (context, index) {
                              if (hasSecondary && index == 0) {
                                return ListTile(
                                  leading: const Icon(Icons.edit_outlined),
                                  title: Text(widget.secondaryActionLabel!),
                                  onTap: () {
                                    Navigator.pop(context);
                                    widget.onSecondaryAction?.call();
                                  },
                                );
                              }

                              final itemIndex = _resolveItemIndex(
                                  index, hasSecondary, groupKeys);
                              final groupKey =
                                  _resolveGroupKey(index, hasSecondary, groupKeys);

                              if (itemIndex == -1 && groupKey.isNotEmpty) {
                                return _GroupHeader(title: groupKey);
                              }

                              if (itemIndex == -1) {
                                return const SizedBox.shrink();
                              }

                              final groupItems = _groupedItems[groupKey];
                              if (groupItems == null || itemIndex >= groupItems.length) {
                                return const SizedBox.shrink();
                              }

                              final item = groupItems[itemIndex];

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

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 6),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.primaryERP,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryERP,
            ),
          ),
        ],
      ),
    );
  }
}
