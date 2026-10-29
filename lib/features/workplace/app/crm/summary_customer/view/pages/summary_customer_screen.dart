import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../data/datasource/models/summary_customer_model.dart';
import '../../view/bloc/summary_customer_bloc.dart';
import '../../view/widgets/summary_customer_card.dart';
import '../../view/widgets/summary_customer_project_sheet.dart';

/// Màn hình tổng hợp khách hàng CRM.
///
/// Hiển thị danh sách khách hàng kèm số dự án tương ứng, hỗ trợ tìm kiếm
/// theo tên/mã khách hàng hoặc mã/tên dự án.
class SummaryCustomerScreen extends StatefulWidget {
  const SummaryCustomerScreen({super.key});

  @override
  State<SummaryCustomerScreen> createState() => _SummaryCustomerScreenState();
}

class _SummaryCustomerScreenState extends BaseState<
    SummaryCustomerScreen,
    SummaryCustomerEvent,
    SummaryCustomerState,
    SummaryCustomerBloc> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  bool _isSearchOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const SummaryCustomerEvent.init());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearchOpen = !_isSearchOpen;
      if (_isSearchOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _searchFocusNode.requestFocus();
        });
      } else {
        _searchFocusNode.unfocus();
        if (_searchController.text.isNotEmpty) {
          _searchController.clear();
          bloc.add(const SummaryCustomerEvent.changeKeyword(keyword: ''));
        }
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    bloc.add(const SummaryCustomerEvent.changeKeyword(keyword: ''));
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<SummaryCustomerBloc, SummaryCustomerState>(
      builder: (context, state) {
        final loading = state.status == BaseStateStatus.loading;
        final failed = state.status == BaseStateStatus.failed;
        final groups = state.displayGroups;
        final isInitialLoading = loading && groups.isEmpty;

        return BaseScaffold(
          appBar: AppBarCommon(
            onBackTap: () => context.pop(),
            title: _isSearchOpen
                ? _buildSearchField()
                : Text(
                    'Tổng hợp khách hàng',
                    style: AppStyles.headingTitle2,
                  ),
            actions: [
              IconButton(
                icon: Icon(_isSearchOpen ? Icons.close : Icons.search),
                tooltip: _isSearchOpen ? 'Đóng tìm kiếm' : 'Tìm kiếm',
                onPressed: _toggleSearch,
              ),
            ],
          ),
          body: Column(
            children: [
              _ListHeader(
                customerCount: groups.length,
                projectCount: groups.fold<int>(
                  0,
                  (sum, group) => sum + group.projectCount,
                ),
              ),
              Expanded(
                child: _buildContent(
                  context,
                  state,
                  loading,
                  failed,
                  groups,
                  isInitialLoading,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Ô tìm kiếm hiển thị tại vị trí title của AppBar.
  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      focusNode: _searchFocusNode,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onChanged: (value) =>
          bloc.add(SummaryCustomerEvent.changeKeyword(keyword: value)),
      onSubmitted: (value) => bloc.add(
        SummaryCustomerEvent.changeKeyword(keyword: value.trim()),
      ),
      style: const TextStyle(fontSize: 14, color: AppColors.heading),
      decoration: InputDecoration(
        hintText: 'Tìm khách hàng / dự án',
        hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 14),
        prefixIcon: const Icon(Icons.search, color: AppColors.gray, size: 20),
        prefixIconConstraints: const BoxConstraints(minWidth: 36, minHeight: 36),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _searchController,
          builder: (context, value, _) {
            if (value.text.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.clear, color: AppColors.gray, size: 18),
              onPressed: _clearSearch,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            );
          },
        ),
        isDense: true,
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
          borderSide: const BorderSide(color: AppColors.primaryERP, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    SummaryCustomerState state,
    bool loading,
    bool failed,
    List<SummaryCustomerGroup> groups,
    bool isInitialLoading,
  ) {
    if (failed && groups.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            Text(state.message ?? 'Load dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => bloc.add(const SummaryCustomerEvent.refresh()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (groups.isEmpty && !isInitialLoading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 10),
            Text(
              state.keyword.isNotEmpty
                  ? 'Không tìm thấy khách hàng phù hợp'
                  : 'Không có dữ liệu',
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const SummaryCustomerEvent.refresh());
        await bloc.stream
            .firstWhere((s) => s.status != BaseStateStatus.loading);
      },
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return SummaryCustomerCard(
            group: group,
            onTapProjects: () => SummaryCustomerProjectSheet.show(
              context,
              customerName: group.customerName,
              customerCode: group.customerCode,
              projects: group.projects,
            ),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(height: 8),
      ),
    );
  }
}

/// Header hiển thị tổng số khách hàng và tổng số dự án.
class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.customerCount,
    required this.projectCount,
  });

  final int customerCount;
  final int projectCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Flexible(
                  child: Text(
                    '$customerCount',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.1,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Tổng số khách hàng',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.business_outlined,
                  size: 14,
                  color: AppColors.primaryERP,
                ),
                const SizedBox(width: 6),
                Text(
                  '$projectCount dự án',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryERP,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
