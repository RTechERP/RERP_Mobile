// Màn danh sách Đặt phòng nhà nghỉ.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
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

class _BookingGuestHousePageState extends State<BookingGuestHousePage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  //---(Shorthand — bloc được wrap ở ShellRoute (singleton) và inject qua
  //   BlocProvider.value ở route add/edit; truy cập qua context.read).---//
  BookingGuestHouseBloc get _bloc => context.read<BookingGuestHouseBloc>();
  BookingGuestHouseState get _state => _bloc.state;

  @override
  void initState() {
    super.initState();
    _bloc.add(const BookingGuestHouseEvent.init());
    _bloc.add(const BookingGuestHouseEvent.loadFilters());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _bloc.add(
      BookingGuestHouseEvent.changeFilterText(filterText: value.trim()),
    );
  }

  void _openSearch() {
    setState(() => _isSearching = true);
  }

  void _closeSearch() {
    _searchController.clear();
    _bloc.add(const BookingGuestHouseEvent.changeFilterText(filterText: ''));
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
        initialStart: _state.dateStart ?? todayStart,
        initialEnd: _state.dateEnd ?? tomorrow,
        onApply: (start, end) {
          _bloc.add(
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
    final state = _state;
    if (state.projects.isEmpty) {
      _bloc.add(const BookingGuestHouseEvent.loadFilters());
    }
    await openSelectBottomSheet<ProjectFilterItem>(
      context: context,
      title: 'Chọn dự án',
      hintText: 'Tìm theo mã / tên dự án',
      items: _state.projects,
      initialSelectedItem: _state.selectedProject,
      displayText: (p) {
        if (p.projectCode != null && p.projectCode!.isNotEmpty) {
          return '${p.projectCode} - ${p.projectName ?? ''}';
        }
        return p.projectName ?? 'N/A';
      },
      onSelected: (project) {
        _bloc.add(
          BookingGuestHouseEvent.changeProjectFilter(project: project),
        );
      },
    );
  }

  Future<void> _openEmployeeFilter() async {
    final state = _state;
    if (state.employees.isEmpty) {
      _bloc.add(const BookingGuestHouseEvent.loadFilters());
    }
    await openSelectBottomSheet<EmployeeFilterItem>(
      context: context,
      title: 'Chọn người đăng ký',
      hintText: 'Tìm theo tên nhân viên',
      items: _state.employees,
      initialSelectedItem: _state.selectedEmployee,
      displayText: (e) => e.fullName ?? 'N/A',
      onSelected: (employee) {
        _bloc.add(
          BookingGuestHouseEvent.changeEmployeeFilter(employee: employee),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingGuestHouseBloc, BookingGuestHouseState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.deleteSuccess != curr.deleteSuccess ||
          (curr.message != null &&
              curr.message!.isNotEmpty &&
              prev.message != curr.message),
      listener: (context, state) {
        // Bắt mọi message mới phát ra, không phụ thuộc status — các nhánh chặn
        // xoá (sai RegisterID, không đọc được currentUser) chỉ set message
        // mà không đổi status.
        final message = (state.message ?? '').trim();
        if (message.isNotEmpty) {
          GetIt.I<SnackBarHelper>().showError(context, message);
          return;
        }
        if (state.deleteSuccess) {
          GetIt.I<SnackBarHelper>().showSuccess(
            context,
            'Xoá phiếu đặt phòng thành công',
          );
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
                          _bloc.add(const BookingGuestHouseEvent.refresh());
                          await _bloc.stream.firstWhere(
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
                    _bloc.add(const BookingGuestHouseEvent.init());
                    _bloc.add(const BookingGuestHouseEvent.loadFilters());
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
        final id = item.id;

        return Slidable(
          key: ValueKey('booking_guest_house_$id'),
          groupTag: 'booking_guest_house_slidable',
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.28,
            children: [
              SlidableAction(
                onPressed: (actionContext) async {
                  Slidable.of(actionContext)?.close();
                  final confirmed = await DialogService.showConfirmDelete(
                    context: context,
                  );
                  if (!confirmed || !mounted) return;
                  _bloc.add(BookingGuestHouseEvent.deleteBooking(id: id));
                },
                backgroundColor: AppColors.alert,
                foregroundColor: Colors.white,
                icon: Icons.delete_outline,
                label: 'Xoá',
              ),
            ],
          ),
              child: Builder(
                builder: (slidableCtx) => BookingGuestHouseCard(
                  item: item,
                  onTap: () {
                    Slidable.of(slidableCtx)?.close();
                    // Mở bottomSheet menu gồm 2 action: Chỉnh sửa / Đề nghị
                    // tạm ứng. Trạng thái TBP duyệt hiển thị trên item "Đề
                    // nghị tạm ứng" để user biết có thể tạm ứng chưa.
                    _showBookingActionsSheet(context, item);
                  },
            ),
          ),
        );
      },
    );
  }

  /// Hiển thị bottomSheet menu cho 1 phiếu — gồm:
  /// 1. Chỉnh sửa — mở form edit với id của phiếu.
  /// 2. Đề nghị tạm ứng — mở form TT Quyết toán (settlement screen).
  ///    Màu sáng + sub-label hiển thị trạng thái TBP duyệt để user biết
  ///    phiếu đã đủ điều kiện tạm ứng chưa.
  void _showBookingActionsSheet(
    BuildContext context,
    BookingGuestHouseItem item,
  ) {
    BookingActionsSheet.show(context, item: item);
  }
}

/// Bottom sheet menu cho 1 phiếu Đặt phòng nhà nghỉ.
///
/// Pattern theo `MaterialCategorySheet` của project: handle bar trên đầu +
/// header (icon + tên NV đặt + mã dự án + nút close) + divider + grid các
/// ô danh mục (icon tròn + label). Tap 1 ô → đóng sheet + push route
/// tương ứng.
class BookingActionsSheet extends StatelessWidget {
  const BookingActionsSheet({super.key, required this.item});

  final BookingGuestHouseItem item;

  static Future<void> show(
    BuildContext context, {
    required BookingGuestHouseItem item,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BookingActionsSheet(item: item),
    );
  }

  String get _headerName => (item.fullName ?? '').trim().isEmpty
      ? 'Đặt phòng nhà nghỉ'
      : (item.fullName ?? '').trim();

  /// Trạng thái duyệt TBP dựa trên `approvedTBP` (int) trong model.
  /// null/0 = chưa duyệt, 1 = đã duyệt, 2 = từ chối.
  TbpStatus get _tbpStatus {
    final raw = item.approvedTBP;
    if (raw is int) {
      switch (raw) {
        case 1:
          return TbpStatus.approved;
        case 2:
          return TbpStatus.rejected;
        default:
          return TbpStatus.pending;
      }
    }
    if (raw is num) {
      if (raw == 1) return TbpStatus.approved;
      if (raw == 2) return TbpStatus.rejected;
    }
    // Fallback: dùng `isApprovedTBP` (bool) nếu server không trả int.
    if (item.isApprovedTBP == true) return TbpStatus.approved;
    return TbpStatus.pending;
  }

  @override
  Widget build(BuildContext context) {
    final status = _tbpStatus;
    final approvedColor = Colors.green.shade600;
    final pendingColor = Colors.amber.shade700;
    final rejectedColor = Colors.red.shade600;
    final tileColor = switch (status) {
      TbpStatus.approved => approvedColor,
      TbpStatus.pending => pendingColor,
      TbpStatus.rejected => rejectedColor,
    };

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header — icon + tên NV + statusChip TBP + nút close
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.hotel_outlined,
                    color: AppColors.primaryERP,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _headerName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.enableText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      _StatusChip(status: status),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppColors.gray),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Grid danh mục hành động — y hệt MaterialCategorySheet.
          Flexible(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _CategoryTile(
                    label: 'Chỉnh sửa',
                    icon: Icons.edit_outlined,
                    color: AppColors.primaryERP,
                    onTap: () {
                      Navigator.pop(context);
                      context.push(
                        RouteNames.bookingGuestHouseEdit,
                        extra: item.id,
                      );
                    },
                  );
                }
                if (index == 1) {
                  return _CategoryTile(
                    label: 'Cập nhật quyết toán',
                    icon: Icons.edit_note_outlined,
                    color: tileColor,
                    onTap: () {
                      Navigator.pop(context);
                      context.push(
                        RouteNames.bookingGuestHouseSettlement,
                        extra: item.id,
                      );
                    },
                  );
                }
                return _CategoryTile(
                  label: 'Đề nghị tạm ứng',
                  icon: Icons.receipt_long_outlined,
                  color: tileColor,
                  onTap: () {
                    Navigator.pop(context);
                    context.push(
                      RouteNames.bookingGuestHouseAdvance,
                      extra: item.id,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 3 trạng thái duyệt TBP dùng để chọn màu chip + màu tile "Tạm ứng".
enum TbpStatus { approved, pending, rejected }

/// Chip hiển thị trạng thái TBP — pill nhỏ với nền + chữ theo màu trạng thái.
/// Đã duyệt → xanh lá, chờ duyệt → vàng, từ chối → đỏ.
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final TbpStatus status;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, label) = switch (status) {
      TbpStatus.approved => (
        Colors.green.shade50,
        Colors.green.shade700,
        'Đã duyệt TBP',
      ),
      TbpStatus.pending => (
        Colors.amber.shade50,
        Colors.amber.shade800,
        'Chờ duyệt TBP',
      ),
      TbpStatus.rejected => (
        Colors.red.shade50,
        Colors.red.shade700,
        'Từ chối TBP',
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: fg.withValues(alpha: 0.3), width: 0.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: fg,
          height: 1.2,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

/// Một ô hành động trong grid — y hệt `_CategoryTile` của
/// `MaterialCategorySheet`. Mỗi ô có nền màu nhạt + viền + icon tròn
/// ở giữa + label bên dưới.
class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: color.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.enableText,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
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

