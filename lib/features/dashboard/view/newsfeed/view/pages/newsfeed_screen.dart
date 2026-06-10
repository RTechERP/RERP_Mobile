import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/bloc/index.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/newsfeed_model.dart';
import '../bloc/newsfeed_bloc.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _NewsFeedView();
  }
}

class _NewsFeedView extends StatelessWidget {
  const _NewsFeedView();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F2F5),
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 16,
          title: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  gradient: AppColors.gradientERP,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.campaign, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 10),
              const Text(
                'Bảng tin',
                style: TextStyle(
                  color: AppColors.heading,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(58),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFD9DEEA),
                  ),
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.primaryERP,
                  unselectedLabelColor: AppColors.gray,
                  splashBorderRadius: BorderRadius.all(Radius.circular(14)),
                  indicator: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: AppColors.primaryERP,
                        width: 1.2,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1FEE4623),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  tabs: [
                    Tab(text: 'Bảng tin'),
                    Tab(text: 'Lịch làm việc'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            _NewsfeedTab(),
            _WorkingCalendarPlaceholder(),
          ],
        ),
      ),
    );
  }
}

class _NewsfeedTab extends StatelessWidget {
  const _NewsfeedTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsfeedBloc, NewsfeedState>(
      builder: (context, state) {
        if (state.status == BaseStateStatus.loading && state.newsfeeds.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed && state.newsfeeds.isEmpty) {
          return _NewsfeedError(
            message: state.message ?? 'Không tải được bảng tin',
            onRetry: () =>
                context.read<NewsfeedBloc>().add(const NewsfeedEvent.refresh()),
          );
        }

        if (state.newsfeeds.isEmpty) {
          return const _NewsfeedEmpty();
        }

        return RefreshIndicator(
          color: AppColors.primaryERP,
          onRefresh: () async {
            context.read<NewsfeedBloc>().add(const NewsfeedEvent.refresh());
          },
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: state.newsfeeds.length + 1,
            separatorBuilder: (_, index) => index == 0
                ? const SizedBox(height: 10)
                : const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index == 0) {
                return const _SectionHeader();
              }

              final item = state.newsfeeds[index - 1];
              return _FeedCard(item: item);
            },
          ),
        );
      },
    );
  }
}

class _WorkingCalendarPlaceholder extends StatelessWidget {
  const _WorkingCalendarPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE8EAF0)),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_month_outlined,
                  color: AppColors.primaryERP, size: 36),
              SizedBox(height: 12),
              Text(
                'Lịch làm việc sẽ được bổ sung sau',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Tab đã sẵn sàng để nối dữ liệu ở bước tiếp theo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsfeedError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _NewsfeedError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 38, color: AppColors.alert),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.heading),
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsfeedEmpty extends StatelessWidget {
  const _NewsfeedEmpty();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.feed_outlined, size: 38, color: AppColors.gray),
            SizedBox(height: 10),
            Text(
              'Chưa có bản tin nào',
              style: TextStyle(
                color: AppColors.heading,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tin mới nhất',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
          ),
        ),
      ],
    );
  }
}

class _FeedCard extends StatelessWidget {
  final NewsletterItem item;

  const _FeedCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final label = item.newsletterTypeName?.trim().isNotEmpty == true
        ? item.newsletterTypeName!.trim()
        : 'Bản tin';
    final (icon, accentColor) = _resolveNewsTypeAppearance(label);
    final dateText = item.createdDate == null
        ? '--/--/----'
        : DateFormat('dd/MM/yyyy').format(item.createdDate!);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.82),
                Colors.white.withValues(alpha: 0.58),
              ],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.55),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha: 0.10),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.35),
                blurRadius: 10,
                offset: const Offset(-2, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FeedCardHeader(
                icon: icon,
                accentColor: accentColor,
                label: label,
                date: dateText,
              ),
              _FeedCardContent(
                title: item.title?.trim().isNotEmpty == true
                    ? item.title!.trim()
                    : 'Không có tiêu đề',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedCardHeader extends StatelessWidget {
  final IconData icon;
  final Color accentColor;
  final String label;
  final String date;

  const _FeedCardHeader({
    required this.icon,
    required this.accentColor,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withValues(alpha: 0.14),
            Colors.white.withValues(alpha: 0.08),
          ],
        ),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.35),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  accentColor.withValues(alpha: 0.95),
                  accentColor.withValues(alpha: 0.72),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.28),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(icon, size: 18, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: accentColor,
                letterSpacing: 0.35,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.42),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white.withValues(alpha: 0.45)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.schedule, size: 12, color: AppColors.gray),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w600,
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

class _FeedCardContent extends StatelessWidget {
  final String title;

  const _FeedCardContent({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: Text(
        title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.45,
          color: AppColors.heading,
        ),
      ),
    );
  }
}

(IconData, Color) _resolveNewsTypeAppearance(String label) {
  final normalized = label.toLowerCase();

  if (normalized.contains('hr') ||
      normalized.contains('nhân sự') ||
      normalized.contains('tuyển dụng')) {
    return (Icons.badge_outlined, const Color(0xFF4F46E5));
  }
  if (normalized.contains('đào tạo') || normalized.contains('hướng dẫn')) {
    return (Icons.auto_stories_outlined, const Color(0xFF0F9D8F));
  }
  if (normalized.contains('sự kiện') || normalized.contains('event')) {
    return (Icons.celebration_outlined, const Color(0xFFF59E0B));
  }
  if (normalized.contains('chính sách') || normalized.contains('quy định')) {
    return (Icons.gavel_outlined, const Color(0xFFEF4444));
  }
  if (normalized.contains('khen thưởng') || normalized.contains('vinh danh')) {
    return (Icons.workspace_premium_outlined, const Color(0xFF8B5CF6));
  }

  return (Icons.campaign_outlined, AppColors.primaryERP);
}
