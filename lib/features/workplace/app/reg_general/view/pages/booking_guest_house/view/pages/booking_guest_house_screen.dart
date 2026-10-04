// Màn danh sách Đặt phòng nhà nghỉ.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../data/datasource/models/booking_guest_house_model.dart';
import '../bloc/booking_guest_house_bloc.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../widgets/booking_guest_house_card.dart';

class BookingGuestHousePage extends StatefulWidget {
  const BookingGuestHousePage({super.key});

  @override
  State<BookingGuestHousePage> createState() => _BookingGuestHousePageState();
}

class _BookingGuestHousePageState
    extends
        BaseState<
          BookingGuestHousePage,
          BookingGuestHouseEvent,
          BookingGuestHouseState,
          BookingGuestHouseBloc
        > {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    bloc.add(const BookingGuestHouseEvent.init());
    bloc.add(const BookingGuestHouseEvent.loadFilters());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    bloc.add(BookingGuestHouseEvent.changeFilterText(filterText: value.trim()));
  }

  void _openSearch() {
    setState(() => _isSearching = true);
  }

  void _closeSearch() {
    _searchController.clear();
    bloc.add(const BookingGuestHouseEvent.changeFilterText(filterText: ''));
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
        initialStart: bloc.state.dateStart ?? todayStart,
        initialEnd: bloc.state.dateEnd ?? tomorrow,
        onApply: (start, end) {
          bloc.add(
            BookingGuestHouseEvent.changeDateRange(
              dateStart: start,
              dateEnd: end,
            ),
          );
        },
      ),
    );
  }

  Future<void> _openProjectFilter() async {
    final state = bloc.state;
    if (state.projects.isEmpty) {
      bloc.add(const BookingGuestHouseEvent.loadFilters());
    }
    await openSelectBottomSheet<ProjectFilterItem>(
      context: context,
      title: 'Chọn dự án',
      hintText: 'Tìm theo mã / tên dự án',
      items: bloc.state.projects,
      initialSelectedItem: bloc.state.selectedProject,
      displayText: (p) {
        if (p.projectCode != null && p.projectCode!.isNotEmpty) {
          return '${p.projectCode} - ${p.projectName ?? ''}';
        }
        return p.projectName ?? 'N/A';
      },
      onSelected: (project) {
        bloc.add(
          BookingGuestHouseEvent.changeProjectFilter(project: project),
        );
      },
    );
  }

  Future<void> _openEmployeeFilter() async {
    final state = bloc.state;
    if (state.employees.isEmpty) {
      bloc.add(const BookingGuestHouseEvent.loadFilters());
    }
    await openSelectBottomSheet<EmployeeFilterItem>(
      context: context,
      title: 'Chọn người đăng ký',
      hintText: 'Tìm theo tên nhân viên',
      items: bloc.state.employees,
      initialSelectedItem: bloc.state.selectedEmployee,
      displayText: (e) => e.fullName ?? 'N/A',
      onSelected: (employee) {
        bloc.add(
          BookingGuestHouseEvent.changeEmployeeFilter(employee: employee),
        );
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<BookingGuestHouseBloc, BookingGuestHouseState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status ||
          (curr.message != null &&
              curr.message!.isNotEmpty &&
              prev.message != curr.message),
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed &&
            (state.message ?? '').isNotEmpty) {
          showMessage(context, state.message!, type: SnackBarType.error);
        }
      },
      child: BaseScaffold(
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
                  'Đặt phòng nhà nghỉ',
                  style: AppStyles.headingTitle2,
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
              BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
                builder: (context, state) {
                  return Badge(
                    isLabelVisible: state.selectedProject != null,
                    child: IconButton(
                      icon: const Icon(Icons.account_tree_outlined, size: 22),
                      tooltip: 'Lọc theo dự án',
                      onPressed: _openProjectFilter,
                    ),
                  );
                },
              ),
            if (!_isSearching)
              BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
                builder: (context, state) {
                  return Badge(
                    isLabelVisible: state.selectedEmployee != null,
                    child: IconButton(
                      icon: const Icon(Icons.person_search_outlined, size: 22),
                      tooltip: 'Lọc theo người đăng ký',
                      onPressed: _openEmployeeFilter,
                    ),
                  );
                },
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
        body: Stack(
          children: [
            BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
              builder: (context, state) {
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
                          bloc.add(const BookingGuestHouseEvent.refresh());
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
            if (!_isSearching)
              Positioned(
                right: 16,
                bottom: 16 + MediaQuery.of(context).padding.bottom,
                child: FloatingActionButton(
                  heroTag: 'bookingGuestHouseAdd',
                  backgroundColor: AppColors.primaryERP,
                  foregroundColor: Colors.white,
                  tooltip: 'Thêm phiếu đặt',
                  onPressed: () async {
                    // Đợi Add screen pop về → reload list để hiển thị phiếu
                    // vừa tạo (Add screen dispatch submitSuccess khi lưu OK).
                    await context.push(RouteNames.bookingGuestHouseAdd);
                    if (!mounted) return;
                    bloc.add(const BookingGuestHouseEvent.init());
                    bloc.add(const BookingGuestHouseEvent.loadFilters());
                  },
                  child: const Icon(Icons.add),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BookingGuestHouseState state) {
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
        return BookingGuestHouseCard(
          item: item,
          onTap: () {
            // TODO: mở màn chi tiết khi có route
          },
        );
      },
    );
  }
}

/// Header hiển thị tổng số phiếu, khoảng ngày và filter đang áp dụng.
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
  final ProjectFilterItem? selectedProject;
  final EmployeeFilterItem? selectedEmployee;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy');
    final hasRange = dateStart != null && dateEnd != null;
    final isSameDay =
        hasRange && _isSameDay(dateStart!, dateEnd!);
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
              // Tổng số phiếu
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
                      isSearching ? 'Đang tìm kiếm' : 'Tổng số phiếu',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Khoảng ngày
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

          // Filter chips
          if (selectedProject != null || selectedEmployee != null) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: [
                if (selectedProject != null)
                  _FilterChip(
                    label: 'Dự án: ${selectedProject!.projectCode ?? selectedProject!.projectName ?? 'N/A'}',
                  ),
                if (selectedEmployee != null)
                  _FilterChip(
                    label: 'Người đăng ký: ${selectedEmployee!.fullName ?? 'N/A'}',
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

/// Chip hiển thị filter đang áp dụng.
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

