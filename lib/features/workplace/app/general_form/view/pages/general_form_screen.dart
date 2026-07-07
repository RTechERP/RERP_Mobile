import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/constants/index.dart';
import 'package:rtc_erp/common/helpers/select_bottom_sheet_helper.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart';
import 'package:rtc_erp/features/workplace/app/general_form/data/datasource/model/general_form_model.dart';
import 'package:rtc_erp/features/workplace/app/general_form/view/bloc/general_form_bloc.dart';
import 'package:rtc_erp/features/workplace/app/general_form/view/widgets/general_form_card.dart';
import 'package:rtc_erp/features/workplace/app/reports/data/datasource/models/report_model.dart';
import 'package:rtc_erp/routes/route_names.dart';

class GeneralFormScreen extends StatefulWidget {
  const GeneralFormScreen({super.key});

  @override
  State<GeneralFormScreen> createState() => _GeneralFormScreenState();
}

class _GeneralFormScreenState
    extends BaseState<GeneralFormScreen, GeneralFormEvent, GeneralFormState,
        GeneralFormBloc> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const GeneralFormEvent.init());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmit() {
    final keyword = _searchController.text.trim();
    bloc.add(GeneralFormEvent.search(keyword: keyword));
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _isSearchActive = false);
    bloc.add(const GeneralFormEvent.changeKeyword(keyword: ''));
  }

  void _showDepartmentPicker(BuildContext context, GeneralFormState state) {
    final allOption = DepartResponse(
      id: -1,
      name: 'Tất cả',
      code: '',
    );

    final itemsWithAll = [allOption, ...state.departments];

    openSelectBottomSheet<DepartResponse>(
      context: context,
      title: 'Chọn phòng ban',
      items: itemsWithAll,
      displayText: (item) => item.id == -1 ? 'Tất cả' : item.name,
      hintText: 'Tìm kiếm phòng ban...',
      initialSelectedItem: itemsWithAll.firstWhere(
        (d) => d.id == (state.selectedDepartmentId ?? -1),
        orElse: () => allOption,
      ),
      onSelected: (dept) {
        bloc.add(GeneralFormEvent.changeDepartment(
          departmentId: dept.id,
        ));
      },
    );
  }

  String _getSelectedDepartmentName(GeneralFormState state) {
    if (state.selectedDepartmentId == null) return 'Tất cả';
    try {
      final dept = state.departments.firstWhere(
        (d) => d.id == state.selectedDepartmentId,
      );
      return dept.name;
    } catch (_) {
      return 'Tất cả';
    }
  }

  static FormItem _skeletonItem(int i) => FormItem(
        id: i,
        stt: i,
        nameDocumentType: 'Loại tài liệu skeleton',
        code: 'DOC-$i',
        nameDocument: 'Tên tài liệu mẫu skeleton data',
        datePromulgate: DateTime.now(),
        dateEffective: DateTime.now().add(const Duration(days: 30)),
        departmentName: 'Phòng ban skeleton',
        departmentCode: 'PB-$i',
        departmentId: i,
        departmentCode1: 'PB1-$i',
      );

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<GeneralFormBloc, GeneralFormState>(
      listenWhen: (prev, curr) =>
          prev.message != curr.message &&
          curr.message != null &&
          curr.message!.isNotEmpty,
      listener: (context, state) {
        if ((state.message ?? '').isNotEmpty) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<GeneralFormBloc, GeneralFormState>(
        bloc: bloc,
        builder: (context, state) {
          return BaseScaffold(
            backgroundColor: const Color(0xFFF4F7FB),
            appBar: AppBarCommon(
              onBackTap: () => _isSearchActive ? _clearSearch() : context.pop(),
              title: _isSearchActive
                  ? _buildSearchField()
                  : const Text('Mẫu biểu tổng hợp'),
              actions: _isSearchActive
                  ? [
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          tooltip: 'Xoá tìm kiếm',
                          onPressed: () {
                            _searchController.clear();
                            bloc.add(const GeneralFormEvent.changeKeyword(keyword: ''));
                            setState(() {});
                          },
                        ),
                    ]
                  : [
                      IconButton(
                        icon: const Icon(Icons.search),
                        tooltip: 'Tìm kiếm',
                        onPressed: () => setState(() => _isSearchActive = true),
                      ),
                    ],
            ),
            body: Column(
              children: [
                // Department filter chip
                _DepartmentFilterChip(
                  selectedName: _getSelectedDepartmentName(state),
                  onTap: () => _showDepartmentPicker(context, state),
                ),
                // Content
                Expanded(
                  child: _buildBody(
                    context,
                    state: state,
                    isInitialLoading: state.status == BaseStateStatus.loading &&
                        state.formItems.isEmpty,
                    failed: state.status == BaseStateStatus.failed &&
                        state.formItems.isEmpty,
                    onRetry: () => bloc.add(const GeneralFormEvent.init()),
                    onRefresh: () async {
                      bloc.add(const GeneralFormEvent.init());
                      await bloc.stream.firstWhere(
                        (s) => s.status != BaseStateStatus.loading,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Tìm kiếm biểu mẫu...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.gray),
      ),
      style: const TextStyle(fontSize: 16),
      textInputAction: TextInputAction.search,
      onSubmitted: (_) => _onSearchSubmit(),
      onChanged: (value) {
        setState(() {});
        bloc.add(GeneralFormEvent.changeKeyword(keyword: value));
      },
    );
  }

  Widget _buildBody(
    BuildContext context, {
    required GeneralFormState state,
    required bool isInitialLoading,
    required bool failed,
    required VoidCallback onRetry,
    required Future<void> Function() onRefresh,
  }) {
    final groupedItems = state.sortedGroupedItems;
    final allItems = groupedItems.expand((e) => e.value).toList();

    // Error state
    if (failed && allItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 280),
            const SizedBox(height: 12),
            Text(state.message ?? 'Tải dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    // Empty state
    if (allItems.isEmpty && !isInitialLoading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 280),
            const SizedBox(height: 10),
            const Text('Không có dữ liệu'),
          ],
        ),
      );
    }

    // No search results
    if (allItems.isEmpty && state.searchKeyword.isNotEmpty && !isInitialLoading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 280),
            const SizedBox(height: 10),
            Text('Không tìm thấy "${state.searchKeyword}"'),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _clearSearch,
              child: const Text('Xoá tìm kiếm'),
            ),
          ],
        ),
      );
    }

    return Skeletonizer(
      containersColor: AppColors.white,
      enabled: isInitialLoading,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _calculateItemCount(groupedItems, isInitialLoading),
          itemBuilder: (context, index) {
            return _buildItem(
              context,
              groupedItems,
              index,
              isInitialLoading,
            );
          },
        ),
      ),
    );
  }

  int _calculateItemCount(
    List<MapEntry<String, List<FormItem>>> groupedItems,
    bool isInitialLoading,
  ) {
    if (isInitialLoading) {
      // Show 5 skeleton items for initial loading
      return 5;
    }
    // Each group has: 1 header + N items
    int count = 0;
    for (final entry in groupedItems) {
      count += 1; // header
      count += entry.value.length; // items
      count += groupedItems.indexOf(entry) < groupedItems.length - 1 ? 1 : 0; // group spacing
    }
    return count;
  }

  Widget _buildItem(
    BuildContext context,
    List<MapEntry<String, List<FormItem>>> groupedItems,
    int index,
    bool isInitialLoading,
  ) {
    if (isInitialLoading) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: GeneralFormCard(
          item: _skeletonItem(index),
        ),
      );
    }

    int currentIndex = 0;

    for (int g = 0; g < groupedItems.length; g++) {
      final entry = groupedItems[g];
      final deptName = entry.key.split('|').last;
      final items = entry.value;

      // Spacing before header (skip for first group)
      if (g > 0) {
        if (index == currentIndex) {
          return const SizedBox(height: 16);
        }
        currentIndex++;
      }

      // Group header
      if (index == currentIndex) {
        return _GroupHeader(departmentName: deptName, itemCount: items.length);
      }
      currentIndex++;

      // Items in this group
      for (int i = 0; i < items.length; i++) {
        if (index == currentIndex) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GeneralFormCard(
              item: items[i],
              onTap: () {
                context.push(
                  RouteNames.generalFormDetail,
                  extra: {
                    'documentId': items[i].id ?? 0,
                    'documentName': items[i].nameDocument ?? 'Chi tiết biểu mẫu',
                  },
                );
              },
            ),
          );
        }
        currentIndex++;
      }
    }

    return const SizedBox.shrink();
  }
}

class _DepartmentFilterChip extends StatelessWidget {
  const _DepartmentFilterChip({
    required this.selectedName,
    required this.onTap,
  });

  final String selectedName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xFFE0E0E0)),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.filter_list,
              size: 20,
              color: AppColors.primaryERP,
            ),
            const SizedBox(width: 8),
            const Text(
              'Phòng ban: ',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.gray,
              ),
            ),
            Expanded(
              child: Text(
                selectedName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.enableText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({
    required this.departmentName,
    required this.itemCount,
  });

  final String departmentName;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.business,
              size: 18,
              color: AppColors.primaryERP,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              departmentName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.enableText,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$itemCount biểu mẫu',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryERP,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
