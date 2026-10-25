// Màn hình Tổng hợp phiếu cá nhân.
// Có 8 phần dữ liệu (Đăng ký nghỉ, Đi muộn về sớm, Làm thêm, Công tác,
// Làm việc ở nhà, Quên chấm công, Làm đêm, Vân tay) được chọn qua menu +
// tìm kiếm + lọc trạng thái + lọc ngày.
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
import '../widgets/personal_summary_employee_drawer.dart';
import '../widgets/personal_summary_filter_sheet.dart';
import '../widgets/personal_summary_list_header.dart';
import '../widgets/personal_summary_section_grid.dart';

class PersonalSummaryScreen extends StatefulWidget {
  const PersonalSummaryScreen({super.key});

  @override
  State<PersonalSummaryScreen> createState() => _PersonalSummaryScreenState();
}

class _PersonalSummaryScreenState
    extends BaseState<PersonalSummaryScreen, PersonalSummaryEvent,
        PersonalSummaryState, PersonalSummaryBloc> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  bool _isSearchOpen = false;

  /// Index của phần đang được chọn trong lưới.
  int _selectedSection = 0;

  /// true = đang ở state menu (lưới icon).
  /// false = đang ở state chi tiết (listHeader + danh sách phiếu của phần đã chọn).
  bool _isMenuView = true;

  // Danh sách các phần: label + icon + màu + nguồn dữ liệu tương ứng.
  static const _sections = <PersonalSummarySection>[
    PersonalSummarySection(
      label: 'Đăng ký nghỉ',
      icon: Icons.beach_access_outlined,
      color: AppColors.blueMain,
      source: PersonalSummarySource.onLeave,
    ),
    PersonalSummarySection(
      label: 'Đi muộn về sớm',
      icon: Icons.schedule_outlined,
      color: AppColors.orangeA500,
      source: PersonalSummarySource.earlyLate,
    ),
    PersonalSummarySection(
      label: 'Làm thêm',
      icon: Icons.more_time_outlined,
      color: AppColors.tealA400,
      source: PersonalSummarySource.overTime,
    ),
    PersonalSummarySection(
      label: 'Công tác',
      icon: Icons.luggage_outlined,
      color: AppColors.purpleA500,
      source: PersonalSummarySource.bussiness,
    ),
    PersonalSummarySection(
      label: 'Làm việc ở nhà',
      icon: Icons.home_work_outlined,
      color: AppColors.greenA500,
      source: PersonalSummarySource.wfh,
    ),
    PersonalSummarySection(
      label: 'Quên chấm công',
      icon: Icons.event_busy_outlined,
      color: AppColors.redA500,
      source: PersonalSummarySource.enf,
    ),
    PersonalSummarySection(
      label: 'Làm đêm',
      icon: Icons.nightlight_outlined,
      color: AppColors.blueA400,
      source: PersonalSummarySource.nightShift,
    ),
    PersonalSummarySection(
      label: 'Vân tay',
      icon: Icons.fingerprint_outlined,
      color: AppColors.primaryERP,
      source: PersonalSummarySource.attendance,
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const PersonalSummaryEvent.init());
    });
  }

  @override
  void dispose() {
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
    // Mặc định picker: hôm qua → hôm nay (đồng bộ với default của bloc).
    final defaultStart = now.subtract(const Duration(days: 1));
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
        departments: state.departments,
        currentDepartmentId: state.departmentId,
        currentStatus: state.statusFilter,
        onApply: (departmentId, status) {
          bloc.add(
            PersonalSummaryEvent.changeFilters(
              departmentId: departmentId,
              status: status,
            ),
          );
        },
        onClear: () {
          bloc.add(
            const PersonalSummaryEvent.changeFilters(
              departmentId: null,
              status: -1,
            ),
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
        final isAttendance = _isAttendanceSection();
        return PopScope(
          // Đang ở state chi tiết thì nút back hệ thống quay lại state menu.
          canPop: _isMenuView,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            _backToMenu();
          },
          child: BaseScaffold(
            endDrawer: isAttendance
                ? PersonalSummaryEmployeeDrawer(
                    employees: state.employees,
                    selectedEmployeeId: state.selectedEmployeeId,
                    isLoading: state.employeesLoading,
                    onSelect: (id) {
                      bloc.add(
                        PersonalSummaryEvent.selectEmployee(employeeId: id),
                      );
                    },
                  )
                : null,
            appBar: AppBarCommon(
              onBackTap: () => context.pop(),
              centerTitle: false,
              title: Text(
                'Tổng hợp cá nhân',
                style: AppStyles.headingTitle2,
              ),
              actions: [
                if (isAttendance && !_isMenuView)
                  Builder(
                    builder: (innerCtx) => IconButton(
                      icon: Badge(
                        isLabelVisible: state.selectedEmployeeId != null,
                        child: const Icon(Icons.person_search_outlined),
                      ),
                      tooltip: 'Chọn nhân sự',
                      onPressed: () => _openEmployeeDrawer(innerCtx, state),
                    ),
                  ),
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
            body: _isMenuView
                ? _buildMenuView(context, state)
                : _buildDetailView(context, state),
          ),
        );
      },
    );
  }

  /// State menu: chỉ hiển thị lưới icon chọn phần.
  Widget _buildMenuView(
    BuildContext context,
    PersonalSummaryState state,
  ) {
    return Column(
      children: [
        if (_isSearchOpen) _buildSearchBar(),
        _buildSectionGrid(state),
      ],
    );
  }

  /// State chi tiết: listHeader + danh sách phiếu của phần đang chọn.
  Widget _buildDetailView(
    BuildContext context,
    PersonalSummaryState state,
  ) {
    return Column(
      children: [
        if (_isSearchOpen) _buildSearchBar(),
        Expanded(
          child: _buildSectionContent(context, state),
        ),
      ],
    );
  }

  /// Phần "Vân tay" là mục cuối cùng trong menu.
  bool _isAttendanceSection() {
    return _sections[_selectedSection].source ==
        PersonalSummarySource.attendance;
  }

  /// Quay lại state menu (lưới icon) từ state chi tiết.
  void _backToMenu() {
    setState(() {
      _isMenuView = true;
      _isSearchOpen = false;
      _searchFocusNode.unfocus();
      if (_searchController.text.isNotEmpty) {
        _searchController.clear();
        bloc.add(const PersonalSummaryEvent.changeKeyword(keyword: ''));
      }
    });
  }

  /// Mở drawer chọn nhân sự. Nếu chưa có cache cho phòng ban hiện tại
  /// thì đợi bloc load xong mới mở, đảm bảo drawer có dữ liệu ngay
  /// lần hiển thị đầu tiên.
  Future<void> _openEmployeeDrawer(
    BuildContext context,
    PersonalSummaryState state,
  ) async {
    final currentDept = state.departmentId;
    final alreadyCached = state.employeesLoadedForDept != null &&
        state.employeesLoadedForDept == currentDept &&
        state.employees.isNotEmpty;

    if (!alreadyCached) {
      bloc.add(const PersonalSummaryEvent.loadEmployees());
      // Đợi bloc load xong (employeesLoading chuyển từ true → false).
      // Lưu ý: lúc này bloc đã emit employeesLoading=true, nên stream
      // sẽ emit ít nhất 1 lần nữa với giá trị false.
      await bloc.stream.firstWhere(
        (s) => !s.employeesLoading,
      );
    }

    if (!context.mounted) return;
    Scaffold.of(context).openEndDrawer();
  }

  // ── Section grid ─────────────────────────────────────────────────────────

  Widget _buildSectionGrid(PersonalSummaryState state) {
    return PersonalSummarySectionGrid(
      sections: _sections,
      selectedIndex: _selectedSection,
      countOf: (source) => _count(state, source),
      onSelected: (index) {
        setState(() {
          _selectedSection = index;
          _isMenuView = false;
        });
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

  // ── Section content ──────────────────────────────────────────────────────

  Widget _buildSectionContent(
    BuildContext context,
    PersonalSummaryState state,
  ) {
    final source = _sections[_selectedSection].source;
    final section = _sections[_selectedSection];
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
                  _count(p, source) != _count(c, source),
              builder: (_, s) {
                final filtered = filterByKeyword(
                  _items(s, source),
                  s.keyword,
                );
                return PersonalSummaryListHeader(
                  total: filtered.length,
                  dateStart: s.dateStart,
                  dateEnd: s.dateEnd,
                  isSearching: s.keyword.isNotEmpty,
                  sectionLabel: section.label,
                  sectionIcon: section.icon,
                  sectionColor: section.color,
                  onClose: _backToMenu,
                );
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            sliver: _buildSliverList(context, state, source),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverList(
    BuildContext context,
    PersonalSummaryState state,
    PersonalSummarySource source,
  ) {
    final loading = state.status == BaseStateStatus.loading;
    final failed = state.status == BaseStateStatus.failed;
    final rawItems = _items(state, source);
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
      itemBuilder: (_, i) => _buildItemFor(source, items[i]),
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

/// Đếm tổng số phiếu của 1 phần trong state hiện tại.
int _count(PersonalSummaryState s, PersonalSummarySource source) {
  switch (source) {
    case PersonalSummarySource.onLeave:
      return s.onLeave.length;
    case PersonalSummarySource.earlyLate:
      return s.earlyLate.length;
    case PersonalSummarySource.overTime:
      return s.overTime.length;
    case PersonalSummarySource.bussiness:
      return s.bussiness.length;
    case PersonalSummarySource.wfh:
      return s.wfh.length;
    case PersonalSummarySource.enf:
      return s.enf.length;
    case PersonalSummarySource.nightShift:
      return s.nightShift.length;
    case PersonalSummarySource.attendance:
      return s.attendance.length;
  }
}

/// Trả về danh sách thuộc phần tương ứng (dưới dạng `List<dynamic>` để xử lý chung).
List<dynamic> _items(PersonalSummaryState s, PersonalSummarySource source) {
  switch (source) {
    case PersonalSummarySource.onLeave:
      return s.onLeave;
    case PersonalSummarySource.earlyLate:
      return s.earlyLate;
    case PersonalSummarySource.overTime:
      return s.overTime;
    case PersonalSummarySource.bussiness:
      return s.bussiness;
    case PersonalSummarySource.wfh:
      return s.wfh;
    case PersonalSummarySource.enf:
      return s.enf;
    case PersonalSummarySource.nightShift:
      return s.nightShift;
    case PersonalSummarySource.attendance:
      return s.attendance;
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
  } else if (item is PersonalAttendanceItem) {
    add(item.fullName);
    add(item.code);
    add(item.departmentName);
    add(item.chucVu);
    add(item.toChuc);
    add(item.dayWeek);
    add(item.interval);
    add(item.checkIn);
    add(item.checkOut);
  }
  return buf.toString();
}

/// Render widget card tương ứng với từng loại item.
Widget _buildItemFor(PersonalSummarySource source, dynamic item) {
  switch (source) {
    case PersonalSummarySource.onLeave:
      return PersonalLeaveCard(item: item as PersonalLeaveItem);
    case PersonalSummarySource.earlyLate:
      return PersonalEarlyLateCard(item: item as PersonalEarlyLateItem);
    case PersonalSummarySource.overTime:
      return PersonalOverTimeCard(item: item as PersonalOverTimeItem);
    case PersonalSummarySource.bussiness:
      return PersonalBussinessCard(item: item as PersonalBussinessItem);
    case PersonalSummarySource.wfh:
      return PersonalWfhCard(item: item as PersonalWfhItem);
    case PersonalSummarySource.enf:
      return PersonalEnfCard(item: item as PersonalEnfItem);
    case PersonalSummarySource.nightShift:
      return PersonalNightShiftCard(item: item as PersonalNightShiftItem);
    case PersonalSummarySource.attendance:
      return PersonalAttendanceCard(item: item as PersonalAttendanceItem);
  }
}
