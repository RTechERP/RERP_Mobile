import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/poll_model.dart';
import '../bloc/poll_bloc.dart';
import '../widgets/poll_card.dart';

class PollScreen extends StatefulWidget {
  const PollScreen({super.key});

  @override
  State<PollScreen> createState() => _PollScreenState();
}

class _PollScreenState
    extends BaseState<PollScreen, PollEvent, PollState, PollBloc> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    bloc.add(const PollEvent.init());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBarCommon(
        title: _isSearchActive ? _buildSearchField() : const Text('Bình chọn'),
        onBackTap: () => _isSearchActive ? _clearSearch() : onBack(context),
        actions: _isSearchActive
            ? [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    tooltip: 'Xoá tìm kiếm',
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
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
      body: BlocBuilder<PollBloc, PollState>(
        buildWhen: (prev, curr) =>
            prev.status != curr.status ||
            prev.polls.length != curr.polls.length ||
            prev.message != curr.message,
        builder: (context, state) {
          if (state.status == BaseStateStatus.loading && state.polls.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == BaseStateStatus.failed) {
            return _PollStateView(
              imagePath: AppImages.error,
              title: state.message?.isNotEmpty == true
                  ? state.message!
                  : 'Load dữ liệu thất bại',
              actionLabel: 'Thử lại',
              onTap: () => bloc.add(const PollEvent.refresh()),
            );
          }

          final visiblePolls = _filterPolls(state.polls);

          if (state.polls.isEmpty) {
            return _PollStateView(
              imagePath: AppImages.missing,
              title: 'Chưa có chủ đề bình chọn',
              actionLabel: 'Tải lại',
              onTap: () => bloc.add(const PollEvent.refresh()),
            );
          }

          if (visiblePolls.isEmpty) {
            return _PollStateView(
              imagePath: AppImages.missing,
              title: 'Không tìm thấy chủ đề phù hợp',
              actionLabel: 'Xoá từ khoá',
              onTap: _clearSearch,
            );
          }

          final openCount = visiblePolls.where(_isOpenPoll).length;

          return RefreshIndicator(
            color: AppColors.primaryERP,
            onRefresh: () async {
              bloc.add(const PollEvent.refresh());
              await bloc.stream.firstWhere(
                (s) => s.status != BaseStateStatus.loading,
              );
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              children: [
                // _PollOverviewHeader(
                //   totalCount: visiblePolls.length,
                //   openCount: openCount,
                // ),
                // const SizedBox(height: 16),
                ...visiblePolls.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: PollCard(
                      item: item,
                      onTap: () => context.push(
                        RouteNames.pollDetail,
                        extra: item,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isOpenPoll(PollItem item) {
    final now = DateTime.now();
    final start = item.startDate;
    final end = item.endDate;
    if (start != null && now.isBefore(start)) return false;
    if (end != null && now.isAfter(end)) return false;
    return true;
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      style: const TextStyle(fontSize: 16, color: AppColors.heading),
      decoration: const InputDecoration(
        hintText: 'Tìm theo tiêu đề...',
        hintStyle: TextStyle(fontSize: 16, color: AppColors.hintText),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      onChanged: (value) => setState(() => _searchQuery = value.trim()),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) => setState(() => _searchQuery = value.trim()),
    );
  }

  List<PollItem> _filterPolls(List<PollItem> polls) {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) return polls;

    return polls.where((item) {
      final title = item.title?.trim().toLowerCase() ?? '';
      return title.contains(query);
    }).toList();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _isSearchActive = false;
      _searchQuery = '';
    });
  }
}

class _PollOverviewHeader extends StatelessWidget {
  const _PollOverviewHeader({
    required this.totalCount,
    required this.openCount,
  });

  final int totalCount;
  final int openCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7DD3FC),
            Color(0xFF60A5FA),
            Color(0xFFA78BFA),
          ],
        ),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.42),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF60A5FA).withValues(alpha: 0.22),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.32),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.insights_rounded,
                  size: 15,
                  color: AppColors.white,
                ),
                SizedBox(width: 6),
                Text(
                  'Tổng quan bình chọn',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Theo dõi nhanh số lượng bình chọn đang hoạt động để ưu tiên tham gia ngay.',
            style: TextStyle(
              fontSize: 12,
              height: 1.45,
              color: AppColors.white.withValues(alpha: 0.88),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _PollMetricCard(
                  label: 'Tổng chủ đề',
                  value: '$totalCount',
                  icon: Icons.layers_rounded,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _PollMetricCard(
                  label: 'Đang mở',
                  value: '$openCount',
                  icon: Icons.radio_button_checked_rounded,
                  isHighlighted: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PollMetricCard extends StatelessWidget {
  const _PollMetricCard({
    required this.label,
    required this.value,
    required this.icon,
    this.isHighlighted = false,
  });

  final String label;
  final String value;
  final IconData icon;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: isHighlighted ? 0.3 : 0.2),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.white.withValues(alpha: isHighlighted ? 0.48 : 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withValues(alpha: isHighlighted ? 0.14 : 0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: isHighlighted ? 0.34 : 0.24),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white.withValues(alpha: 0.9),
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

class _PollStateView extends StatelessWidget {
  const _PollStateView({
    required this.imagePath,
    required this.title,
    required this.actionLabel,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, width: 260),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textMain,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(actionLabel),
            ),
          ],
        ),
      ),
    );
  }
}
