import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../base/bloc/index.dart';
import '../../../../../../../common/app_theme/app_bar_common.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../di/injection.dart';
import '../../data/datasource/models/newsfeed_model.dart';
import '../bloc/newsfeed_bloc.dart';
import '../widgets/newsfeed_calendar_widgets.dart';
import '../widgets/newsfeed_month_picker.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewsfeedBloc>()..add(const NewsfeedEvent.init()),
      child: const _NewsFeedView(),
    );
  }
}

class _NewsFeedView extends StatefulWidget {
  const _NewsFeedView();

  @override
  State<_NewsFeedView> createState() => _NewsFeedViewState();
}

class _NewsFeedViewState extends State<_NewsFeedView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _currentTabIndex = 0;

  static const _tabTitles = ['Bảng tin', 'Lịch làm việc'];
  static const _tabIcons = [Icons.campaign, Icons.calendar_month];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_handleTabChanged);
  }

  void _handleTabChanged() {
    if (_tabController.indexIsChanging) return;
    if (_currentTabIndex == _tabController.index) return;
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_handleTabChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBarCommon(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                gradient: AppColors.gradientERP,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1FEE4623),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(_tabIcons[_currentTabIndex], color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Text(
              _tabTitles[_currentTabIndex],
              style: const TextStyle(
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
                border: Border.all(color: const Color(0xFFD9DEEA)),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: AppColors.primaryERP,
                unselectedLabelColor: AppColors.gray,
                splashBorderRadius: const BorderRadius.all(Radius.circular(14)),
                indicator: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.primaryERP, width: 1.2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1FEE4623),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                tabs: const [
                  Tab(text: 'Bảng tin'),
                  Tab(text: 'Lịch làm việc'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _NewsfeedTab(),
          _WorkingCalendarTab(),
        ],
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
            onRetry: () => context.read<NewsfeedBloc>().add(const NewsfeedEvent.refresh()),
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
            separatorBuilder: (_, index) =>
                index == 0 ? const SizedBox(height: 10) : const SizedBox(height: 12),
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

class _WorkingCalendarTab extends StatelessWidget {
  const _WorkingCalendarTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsfeedBloc, NewsfeedState>(
      builder: (context, state) {
        final monthDate = DateTime(state.selectedYear, state.selectedMonth);
        final holidaysByDay = {
          for (final holiday in state.holidays)
            if (holiday.holidayDate != null) holiday.holidayDate!.day: holiday,
        };

        return RefreshIndicator(
          color: AppColors.primaryERP,
          onRefresh: () async {
            context.read<NewsfeedBloc>().add(const NewsfeedEvent.refreshCalendar());
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              CalendarToolbar(
                selectedMonth: state.selectedMonth,
                selectedYear: state.selectedYear,
                onPreviousMonth: () {
                  final previous = DateTime(state.selectedYear, state.selectedMonth - 1);
                  context.read<NewsfeedBloc>().add(
                        NewsfeedEvent.changeCalendarMonth(
                          month: previous.month,
                          year: previous.year,
                        ),
                      );
                },
                onNextMonth: () {
                  final next = DateTime(state.selectedYear, state.selectedMonth + 1);
                  context.read<NewsfeedBloc>().add(
                        NewsfeedEvent.changeCalendarMonth(
                          month: next.month,
                          year: next.year,
                        ),
                      );
                },
                onPickMonthYear: () => _showMonthYearPicker(context, state),
              ),
              const SizedBox(height: 14),
              if (state.calendarStatus == BaseStateStatus.failed && state.holidays.isEmpty)
              _NewsfeedError(
                message: state.calendarMessage ?? 'Không tải được lịch làm việc',
                onRetry: () =>
                    context.read<NewsfeedBloc>().add(const NewsfeedEvent.refreshCalendar()),
              )
            else ...[
              HolidayLegend(count: state.holidays.length),
              const SizedBox(height: 12),
              CalendarMonthCard(
                monthDate: monthDate,
                holidaysByDay: holidaysByDay,
                isLoading: state.calendarStatus == BaseStateStatus.loading,
              ),
            ],
            ],
          ),
        );
      },
    );
  }

  Future<void> _showMonthYearPicker(BuildContext context, NewsfeedState state) async {
    await NewsfeedMonthPicker.show(
      context,
      selectedMonth: DateTime(state.selectedYear, state.selectedMonth),
      onApply: (month) {
        if (!context.mounted) return;
        context.read<NewsfeedBloc>().add(
              NewsfeedEvent.changeCalendarMonth(
                month: month.month,
                year: month.year,
              ),
            );
      },
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
