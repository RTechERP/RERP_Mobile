// Màn hình Tổng hợp phiếu cá nhân.
// Có 7 tab (Đăng ký nghỉ, Đi muộn về sớm, Làm thêm, Công tác,
// Làm việc ở nhà, Quên chấm công, Làm đêm) + tìm kiếm + lọc trạng thái + lọc ngày.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../data/datasource/models/personal_summary_model.dart';
import '../bloc/personal_summary_bloc.dart';
import '../widgets/personal_summary_cards.dart';
import '../widgets/personal_summary_filter_sheet.dart';
import '../widgets/personal_summary_list_header.dart';

class PersonalSummaryScreen extends StatefulWidget {
  const PersonalSummaryScreen({super.key});

  @override
  State<PersonalSummaryScreen> createState() => _PersonalSummaryScreenState();
}

class _PersonalSummaryScreenState
    extends BaseState<PersonalSummaryScreen, PersonalSummaryEvent,
        PersonalSummaryState, PersonalSummaryBloc>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  bool _isSearchOpen = false;

  // Danh sách các tab, định nghĩa label + nguồn dữ liệu tương ứng trong state.
  static const _tabDefs = <_TabDef>[
    _TabDef('Đăng ký nghỉ', _TabSource.onLeave),
    _TabDef('Đi muộn về sớm', _TabSource.earlyLate),
    _TabDef('Làm thêm', _TabSource.overTime),
    _TabDef('Công tác', _TabSource.bussiness),
    _TabDef('Làm việc ở nhà', _TabSource.wfh),
    _TabDef('Quên chấm công', _TabSource.enf),
    _TabDef('Làm đêm', _TabSource.nightShift),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabDefs.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const PersonalSummaryEvent.init());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  // ── Search ────────────────────────────────────────────────────────────────

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
          bloc.add(const PersonalSummaryEvent.changeKeyword(keyword: ''));
        }
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    bloc.add(const PersonalSummaryEvent.changeKeyword(keyword: ''));
  }

  void _onSearchChanged(String value) {
    bloc.add(PersonalSummaryEvent.changeKeyword(keyword: value));
  }

  // ── Date range ────────────────────────────────────────────────────────────

  void _showDateRangePicker(BuildContext context, PersonalSummaryState state) {
    final now = DateTime.now();
    final defaultStart = now.subtract(const Duration(days: 6));
    final defaultEnd = DateTime(now.year, now.month, now.day);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? defaultStart,
        initialEnd: state.dateEnd ?? defaultEnd,
        onApply: (start, end) {
          bloc.add(
            PersonalSummaryEvent.changeDateRange(
              dateStart: start,
              dateEnd: end,
            ),
          );
        },
      ),
    );
  }

  // ── Status filter sheet ──────────────────────────────────────────────────

  void _showFilterSheet(BuildContext context, PersonalSummaryState state) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => PersonalSummaryFilterSheet(
        currentStatus: state.statusFilter,
        onApply: (status) {
          bloc.add(
            PersonalSummaryEvent.changeStatusFilter(status: status),
          );
        },
        onClear: () {
          bloc.add(
            const PersonalSummaryEvent.changeStatusFilter(status: -1),
          );
        },
      ),
    );
  }

  // ── Render ───────────────────────────────────────────────────────────────

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<PersonalSummaryBloc, PersonalSummaryState>(
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            onBackTap: () => context.pop(),
            centerTitle: false,
            title: Text(
              'Tổng hợp phiếu cá nhân',
              style: AppStyles.headingTitle2,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: _buildTabBar(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                tooltip: 'Lọc theo ngày',
                onPressed: () => _showDateRangePicker(context, state),
              ),
              IconButton(
                icon: Badge(
                  isLabelVisible: state.statusFilter != -1,
                  child: const Icon(Icons.filter_list),
                ),
                tooltip: 'Bộ lọc',
                onPressed: () => _showFilterSheet(context, state),
              ),
              IconButton(
                icon: Icon(_isSearchOpen ? Icons.close : Icons.search),
                tooltip: 'Tìm kiếm',
                onPressed: _toggleSearch,
              ),
            ],
          ),
          body: Column(
            children: [
              if (_isSearchOpen) _buildSearchBar(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    for (final def in _tabDefs)
                      _buildTabContent(context, state, def),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Tab Bar ───────────────────────────────────────────────────────────────

  Widget _buildTabBar() {
    return BlocBuilder<PersonalSummaryBloc, PersonalSummaryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.gray.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryERP,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryERP.withValues(alpha: 0.35),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.gray,
              labelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                for (final def in _tabDefs) ...[
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(def.label),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blueA400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${_count(state, def.source)}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  // ── Search Bar ───────────────────────────────────────────────────────────

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: SizedBox(
        height: 44,
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          textInputAction: TextInputAction.search,
          onChanged: _onSearchChanged,
          style: const TextStyle(fontSize: 14, color: AppColors.heading),
          decoration: InputDecoration(
            hintText: 'Tìm theo tên, lý do, dự án...',
            hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: AppColors.gray, size: 20),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 36, minHeight: 36),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _searchController,
              builder: (context, value, _) {
                if (value.text.isEmpty) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(Icons.clear, color: AppColors.gray, size: 18),
                  onPressed: _clearSearch,
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minWidth: 36, minHeight: 36),
                );
              },
            ),
            isDense: true,
            filled: true,
            fillColor: AppColors.background,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
              borderSide:
                  const BorderSide(color: AppColors.primaryERP, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }

  // ── Tab content ──────────────────────────────────────────────────────────

  Widget _buildTabContent(
    BuildContext context,
    PersonalSummaryState state,
    _TabDef def,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const PersonalSummaryEvent.refresh());
        await bloc.stream.firstWhere(
          (s) => s.status != BaseStateStatus.loading,
        );
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<PersonalSummaryBloc, PersonalSummaryState>(
              buildWhen: (p, c) =>
                  p.dateStart != c.dateStart ||
                  p.dateEnd != c.dateEnd ||
                  p.keyword != c.keyword ||
                  _count(p, def.source) != _count(c, def.source),
              builder: (_, s) {
                final filtered = filterByKeyword(
                  _items(s, def.source),
                  s.keyword,
                );
                return PersonalSummaryListHeader(
                  total: filtered.length,
                  dateStart: s.dateStart,
                  dateEnd: s.dateEnd,
                  isSearching: s.keyword.isNotEmpty,
                );
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            sliver: _buildSliverList(context, state, def),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverList(
    BuildContext context,
    PersonalSummaryState state,
    _TabDef def,
  ) {
    final loading = state.status == BaseStateStatus.loading;
    final failed = state.status == BaseStateStatus.failed;
    final rawItems = _items(state, def.source);
    final items = filterByKeyword(rawItems, state.keyword);
    final isInitialLoading = loading && rawItems.isEmpty;

    if (failed && rawItems.isEmpty) {
      return _buildFailedSliver(state);
    }
    if (items.isEmpty && !isInitialLoading) {
      return _buildEmptySliver();
    }
    if (items.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return SliverList.separated(
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (_, i) => _buildItemFor(def.source, items[i]),
    );
  }

  Widget _buildFailedSliver(PersonalSummaryState state) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 280),
            const SizedBox(height: 10),
            Text(state.message ?? 'Load dữ liệu thất bại'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () =>
                  bloc.add(const PersonalSummaryEvent.refresh()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptySliver() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 280),
            const SizedBox(height: 10),
            const Text('Không có dữ liệu'),
          ],
        ),
      ),
    );
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────

enum _TabSource { onLeave, earlyLate, overTime, bussiness, wfh, enf, nightShift }

class _TabDef {
  const _TabDef(this.label, this.source);
  final String label;
  final _TabSource source;
}

/// Đếm tổng số phiếu của 1 tab trong state hiện tại.
int _count(PersonalSummaryState s, _TabSource source) {
  switch (source) {
    case _TabSource.onLeave:
      return s.onLeave.length;
    case _TabSource.earlyLate:
      return s.earlyLate.length;
    case _TabSource.overTime:
      return s.overTime.length;
    case _TabSource.bussiness:
      return s.bussiness.length;
    case _TabSource.wfh:
      return s.wfh.length;
    case _TabSource.enf:
      return s.enf.length;
    case _TabSource.nightShift:
      return s.nightShift.length;
  }
}

/// Trả về danh sách thuộc tab tương ứng (dưới dạng `List<dynamic>` để xử lý chung).
List<dynamic> _items(PersonalSummaryState s, _TabSource source) {
  switch (source) {
    case _TabSource.onLeave:
      return s.onLeave;
    case _TabSource.earlyLate:
      return s.earlyLate;
    case _TabSource.overTime:
      return s.overTime;
    case _TabSource.bussiness:
      return s.bussiness;
    case _TabSource.wfh:
      return s.wfh;
    case _TabSource.enf:
      return s.enf;
    case _TabSource.nightShift:
      return s.nightShift;
  }
}

/// Lọc client-side theo từ khoá (toLowerCase contains).
List<T> filterByKeyword<T>(List<T> items, String keyword) {
  final k = keyword.trim().toLowerCase();
  if (k.isEmpty) return items;
  return items.where((e) {
    final hay = _haystackFor(e);
    return hay.toLowerCase().contains(k);
  }).toList();
}

/// Trích tất cả text có thể tìm kiếm từ mỗi item thành 1 chuỗi.
String _haystackFor(dynamic item) {
  final buf = StringBuffer();
  void add(dynamic v) {
    if (v == null) return;
    if (v is DateTime) {
      buf.write(v.toIso8601String());
      buf.write(' ');
    } else if (v is String) {
      buf.write(v);
      buf.write(' ');
    } else {
      buf.write(v.toString());
      buf.write(' ');
    }
  }

  if (item is PersonalLeaveItem) {
    add(item.employeeLeave);
    add(item.employeeTp);
    add(item.employeeHr);
    add(item.typeText);
    add(item.typeIsRealText);
    add(item.timeOnLeaveText);
    add(item.reason);
    add(item.note);
    add(item.reasonDeciline);
    add(item.reasonCancel);
    add(item.departmentName);
  } else if (item is PersonalEarlyLateItem) {
    add(item.employeeEarlyLate);
    add(item.employeeApprovedTp);
    add(item.employeeApprovedHr);
    add(item.typeText);
    add(item.unitText);
    add(item.reason);
    add(item.reasonDeciline);
  } else if (item is PersonalOverTimeItem) {
    add(item.employeeFullName);
    add(item.approvedTbp);
    add(item.approvedHr);
    add(item.typeName);
    add(item.locationText);
    add(item.projectName);
    add(item.reason);
    add(item.reasonDeciline);
  } else if (item is PersonalBussinessItem) {
    add(item.employeeName);
    add(item.approvedName);
    add(item.approvedHr);
    add(item.location);
    add(item.typeName);
    add(item.vehicleName);
    add(item.note);
    add(item.reason);
    add(item.reasonDeciline);
    add(item.projectText);
  } else if (item is PersonalWfhItem) {
    add(item.employeeName);
    add(item.approvedName);
    add(item.approvedHr);
    add(item.timeWfhText);
    add(item.reason);
    add(item.note);
    add(item.reasonDeciline);
    add(item.contentWork);
  } else if (item is PersonalEnfItem) {
    add(item.employeeName);
    add(item.approvedTpName);
    add(item.approvedHrName);
    add(item.typeText);
    add(item.note);
    add(item.reasonDeciline);
  } else if (item is PersonalNightShiftItem) {
    add(item.fullName);
    add(item.code);
    add(item.approvedTbpName);
    add(item.approvedHrName);
    add(item.location);
    add(item.note);
    add(item.reasonDeciline);
    add(item.departmentName);
  }
  return buf.toString();
}

/// Render widget card tương ứng với từng loại item.
Widget _buildItemFor(_TabSource source, dynamic item) {
  switch (source) {
    case _TabSource.onLeave:
      return PersonalLeaveCard(item: item as PersonalLeaveItem);
    case _TabSource.earlyLate:
      return PersonalEarlyLateCard(item: item as PersonalEarlyLateItem);
    case _TabSource.overTime:
      return PersonalOverTimeCard(item: item as PersonalOverTimeItem);
    case _TabSource.bussiness:
      return PersonalBussinessCard(item: item as PersonalBussinessItem);
    case _TabSource.wfh:
      return PersonalWfhCard(item: item as PersonalWfhItem);
    case _TabSource.enf:
      return PersonalEnfCard(item: item as PersonalEnfItem);
    case _TabSource.nightShift:
      return PersonalNightShiftCard(item: item as PersonalNightShiftItem);
  }
}
