import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../../view/bloc/lead_marketing_bloc.dart';
import '../../view/widgets/lead_marketing_card.dart';
import '../../view/widgets/lead_marketing_detail_sheet.dart';

/// Màn hình danh sách phiếu lead của phòng ban Marketing trong CRM.
///
/// Hỗ trợ tìm kiếm, chọn khoảng thời gian và bộ lọc theo nguồn lead,
/// nhân viên marketing / sale.
class LeadMarketingScreen extends StatefulWidget {
  const LeadMarketingScreen({super.key});

  @override
  State<LeadMarketingScreen> createState() => _LeadMarketingScreenState();
}

class _LeadMarketingScreenState extends BaseState<
    LeadMarketingScreen,
    LeadMarketingEvent,
    LeadMarketingState,
    LeadMarketingBloc> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  bool _isSearchOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const LeadMarketingEvent.init());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  /// Mở / đóng ô tìm kiếm trên AppBar.
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
          bloc.add(const LeadMarketingEvent.changeKeyword(keyword: ''));
        }
      }
    });
  }

  /// Xóa nội dung tìm kiếm.
  void _clearSearch() {
    _searchController.clear();
    bloc.add(const LeadMarketingEvent.changeKeyword(keyword: ''));
  }

  /// Mở bottom sheet chọn khoảng thời gian.
  void _showDateRangePicker(LeadMarketingState state) {
    final now = DateTime.now();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? DateTime(now.year, now.month, 1),
        initialEnd: state.dateEnd ?? now,
        onApply: (start, end) {
          bloc.add(LeadMarketingEvent.changeDateRange(
            dateStart: start,
            dateEnd: end,
          ));
        },
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<LeadMarketingBloc, LeadMarketingState>(
      builder: (context, state) {
        final loading = state.status == BaseStateStatus.loading;
        final failed = state.status == BaseStateStatus.failed;
        final leads = state.displayLeads;
        final isInitialLoading = loading && state.leads.isEmpty;

        return BaseScaffold(
          appBar: AppBarCommon(
            onBackTap: () => context.pop(),
            centerTitle: false,
            title: _isSearchOpen
                ? _buildSearchField()
                : Text('Lead Marketing', style: AppStyles.headingTitle2),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                tooltip: 'Chọn khoảng thời gian',
                onPressed: () => _showDateRangePicker(state),
              ),
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
                total: leads.length,
                dateStart: state.dateStart,
                dateEnd: state.dateEnd,
                isSearching: state.keyword.isNotEmpty,
              ),
              Expanded(
                child: _buildContent(
                  context,
                  state,
                  loading,
                  failed,
                  leads,
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
          bloc.add(LeadMarketingEvent.changeKeyword(keyword: value)),
      onSubmitted: (value) =>
          bloc.add(LeadMarketingEvent.changeKeyword(keyword: value.trim())),
      style: const TextStyle(fontSize: 14, color: AppColors.heading),
      decoration: InputDecoration(
        hintText: 'Tìm mã lead, công ty, người liên hệ',
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

  /// Nội dung danh sách: lỗi / trống / danh sách phiếu lead.
  Widget _buildContent(
    BuildContext context,
    LeadMarketingState state,
    bool loading,
    bool failed,
    List<LeadMarketingItem> leads,
    bool isInitialLoading,
  ) {
    if (failed && state.leads.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            Text(state.message ?? 'Load dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => bloc.add(const LeadMarketingEvent.refresh()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (leads.isEmpty && !isInitialLoading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 10),
            Text(
              state.keyword.isNotEmpty
                  ? 'Không tìm thấy phiếu lead phù hợp'
                  : 'Không có dữ liệu lead',
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const LeadMarketingEvent.refresh());
        await bloc.stream.firstWhere((s) => s.status != BaseStateStatus.loading);
      },
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: leads.length,
        itemBuilder: (context, index) {
          final item = leads[index];
          return LeadMarketingCard(
            item: item,
            onTap: () => LeadMarketingDetailSheet.show(context, item),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(height: 8),
      ),
    );
  }
}

/// Header hiển thị tổng số phiếu lead và khoảng thời gian đang lọc.
class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.isSearching,
  });

  final int total;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy');
    final hasRange = dateStart != null && dateEnd != null;
    final rangeText = hasRange
        ? '${df.format(dateStart!)} - ${df.format(dateEnd!)}'
        : null;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$total',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'phiếu lead',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  isSearching ? 'Đang tìm kiếm' : 'Tổng số phiếu',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          if (rangeText != null) ...[
            const SizedBox(width: 8),
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
                    Icons.event_outlined,
                    size: 14,
                    color: AppColors.primaryERP,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      rangeText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryERP,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
