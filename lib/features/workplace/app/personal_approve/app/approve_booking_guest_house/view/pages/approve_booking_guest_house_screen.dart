import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/approve_booking_guest_house_model.dart';
import '../bloc/approve_booking_guest_house_bloc.dart';

class ApproveBookingGuestHousePage extends StatefulWidget {
  const ApproveBookingGuestHousePage({super.key});

  @override
  State<ApproveBookingGuestHousePage> createState() =>
      _ApproveBookingGuestHousePageState();
}

/// Dùng `BaseShareState` thay cho `BaseState` vì bloc là singleton
/// được wrap ở ShellRoute (`BlocProvider.value`); `BaseState.dispose()`
/// sẽ tự `bloc.close()` → giết bloc share với route con.
class _ApproveBookingGuestHousePageState extends BaseShareState<
    ApproveBookingGuestHousePage,
    ApproveBookingGuestHouseEvent,
    ApproveBookingGuestHouseState,
    ApproveBookingGuestHouseBloc> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  /// Shorthand cho `bloc.state` — `BaseShareState` không expose getter
  /// `state` nên dùng shorthand này để truy cập gọn.
  ApproveBookingGuestHouseState get state => bloc.state;

  @override
  void initState() {
    super.initState();
    bloc.add(const ApproveBookingGuestHouseEvent.init());
    bloc.add(const ApproveBookingGuestHouseEvent.loadFilters());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void listener(BuildContext context, ApproveBookingGuestHouseState state) {
    final message = (state.message ?? '').trim();
    if (message.isNotEmpty) {
      showMessage(context, message, type: SnackBarType.error);
    }
  }

  void _onSearchChanged(String value) {
    bloc.add(
      ApproveBookingGuestHouseEvent.changeFilterText(
        filterText: value.trim(),
      ),
    );
  }

  void _openSearch() {
    setState(() => _isSearching = true);
  }

  void _closeSearch() {
    _searchController.clear();
    bloc.add(
      const ApproveBookingGuestHouseEvent.changeFilterText(filterText: ''),
    );
    setState(() => _isSearching = false);
  }

  Future<void> _openDatePicker() async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? todayStart,
        initialEnd: state.dateEnd ?? tomorrow,
        onApply: (start, end) {
          bloc.add(
            ApproveBookingGuestHouseEvent.changeDateRange(
              dateStart: start,
              dateEnd: end,
            ),
          );
        },
      ),
    );
  }

  Future<void> _openProjectFilter() async {
    if (state.projects.isEmpty) {
      bloc.add(const ApproveBookingGuestHouseEvent.loadFilters());
    }
    await openSelectBottomSheet<ApproveProjectFilterItem>(
      context: context,
      title: 'Chọn dự án',
      hintText: 'Tìm theo mã / tên dự án',
      items: state.projects,
      initialSelectedItem: state.selectedProject,
      displayText: (p) {
        if (p.projectCode != null && p.projectCode!.isNotEmpty) {
          return '${p.projectCode} - ${p.projectName ?? ''}';
        }
        return p.projectName ?? 'N/A';
      },
      onSelected: (project) {
        bloc.add(
          ApproveBookingGuestHouseEvent.changeProjectFilter(
            project: project,
          ),
        );
      },
    );
  }

  Future<void> _openEmployeeFilter() async {
    if (state.employees.isEmpty) {
      bloc.add(const ApproveBookingGuestHouseEvent.loadFilters());
    }
    await openSelectBottomSheet<ApproveEmployeeFilterItem>(
      context: context,
      title: 'Chọn người đăng ký',
      hintText: 'Tìm theo tên nhân viên',
      items: state.employees,
      initialSelectedItem: state.selectedEmployee,
      displayText: (e) => e.fullName ?? 'N/A',
      onSelected: (employee) {
        bloc.add(
          ApproveBookingGuestHouseEvent.changeEmployeeFilter(
            employee: employee,
          ),
        );
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: _onSearchChanged,
              )
            : Text(
                'Duyệt Đặt phòng nhà nghỉ',
                style: AppStyles.headingTitle2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
        onBackTap: () => context.pop(),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: const Icon(Icons.calendar_month),
              tooltip: 'Lọc ngày',
              onPressed: _openDatePicker,
            ),
          if (!_isSearching)
            blocBuilder(
              (context, state) {
                return Badge(
                  isLabelVisible: state.selectedProject != null,
                  child: IconButton(
                    icon: const Icon(Icons.account_tree_outlined, size: 22),
                    tooltip: 'Lọc theo dự án',
                    onPressed: _openProjectFilter,
                  ),
                );
              },
              buildWhen: (prev, curr) =>
                  prev.selectedProject != curr.selectedProject,
            ),
          if (!_isSearching)
            blocBuilder(
              (context, state) {
                return Badge(
                  isLabelVisible: state.selectedEmployee != null,
                  child: IconButton(
                    icon: const Icon(Icons.person_search_outlined, size: 22),
                    tooltip: 'Lọc theo người đăng ký',
                    onPressed: _openEmployeeFilter,
                  ),
                );
              },
              buildWhen: (prev, curr) =>
                  prev.selectedEmployee != curr.selectedEmployee,
            ),
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close_rounded : Icons.search_rounded,
              size: 22,
            ),
            tooltip: _isSearching ? 'Đóng tìm kiếm' : 'Tìm kiếm',
            onPressed: _isSearching ? _closeSearch : _openSearch,
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: blocBuilder(
        (context, state) {
          if (state.status == BaseStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == BaseStateStatus.failed) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.error, width: 320),
                    const SizedBox(height: 12),
                    Text(
                      (state.message ?? '').trim().isNotEmpty
                          ? state.message!.trim()
                          : 'Load dữ liệu thất bại',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: _ListHeader(
                  total: state.bookings.length,
                  dateStart: state.dateStart,
                  dateEnd: state.dateEnd,
                  isSearching: state.filterText.isNotEmpty,
                  selectedProject: state.selectedProject,
                  selectedEmployee: state.selectedEmployee,
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    bloc.add(const ApproveBookingGuestHouseEvent.refresh());
                    await bloc.stream.firstWhere(
                      (s) => s.status != BaseStateStatus.loading,
                    );
                  },
                  child: _buildList(state),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildList(ApproveBookingGuestHouseState state) {
    if (state.bookings.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 80),
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.missing, width: 320),
                const SizedBox(height: 12),
                const Text('Không có dữ liệu'),
              ],
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: state.bookings.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = state.bookings[index];
        final id = item.id;

        return Slidable(
          key: ValueKey('approve_booking_guest_house_$id'),
          groupTag: 'approve_booking_guest_house_slidable',
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.28,
            children: [
              SlidableAction(
                onPressed: (actionContext) async {
                  Slidable.of(actionContext)?.close();
                  showMessage(
                    context,
                    'Chức năng xoá phiếu không khả dụng ở màn duyệt',
                    type: SnackBarType.error,
                  );
                },
                backgroundColor: AppColors.alert,
                foregroundColor: Colors.white,
                icon: Icons.delete_outline,
                label: 'Xoá',
              ),
            ],
          ),
          child: Builder(
            builder: (slidableCtx) => ApproveBookingGuestHouseCard(
              item: item,
              onTap: () {
                Slidable.of(slidableCtx)?.close();
                showMessage(
                  context,
                  'Đã chọn phiếu #${item.id}',
                  type: SnackBarType.info,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

//---(Card)---//

/// Card hiển thị một phiếu Đặt phòng nhà nghỉ trong màn duyệt.
/// Style glassmorphism đồng bộ với `BookingGuestHouseCard`.
class ApproveBookingGuestHouseCard extends StatelessWidget {
  const ApproveBookingGuestHouseCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final ApproveBookingGuestHouseItem item;
  final VoidCallback? onTap;

  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final employee = _displayEmployee();
    final project = _displayProject();
    final dateRange = _formatDateRange();
    final (tbpBadge, tbpColor) = _tbpApprovalBadge();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryERP.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TinyBadge(text: tbpBadge, color: tbpColor),
                const SizedBox(height: 12),
                _InfoRow(
                  icon: Icons.person_outline,
                  label: 'Nhân viên',
                  value: employee,
                ),
                const SizedBox(height: 8),
                if (project.isNotEmpty) ...[
                  _InfoRow(
                    icon: Icons.folder_outlined,
                    label: 'Dự án',
                    value: project,
                  ),
                  const SizedBox(height: 8),
                ],
                if (dateRange.isNotEmpty) ...[
                  _InfoRow(
                    icon: Icons.calendar_month_outlined,
                    label: 'Thời gian',
                    value: dateRange,
                    valueColor: AppColors.primaryERP,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  //---(Display helpers)---//

  String _displayEmployee() {
    final name = (item.fullName ?? '').trim();
    if (name.isEmpty) return 'Nhân viên';
    return name;
  }

  String _displayProject() {
    final code = (item.projectCode ?? '').trim();
    final name = (item.projectName ?? '').trim();
    if (code.isEmpty && name.isEmpty) return '';
    if (code.isEmpty) return name;
    if (name.isEmpty) return code;
    return '$code - $name';
  }

  String _formatDateRange() {
    final s = item.startDate;
    final e = item.endDate;
    if (s == null && e == null) return '';
    if (s != null && e != null) {
      return '${_dateFmt.format(s)} → ${_dateFmt.format(e)}';
    }
    return _dateFmt.format(s ?? e!);
  }

  //---(Badge)---//

  (String, Color) _tbpApprovalBadge() {
    final approved = item.isApprovedTBP == true;
    return approved
        ? ('TBP đã duyệt', AppColors.success)
        : ('Chờ duyệt TBP', AppColors.warning);
  }
}

//---(Info Row)---//

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: valueColor ?? AppColors.enableText,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

//---(Tiny Badge)---//

class _TinyBadge extends StatelessWidget {
  const _TinyBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final safeText = text.trim().isEmpty ? '-' : text.trim();
    final bg = color.withValues(alpha: 0.12);
    final border = color.withValues(alpha: 0.4);

    return Container(
      constraints: const BoxConstraints(maxWidth: 140),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: border),
      ),
      child: Text(
        safeText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

//---(List Header)---//

class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.isSearching,
    required this.selectedProject,
    required this.selectedEmployee,
  });

  final int total;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool isSearching;
  final ApproveProjectFilterItem? selectedProject;
  final ApproveEmployeeFilterItem? selectedEmployee;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy');
    final hasRange = dateStart != null && dateEnd != null;
    final isSameDay = hasRange && _isSameDay(dateStart!, dateEnd!);
    final rangeText = hasRange
        ? (isSameDay
            ? df.format(dateStart!)
            : '${df.format(dateStart!)} - ${df.format(dateEnd!)}')
        : null;

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                        Flexible(
                          child: Text(
                            '$total',
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
                          'phiếu',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      isSearching ? 'Đang tìm kiếm' : 'Tổng số phiếu cần duyệt',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (rangeText != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
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
          if (selectedProject != null || selectedEmployee != null) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: [
                if (selectedProject != null)
                  _FilterChip(
                    label:
                        'Dự án: ${selectedProject!.projectCode ?? selectedProject!.projectName ?? 'N/A'}',
                  ),
                if (selectedEmployee != null)
                  _FilterChip(
                    label:
                        'Người đăng ký: ${selectedEmployee!.fullName ?? 'N/A'}',
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

//---(Filter Chip)---//

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
